# Copyright 2023 Advanced Micro Devices, Inc
#
# Licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

"""Custom op integration into the eager executor."""

from timeit import default_timer
from typing import Optional

import torch

from iree.runtime import (
    HalBufferView,
    VmVariantList,
)

from ...support.exceptions import (
    UnsupportedTypeError,
)

from ...support.logging import (
    runtime_logger as logger,
)

from ..device import (
    Device,
    lookup_device_from_torch,
)

from .base import (
    KernelSelection,
)

from .compiler import (
    compile_standalone_kernel,
)

__all__ = [
    "eager_dispatch",
]


def eager_dispatch(ksel: KernelSelection):
    """Main entry-point for handling dispatch of a selected kernel via a generator."""
    # Scan arg descs and decide on a compute device.
    # For now, we compute on the first device that we support.
    # This is very simplisitic and will need to be extended for multi-device, etc.
    device: Optional[Device] = None
    torch_device: Optional[torch.device] = None
    for arg_desc in ksel.arg_descs:
        if not arg_desc.is_ir_arg:
            continue
        tensor_arg = arg_desc.maybe_tensor_value
        if tensor_arg is None:
            continue
        torch_device = tensor_arg.device
        device = lookup_device_from_torch(torch_device)
        if device is not None:
            break

    # Default to CPU.
    if device is None:
        logger.debug("Fallback to CPU device due to no supported device in arguments")
        torch_device = torch.device("cpu")
        device = lookup_device_from_torch(torch_device)

    # Compile.
    # TODO: We can do compilation asynchronously with the device movement
    vm_context, vm_f, config = compile_standalone_kernel(device, ksel)

    # Build the concrete args, issuing device movement as necessary.
    arg_list = VmVariantList(len(ksel.arg_descs))
    for arg_desc in ksel.arg_descs:
        if not arg_desc.is_ir_arg:
            continue
        tensor_arg = arg_desc.maybe_tensor_value
        # Handle non-tensor args.
        if tensor_arg is None:
            scalar_value = arg_desc.v
            if isinstance(scalar_value, int):
                arg_list.push_int(scalar_value)
            elif isinstance(scalar_value, float):
                arg_list.push_float(scalar_value)
            else:
                raise UnsupportedTypeError(type(scalar_value))
            continue
        # Tensor arg.
        if tensor_arg.device != torch_device:
            # TODO: If the source and target device are both known to us,
            # we can do this "in house" vs asking torch to do it.
            tensor_arg = tensor_arg.to(torch_device)
        if not tensor_arg.is_contiguous():
            if config.layout_specialized:
                raise NotImplementedError(
                    "Layout specialized kernels are not yet implemented"
                )
            tensor_arg = tensor_arg.contiguous()
        # Since we know we are on the same device, we can use the unsafe
        # import_torch_tensor.
        arg_list.push_ref(device.import_torch_tensor(tensor_arg))

    if config.async_invocations:
        raise NotImplementedError("Async execution not yet implemented")

    # Invoke.
    ret_list = VmVariantList(len(ksel.result_descs))
    start = default_timer()
    vm_context.invoke(vm_f, arg_list, ret_list)
    invoke_time = default_timer() - start
    logger.debug("Kernel invocation %s: %sms", config.key, invoke_time * 1000)

    # Unpack results.
    results = []

    for i, result_desc in enumerate(ksel.result_descs):
        meta_tensor_value = result_desc.maybe_tensor_value
        if meta_tensor_value is None:
            # Scalar return.
            raise NotImplementedError("CustomOp scalar return")

        # Tensor return. The meta tensor value already has the correct torch
        # dtype and shape, so we just need to export and return it for the
        # appropriate device.
        bv: HalBufferView = HalBufferView.__iree_vm_cast__(ret_list.get_as_ref(i))
        results.append(device.export_torch_tensor(bv, meta_tensor_value))

    if len(results) == 1:
        return results[0]
    else:
        return tuple(results)
