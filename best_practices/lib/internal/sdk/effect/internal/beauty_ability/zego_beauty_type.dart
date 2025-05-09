/// @nodoc
enum ZegoBeautyType {
  // nothing.
  beautyNone,

  // Beauty
  // Beauty - Basic
  beautyBasicSmoothing,
  beautyBasicSkinTone,
  beautyBasicBlusher,
  beautyBasicSharpening,
  beautyBasicWrinkles,
  beautyBasicDarkCircles,

  // Beauty - Advanced
  beautyAdvancedFaceSlimming,
  beautyAdvancedEyesEnlarging,
  beautyAdvancedEyesBrightening,
  beautyAdvancedChinLengthening,
  beautyAdvancedMouthReshape,
  beautyAdvancedTeethWhitening,
  beautyAdvancedNoseSlimming,
  beautyAdvancedNoseLengthening,
  beautyAdvancedFaceShortening,
  beautyAdvancedMandibleSlimming,
  beautyAdvancedCheekboneSlimming,
  beautyAdvancedForeheadSlimming,

  // Beauty - Makeup
  // Beauty - Makeup - Lipstick
  beautyMakeupLipstickCameoPink,
  beautyMakeupLipstickSweetOrange,
  beautyMakeupLipstickRustRed,
  beautyMakeupLipstickCoral,
  beautyMakeupLipstickRedVelvet,

  // Beauty - Makeup - Blusher
  beautyMakeupBlusherSlightlyDrunk,
  beautyMakeupBlusherPeach,
  beautyMakeupBlusherMilkyOrange,
  beautyMakeupBlusherAprocitPink,
  beautyMakeupBlusherSweetOrange,

  // Beauty - Makeup - Eyelashes
  beautyMakeupEyelashesNatural,
  beautyMakeupEyelashesTender,
  beautyMakeupEyelashesCurl,
  beautyMakeupEyelashesEverlong,
  beautyMakeupEyelashesThick,

  // Beauty - Makeup - Eyeliner
  beautyMakeupEyelinerNatural,
  beautyMakeupEyelinerCatEye,
  beautyMakeupEyelinerNaughty,
  beautyMakeupEyelinerInnocent,
  beautyMakeupEyelinerDignified,

  // Beauty - Makeup - Eyeshadow
  beautyMakeupEyeshadowPinkMist,
  beautyMakeupEyeshadowShimmerPink,
  beautyMakeupEyeshadowTeaBrown,
  beautyMakeupEyeshadowBrightOrange,
  beautyMakeupEyeshadowMochaBrown,

  // Beauty - Makeup - Colored Contacts
  beautyMakeupColoredContactsDarknightBlack,
  beautyMakeupColoredContactsStarryBlue,
  beautyMakeupColoredContactsBrownGreen,
  beautyMakeupColoredContactsLightsBrown,
  beautyMakeupColoredContactsChocolateBrown,

  // Beauty - Style Makeup
  beautyStyleMakeupInnocentEyes,
  beautyStyleMakeupMilkyEyes,
  beautyStyleMakeupCutieCool,
  beautyStyleMakeupPureSexy,
  beautyStyleMakeupFlawless,

  // Filters
  // Filters - Natural
  filterNaturalCreamy,
  filterNaturalBrighten,
  filterNaturalFresh,
  filterNaturalAutumn,

  // Filters - Gray
  filterGrayMonet,
  filterGrayNight,
  filterGrayFilmlike,

  // Filters - Dreamy
  filterDreamySunset,
  filterDreamyCozily,
  filterDreamySweet,

  // Background
  // backgroundGreenScreenSegmentation,
  backgroundPortraitSegmentation,
  backgroundMosaicing,
  backgroundGaussianBlur,

  // Reset
  beautyBasicReset,
  beautyAdvancedReset,
  beautyMakeupLipstickReset,
  beautyMakeupBlusherReset,
  beautyMakeupEyelashesReset,
  beautyMakeupEyelinerReset,
  beautyMakeupEyeshadowReset,
  beautyMakeupColoredContactsReset,
  beautyStyleMakeupReset,
  filterReset,
  backgroundReset,
}

extension ZegoBeautyTypePath on ZegoBeautyType {
  String path(String folder) {
    if (index >= ZegoBeautyType.beautyBasicReset.index ||
        this == ZegoBeautyType.beautyNone) {
      return '';
    }
    return '$folder/AdvancedResources/$name.bundle';
  }
}

extension ZegoBeautyTypeName on ZegoBeautyType {
  String get bundleName {
    // It should correspond one-to-one with the bundle name in the resource!!
    switch (this) {
      case ZegoBeautyType.beautyMakeupLipstickReset:
        return "";
      case ZegoBeautyType.beautyMakeupBlusherReset:
        return "";
      case ZegoBeautyType.beautyMakeupEyelashesReset:
        return "";
      case ZegoBeautyType.beautyMakeupEyelinerReset:
        return "";
      case ZegoBeautyType.beautyMakeupEyeshadowReset:
        return "";
      case ZegoBeautyType.beautyMakeupColoredContactsReset:
        return "";
      case ZegoBeautyType.beautyStyleMakeupReset:
        return "";
      case ZegoBeautyType.filterReset:
        return "";
      // Lipstick
      case ZegoBeautyType.beautyMakeupLipstickCameoPink:
        return 'lipstickdir_bean_paste_pink';
      case ZegoBeautyType.beautyMakeupLipstickSweetOrange:
        return 'lipstickdir_sweet_orange';
      case ZegoBeautyType.beautyMakeupLipstickRustRed:
        return 'lipstickdir_rust_red';
      case ZegoBeautyType.beautyMakeupLipstickCoral:
        return 'lipstickdir_coral';
      case ZegoBeautyType.beautyMakeupLipstickRedVelvet:
        return 'lipstickdir_velvet_red';
      // Blusher
      case ZegoBeautyType.beautyMakeupBlusherSlightlyDrunk:
        return 'blusherdir_slightly_drunk';
      case ZegoBeautyType.beautyMakeupBlusherPeach:
        return 'blusherdir_peach';
      case ZegoBeautyType.beautyMakeupBlusherMilkyOrange:
        return 'blusherdir_milk_orange';
      case ZegoBeautyType.beautyMakeupBlusherAprocitPink:
        return 'blusherdir_apricot_pink';
      case ZegoBeautyType.beautyMakeupBlusherSweetOrange:
        return 'blusherdir_sweet_orange';
      // Eyelashes
      case ZegoBeautyType.beautyMakeupEyelashesNatural:
        return 'eyelashesdir_natural';
      case ZegoBeautyType.beautyMakeupEyelashesTender:
        return 'eyelashesdir_tender';
      case ZegoBeautyType.beautyMakeupEyelashesCurl:
        return 'eyelashesdir_curl';
      case ZegoBeautyType.beautyMakeupEyelashesEverlong:
        return 'eyelashesdir_slender';
      case ZegoBeautyType.beautyMakeupEyelashesThick:
        return 'eyelashesdir_bushy';
      // Eyeliner
      case ZegoBeautyType.beautyMakeupEyelinerNatural:
        return 'eyelinerdir_natural';
      case ZegoBeautyType.beautyMakeupEyelinerCatEye:
        return 'eyelinerdir_wildcat';
      case ZegoBeautyType.beautyMakeupEyelinerNaughty:
        return 'eyelinerdir_scheming';
      case ZegoBeautyType.beautyMakeupEyelinerInnocent:
        return 'eyelinerdir_temperament';
      case ZegoBeautyType.beautyMakeupEyelinerDignified:
        return 'eyelinerdir_pretty';
      // Eyeshadow
      case ZegoBeautyType.beautyMakeupEyeshadowPinkMist:
        return 'eyeshadowdir_mist_pink';
      case ZegoBeautyType.beautyMakeupEyeshadowShimmerPink:
        return 'eyeshadowdir_shimmer_pink';
      case ZegoBeautyType.beautyMakeupEyeshadowTeaBrown:
        return 'eyeshadowdir_tea_brown';
      case ZegoBeautyType.beautyMakeupEyeshadowBrightOrange:
        return 'eyeshadowdir_vitality_orange';
      case ZegoBeautyType.beautyMakeupEyeshadowMochaBrown:
        return 'eyeshadowdir_mocha_brown';
      // Colored Contacts
      case ZegoBeautyType.beautyMakeupColoredContactsDarknightBlack:
        return 'coloredcontactsdir_darknight_black';
      case ZegoBeautyType.beautyMakeupColoredContactsStarryBlue:
        return 'coloredcontactsdir_starry_blue';
      case ZegoBeautyType.beautyMakeupColoredContactsBrownGreen:
        return 'coloredcontactsdir_mystery_brown_green';
      case ZegoBeautyType.beautyMakeupColoredContactsLightsBrown:
        return 'coloredcontactsdir_polar_lights_brown';
      case ZegoBeautyType.beautyMakeupColoredContactsChocolateBrown:
        return 'coloredcontactsdir_chocolate_brown';
      // Style Makeup
      case ZegoBeautyType.beautyStyleMakeupInnocentEyes:
        return 'makeupdir_vulnerable_and_innocenteyes';
      case ZegoBeautyType.beautyStyleMakeupMilkyEyes:
        return 'makeupdir_milky_eyes';
      case ZegoBeautyType.beautyStyleMakeupCutieCool:
        return 'makeupdir_cutie_and_cool';
      case ZegoBeautyType.beautyStyleMakeupPureSexy:
        return 'makeupdir_pure_and_sexy';
      case ZegoBeautyType.beautyStyleMakeupFlawless:
        return 'makeupdir_flawless';
      // Filters - Natural
      case ZegoBeautyType.filterNaturalCreamy:
        return 'Creamy';
      case ZegoBeautyType.filterNaturalBrighten:
        return 'Brighten';
      case ZegoBeautyType.filterNaturalFresh:
        return 'Fresh';
      case ZegoBeautyType.filterNaturalAutumn:
        return 'Autumn';
      // Filters - Gray
      case ZegoBeautyType.filterGrayMonet:
        return 'Cool';
      case ZegoBeautyType.filterGrayNight:
        return 'Night';
      case ZegoBeautyType.filterGrayFilmlike:
        return 'Film-like';
      // Filters - Dreamy
      case ZegoBeautyType.filterDreamySunset:
        return 'Sunset';
      case ZegoBeautyType.filterDreamyCozily:
        return 'Cozily';
      case ZegoBeautyType.filterDreamySweet:
        return 'Sweet';
      default:
        return toString().split('.').last;
    }
  }
}
