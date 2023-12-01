from typing import assert_type

from .._support.tracing import (
    CompiledContext,
    custom_primitive_fn,
    eager_context,
)

__all__ = [
    "program_id",
]


def _compiled_program_id(context: CompiledContext, axis):
    # Compiled. Note that tracing must be open coded on this
    # function because it does not take a proxy as an argument
    # (and therefore, the symbolic tracer exempts it from tracing
    # according to its heuristic).
    proxy = context.tracer.create_proxy("call_function", program_id, (axis,), {})
    return proxy


@custom_primitive_fn(compiled=_compiled_program_id)
def program_id(axis: int) -> int:
    """Access the program id value for the given grid axis."""
    context = eager_context()
    assert axis >= 0 and axis < context.rank
    return context.current_thread[axis]
