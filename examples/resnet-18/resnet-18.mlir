module @wtfamidoing {
  util.global private @_params.resnet.embedder.embedder.convolution.weight {noinline} : tensor<64x3x7x7xf32>
  util.global private @_params.resnet.embedder.embedder.normalization.weight {noinline} : tensor<64xf32>
  util.global private @_params.resnet.embedder.embedder.normalization.bias {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.0.convolution.weight {noinline} : tensor<64x64x3x3xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.0.normalization.weight {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.0.normalization.bias {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.1.convolution.weight {noinline} : tensor<64x64x3x3xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.1.normalization.weight {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.0.layer.1.normalization.bias {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.0.convolution.weight {noinline} : tensor<64x64x3x3xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.0.normalization.weight {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.0.normalization.bias {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.1.convolution.weight {noinline} : tensor<64x64x3x3xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.1.normalization.weight {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.0.layers.1.layer.1.normalization.bias {noinline} : tensor<64xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.shortcut.convolution.weight {noinline} : tensor<128x64x1x1xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.shortcut.normalization.weight {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.shortcut.normalization.bias {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.0.convolution.weight {noinline} : tensor<128x64x3x3xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.0.normalization.weight {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.0.normalization.bias {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.1.convolution.weight {noinline} : tensor<128x128x3x3xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.1.normalization.weight {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.0.layer.1.normalization.bias {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.0.convolution.weight {noinline} : tensor<128x128x3x3xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.0.normalization.weight {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.0.normalization.bias {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.1.convolution.weight {noinline} : tensor<128x128x3x3xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.1.normalization.weight {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.1.layers.1.layer.1.normalization.bias {noinline} : tensor<128xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.shortcut.convolution.weight {noinline} : tensor<256x128x1x1xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.shortcut.normalization.weight {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.shortcut.normalization.bias {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.0.convolution.weight {noinline} : tensor<256x128x3x3xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.0.normalization.weight {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.0.normalization.bias {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.1.convolution.weight {noinline} : tensor<256x256x3x3xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.1.normalization.weight {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.0.layer.1.normalization.bias {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.0.convolution.weight {noinline} : tensor<256x256x3x3xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.0.normalization.weight {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.0.normalization.bias {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.1.convolution.weight {noinline} : tensor<256x256x3x3xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.1.normalization.weight {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.2.layers.1.layer.1.normalization.bias {noinline} : tensor<256xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.shortcut.convolution.weight {noinline} : tensor<512x256x1x1xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.shortcut.normalization.weight {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.shortcut.normalization.bias {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.0.convolution.weight {noinline} : tensor<512x256x3x3xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.0.normalization.weight {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.0.normalization.bias {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.1.convolution.weight {noinline} : tensor<512x512x3x3xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.1.normalization.weight {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.0.layer.1.normalization.bias {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.0.convolution.weight {noinline} : tensor<512x512x3x3xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.0.normalization.weight {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.0.normalization.bias {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.1.convolution.weight {noinline} : tensor<512x512x3x3xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.1.normalization.weight {noinline} : tensor<512xf32>
  util.global private @_params.resnet.encoder.stages.3.layers.1.layer.1.normalization.bias {noinline} : tensor<512xf32>
  util.global private @_params.classifier.1.weight {noinline} : tensor<1000x512xf32>
  util.global private @_params.classifier.1.bias {noinline} : tensor<1000xf32>
}
