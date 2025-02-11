import 'package:flutter/material.dart';
import 'package:zego_effects_plugin/zego_effects_defines.dart';
import 'package:zego_effects_plugin/zego_effects_plugin.dart';

abstract class ZegoBeautyEditor {
  void enable(bool enable);
  void apply(int value);
}

/// Basic
class ZegoSmoothingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableSmooth(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setSmoothParam(ZegoEffectsSmoothParam()..intensity = value);
  }
}

class ZegoSkinToneEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableWhiten(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setWhitenParam(ZegoEffectsWhitenParam()..intensity = value);
  }
}

class ZegoBlusherEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableRosy(enable);
  }

  @override
  void apply(int value) {
    final param = ZegoEffectsRosyParam()..intensity = value;
    ZegoEffectsPlugin.instance.setRosyParam(param);
  }
}

class ZegoSharpeningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableSharpen(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setSharpenParam(ZegoEffectsSharpenParam()..intensity = value);
  }
}

class ZegoWrinklesEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableWrinklesRemoving(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setWrinklesRemovingParam(ZegoEffectsWrinklesRemovingParam()..intensity = value);
  }
}

class ZegoDarkCirclesEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableDarkCirclesRemoving(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setDarkCirclesRemovingParam(ZegoEffectsDarkCirclesRemovingParam()..intensity = value);
  }
}

/// Advanced
class ZegoFaceSlimmingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableFaceLifting(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setFaceLiftingParam(ZegoEffectsFaceLiftingParam()..intensity = value);
  }
}

class ZegoEyesEnlargingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableBigEyes(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setBigEyesParam(ZegoEffectsBigEyesParam()..intensity = value);
  }
}

class ZegoEyesBrighteningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableEyesBrightening(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setEyesBrighteningParam(ZegoEffectsEyesBrighteningParam()..intensity = value);
  }
}

class ZegoChinLengtheningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableLongChin(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setLongChinParam(ZegoEffectsLongChinParam()..intensity = value);
  }
}

class ZegoMouthReshapeEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableSmallMouth(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setSmallMouthParam(ZegoEffectsSmallMouthParam()..intensity = value);
  }
}

class ZegoTeethWhiteningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableTeethWhitening(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setTeethWhiteningParam(ZegoEffectsTeethWhiteningParam()..intensity = value);
  }
}

class ZegoNoseSlimmingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableNoseNarrowing(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setNoseNarrowingParam(ZegoEffectsNoseNarrowingParam()..intensity = value);
  }
}

class ZegoNoseLengtheningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableNoseLengthening(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setNoseLengtheningParam(ZegoEffectsNoseLengtheningParam()..intensity = value);
  }
}

class ZegoFaceShorteningEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableFaceShortening(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setFaceShorteningParam(ZegoEffectsFaceShorteningParam()..intensity = value);
  }
}

class ZegoMandibleSlimmingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableMandibleSlimming(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setMandibleSlimmingParam(ZegoEffectsMandibleSlimmingParam()..intensity = value);
  }
}

class ZegoCheekboneSlimmingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableCheekboneSlimming(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setCheekboneSlimmingParam(ZegoEffectsCheekboneSlimmingParam()..intensity = value);
  }
}

class ZegoForeheadSlimmingEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enableForeheadShortening(enable);
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setForeheadShorteningParam(ZegoEffectsForeheadShorteningParam()..intensity = value);
  }
}

/// Filters
class ZegoFilterEditor implements ZegoBeautyEditor {
  final String name;

  ZegoFilterEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setFilter(enable ? name : '');
    debugPrint('setFilter() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setFilterParam(ZegoEffectsFilterParam()..intensity = value);
  }
}

/// Makeup
class ZegoLipstickEditor implements ZegoBeautyEditor {
  final String name;
  ZegoLipstickEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setLipstick(enable ? name : '');
    debugPrint('setLipstick() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setLipstickParam(ZegoEffectsLipstickParam()..intensity = value);
  }
}

class ZegoBlusherMakeupEditor implements ZegoBeautyEditor {
  final String name;
  ZegoBlusherMakeupEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setBlusher(enable ? name : '');
    debugPrint('setBlusherPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setBlusherParam(ZegoEffectsBlusherParam()..intensity = value);
  }
}

class ZegoEyelashesEditor implements ZegoBeautyEditor {
  final String name;
  ZegoEyelashesEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setEyelashes(enable ? name : '');
    debugPrint(
        'setEyelashesPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setEyelashesParam(ZegoEffectsEyelashesParam()..intensity = value);
  }
}

class ZegoEyelinerEditor implements ZegoBeautyEditor {
  final String name;
  ZegoEyelinerEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setEyeliner(enable ? name : '');
    debugPrint(
        'setEyelinerPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setEyelinerParam(ZegoEffectsEyelinerParam()..intensity = value);
  }
}

class ZegoEyeshadowEditor implements ZegoBeautyEditor {
  final String name;
  ZegoEyeshadowEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setEyeshadow(enable ? name : '');
    debugPrint(
        'setEyeshadowPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setEyeshadowParam(ZegoEffectsEyeshadowParam()..intensity = value);
  }
}

class ZegoColoredContactsEditor implements ZegoBeautyEditor {
  final String name;
  ZegoColoredContactsEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setColoredcontacts(enable ? name : '');
    debugPrint(
        'setColoredcontactsPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setColoredcontactsParam(ZegoEffectsColoredcontactsParam()..intensity = value);
  }
}

/// Style Makeup
class ZegoStyleMakeupEditor implements ZegoBeautyEditor {
  final String name;
  ZegoStyleMakeupEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setMakeup(enable ? name : '');
    debugPrint('setMakeupPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setMakeupParam(ZegoEffectsMakeupParam()..intensity = value);
  }
}

/// Stickers
class ZegoStickerEditor implements ZegoBeautyEditor {
  final String name;

  ZegoStickerEditor({
    required this.name,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.setPendant(enable ? name : '');
    debugPrint('setPendantPath() called with: enable = [$enable], name: $name');
  }

  @override
  void apply(int value) {}
}

/// Background
class ZegoPortraitSegmentationEditor implements ZegoBeautyEditor {
  final String path;

  ZegoPortraitSegmentationEditor({
    required this.path,
  });

  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance
        .setPortraitSegmentationBackgroundPath(enable ? path : '', ZegoEffectsScaleMode.AspectFill);
    ZegoEffectsPlugin.instance.enablePortraitSegmentation(enable);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackground(enable);
    debugPrint('enablePortraitSegmentationBackground() called with: enable = [$enable], path: $path');
  }

  @override
  void apply(int value) {}
}

class ZegoMosaicEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enablePortraitSegmentation(enable);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackgroundMosaic(enable);
    debugPrint('enablePortraitSegmentationBackgroundMosaic() called with: enable = [$enable]');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setPortraitSegmentationBackgroundMosaicParam(ZegoEffectsMosaicParam()
      ..intesity = value
      ..type = ZegoEffectsMosaicType.Square);
  }
}

class ZegoBlurEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enablePortraitSegmentation(enable);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackgroundBlur(enable);
    debugPrint('enablePortraitSegmentationBackgroundBlur() called with: enable = [$enable]');
  }

  @override
  void apply(int value) {
    ZegoEffectsPlugin.instance.setPortraitSegmentationBackgroundBlurParam(ZegoEffectsBlurParam()..intensity = value);
  }
}

/// Reseet
class ZegoBasicResetEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {}

  @override
  void apply(int value) {}
}

class ZegoAdvancedResetEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {}

  @override
  void apply(int value) {}
}

class ZegoBackgroundResetEditor implements ZegoBeautyEditor {
  @override
  void enable(bool enable) {
    ZegoEffectsPlugin.instance.enablePortraitSegmentation(false);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackground(false);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackgroundMosaic(false);
    ZegoEffectsPlugin.instance.enablePortraitSegmentationBackgroundBlur(false);
  }

  @override
  void apply(int value) {}
}
