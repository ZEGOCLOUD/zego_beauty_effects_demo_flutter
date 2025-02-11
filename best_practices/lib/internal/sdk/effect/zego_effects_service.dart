import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_effects_plugin/zego_effects_plugin.dart';

import '../../../zego_sdk_manager.dart';
import 'internal/beauty_ability/zego_beauty_ability.dart';
import 'internal/beauty_ability/zego_beauty_type.dart';
import 'internal/zego_effects_service_extension.dart';

class EffectsService {
  EffectsService._internal();
  factory EffectsService() => instance;
  static final EffectsService instance = EffectsService._internal();

  final methodChannel = const MethodChannel('zego_beauty_effects');

  int appID = 0;
  String appSign = '';

  final backendApiUrl =
      'https://aieffects-api.zego.im?Action=DescribeEffectsLicense';

  final beautyAbilities = <ZegoBeautyType, ZegoBeautyAbility>{};

  Future<void> init(int appID, String appSign) async {
    this.appID = appID;
    this.appSign = appSign;

    initEffects(appID, appSign);
  }

  Future<void> unInit() async {
    await ZegoEffectsPlugin.instance.destroy();
  }

//
  Future<void> initEffects(int appID, String appSign) async {
    await ZegoEffectsPlugin.instance.setResources();

    final resourcesFolder =
        await ZEGOSDKManager().effectsService.getResourcePath();
    final portraitSegmentationImagePath =
        '$resourcesFolder/Backgrounds.bundle/animal.jpg';

    final createRet = await ZegoEffectsPlugin.instance.create(appID, appSign);
    debugPrint('ZegoEffectsPlugin create result: $createRet');

    await ZegoEffectsPlugin.instance.enableImageProcessing(true);

    // callback of effects sdk.
    await ZegoEffectsPlugin.registerEventCallback(
      onEffectsError: onEffectsError,
      onEffectsFaceDetected: onEffectsFaceDetected,
    );

    initBeautyAbilities(
      portraitSegmentationImagePath: portraitSegmentationImagePath,
    );

    await ZegoEffectsPlugin.instance.enableFaceDetection(true);
  }

  void onEffectsError(int errorCode, String desc) {
    debugPrint('effects errorCode: $errorCode, desc: $desc');
    if (errorCode == 5000002) {
      init(appID, appSign);
    }
  }

  void onEffectsFaceDetected(double score, Point point, Size size) {
    debugPrint(
        'onEffectsFaceDetected, score: $score, point: $point, size: $size');
  }

  Future<String> getResourcePath() async {
    var resourceFolder = await ZegoEffectsPlugin.instance.getResourcesFolder();

    //iOS bundle directly into the app, there is no Resources layer. Here is a special treatment.
    if (Platform.isAndroid) {
      return '$resourceFolder/Resources';
    } else if (Platform.isIOS) {
      return resourceFolder;
    }
    return '';
  }
}
