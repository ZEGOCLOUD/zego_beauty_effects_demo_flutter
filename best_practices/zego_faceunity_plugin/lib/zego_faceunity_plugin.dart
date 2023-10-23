import 'dart:async';

import 'package:flutter/services.dart';

enum ZegoCustomSourceType { Camera }

enum ZegoCameraPosition { Front, Back }

class ZegoFaceunityPlugin {
  static const MethodChannel _channel = MethodChannel('zego_faceunity_plugin');

  /// Private constructor
  ZegoFaceunityPlugin._internal();

  static final ZegoFaceunityPlugin instance = ZegoFaceunityPlugin._internal();

  Future<dynamic> init() async => _channel.invokeMethod('init', {});
  Future<dynamic> uninit() async => _channel.invokeMethod('uninit', {});

  Future<dynamic> setBeautyOption(
      {double faceWhiten = -1.0,
      double faceRed = -1.0,
      double faceBlur = -1.0,
      double eyeEnlarging = -1.0,
      double cheekThinning = -1.0,
      double cheekV = -1.0,
      double cheekNarrow = -1.0,
      double cheekSmall = -1.0,
      double chinLevel = -1.0,
      double foreHeadLevel = -1.0,
      double noseLevel = -1.0,
      double mouthLevel = -1.0}) async {
    return _channel.invokeMethod('setBeautyOption', {
      'faceWhiten': faceWhiten,
      'faceRed': faceRed,
      'faceBlur': faceBlur,
      'eyeEnlarging': eyeEnlarging,
      'cheekThinning': cheekThinning,
      'cheekV': cheekV,
      'cheekNarrow': cheekNarrow,
      'cheekSmall': cheekSmall,
      'chinLevel': chinLevel,
      'foreHeadLevel': foreHeadLevel,
      'noseLevel': noseLevel,
      'mouthLevel': mouthLevel
    });
  }
}
