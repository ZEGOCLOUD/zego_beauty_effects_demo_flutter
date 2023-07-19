# Advanced beauty effects

## Prerequisites

Before you begin, make sure you complete the following:

* **Contact ZEGOCLOUD Technical Support to activate the advanced beauty effects**.

## Getting started

### Integrate the SDK

Copy the dart files to your own project.

<img src='https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/flutter/code_folder.png'>

### Add icon image resources

Copy the image resources `beautyIcons` folder into your own project.

<img src='https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/flutter/beauty_icons.png'>

### Add beauty effects resources

Advanced beauty effects require corresponding beauty resources to be effective.

#### Download resources

Click to download the [beauty resources](https://storage.zego.im/sdk-doc/Pics/zegocloud/uikit/BeautyResources.zip), and extract the resources to your local folder.

<img src="https://storage.zego.im/sdk-doc/Pics/ZegoUIKit/live/effects/beauty_resources.png">

#### Add resources

##### Android

1. Create an assets folder under the `main` directory of your Android project (no need to create one if the assets folder already exists), like this: **xxx/android/app/src/main/assets**
2. Copy the downloaded `BeautyResources` folder to the assets directory.

##### iOS

1. Open your project with Xcode.

2. Drag the downloaded `BeautyResources` folder to the directory, and select `Create folder references`.

   <img src="https://storage.zego.im/sdk-doc/Pics/ZegoUIKit/live/effects/add_folder.png" width = 500>

   <img src='https://storage.zego.im/sdk-doc/Pics/ZegoUIKit/live/effects/add_folder_ret.png' width = 500>

### Add native codes

To implement the beauty function, additional native code needs to be added.

#### Android

1. Copy the following code into your own project.

<img src='https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/flutter/code_file_android.png'>

2. Then add the following code to `MainActivity`.

   ```kotlin
   import io.flutter.embedding.android.FlutterActivity
   import io.flutter.embedding.engine.FlutterEngine
   
   class MainActivity: FlutterActivity() {
     
     	// Add this code.
       override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
           super.configureFlutterEngine(flutterEngine)
           ZegoBeautyPlugin(flutterEngine.dartExecutor.binaryMessenger, context)
       }
   }
   ```

#### iOS

1. Copy the following code into your own project.

   <img src='https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/flutter/code_file_ios.png'>

2. Then add the following code to `AppDelegate.swift`.

   ```swift
   import UIKit
   import Flutter
   
   @UIApplicationMain
   @objc class AppDelegate: FlutterAppDelegate {
     override func application(
       _ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
     ) -> Bool {
       GeneratedPluginRegistrant.register(with: self)
         
       // Add this code.
       ZegoBeautyPlugin.register(with: registrar(forPlugin: "ZegoBeautyPlugin")!)
         
       return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
   }
   ```

### Add dart code

#### Add the initialization code

```dart
await ZEGOSDKManager.instance.init(YOUR_APP_ID, YOUR_APP_SIGN);
```

#### ConnectUser

```dart
await ZEGOSDKManager.instance.connectUser(userID, userName);
```

#### Add Beauty Button

```dart
  Widget beautyEffectButton() {
    return IconButton(
        onPressed: () {
          // call this method to show beauty effect sheet.
          showBeautyEffectSheet(context);
        },
        icon: const Icon(Icons.add));
  }
```

#### Init Effects Feature

```dart
class ZegoLivePage extends StatefulWidget {
  const ZegoLivePage({super.key, required this.roomID, required this.role});

  @override
  State<ZegoLivePage> createState() => _ZegoLivePageState();
}

class _ZegoLivePageState extends State<ZegoLivePage> {
  @override
  void initState() {
    super.initState();
    
    // Init Effects
    ZEGOSDKManager.instance.initEffects();
  }
  
  @override
  void dispose() {
    super.dispose();
    
    // Uninit Effects
    ZEGOSDKManager.instance.unInitEffects();
  }
}
```



### Delete unnecessary beauty features

Advanced beauty currently supports a total of 12 types of features, including: basic beauty, facial shaping, filters, lipstick, blush, eyeliner, eyeshadow, colored contacts, style makeup, stickers, and background segmentation.

<img src="https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/features.png">

If you don't need a certain feature, you can comment out the corresponding item in the `zego_beauty_data.dart` file.

<img src='https://storage.zego.im/sdk-doc/Pics/zegocloud/beauty/flutter/delete_item.png'>

#### Delete beauty resources

After you comment out the unnecessary beauty features, you also need to delete the unused beauty resources.

##### Basic

Do not need to delete resources.

##### Advanced

Do not need to delete resources.

##### Filters

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/filterDreamyCozily.bundle
/BeautyResources/AdvancedResources/filterDreamySunset.bundle
/BeautyResources/AdvancedResources/filterDreamySweet.bundle
/BeautyResources/AdvancedResources/filterGrayFilmlike.bundle
/BeautyResources/AdvancedResources/filterGrayMonet.bundle
/BeautyResources/AdvancedResources/filterGrayNight.bundle
/BeautyResources/AdvancedResources/filterNaturalAutumn.bundle
/BeautyResources/AdvancedResources/filterNaturalBrighten.bundle
/BeautyResources/AdvancedResources/filterNaturalCreamy.bundle
/BeautyResources/AdvancedResources/filterNaturalFresh.bundle
```

##### Lipstick

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupLipstickCameoPink.bundle
/BeautyResources/AdvancedResources/beautyMakeupLipstickCoral.bundle
/BeautyResources/AdvancedResources/beautyMakeupLipstickRedVelvet.bundle
/BeautyResources/AdvancedResources/beautyMakeupLipstickRustRed.bundle
/BeautyResources/AdvancedResources/beautyMakeupLipstickSweetOrange.bundle
```

##### Blusher

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupBlusherAprocitPink.bundle
/BeautyResources/AdvancedResources/beautyMakeupBlusherMilkyOrange.bundle
/BeautyResources/AdvancedResources/beautyMakeupBlusherPeach.bundle
/BeautyResources/AdvancedResources/beautyMakeupBlusherSlightlyDrunk.bundle
/BeautyResources/AdvancedResources/beautyMakeupBlusherSweetOrange.bundle
```

##### Eyelashes

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupEyelashesCurl.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelashesEverlong.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelashesNatural.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelashesTender.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelashesThick.bundle
```

##### Eyeliner

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupEyelinerCatEye.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelinerDignified.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelinerInnocent.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelinerNatural.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyelinerNaughty.bundle
```

##### Eyeshadow

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupEyeshadowBrightOrange.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyeshadowMochaBrown.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyeshadowPinkMist.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyeshadowShimmerPink.bundle
/BeautyResources/AdvancedResources/beautyMakeupEyeshadowTeaBrown.bundle
```

##### Colored Contacts

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyMakeupColoredContactsBrownGreen.bundle
/BeautyResources/AdvancedResources/beautyMakeupColoredContactsChocolateBrown.bundle
/BeautyResources/AdvancedResources/beautyMakeupColoredContactsDarknightBlack.bundle
/BeautyResources/AdvancedResources/beautyMakeupColoredContactsLightsBrown.bundle
/BeautyResources/AdvancedResources/beautyMakeupColoredContactsStarryBlue.bundle
```

##### StyleMakeup

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/AdvancedResources/beautyStyleMakeupCutieCool.bundle
/BeautyResources/AdvancedResources/beautyStyleMakeupFlawless.bundle
/BeautyResources/AdvancedResources/beautyStyleMakeupInnocentEyes.bundle
/BeautyResources/AdvancedResources/beautyStyleMakeupMilkyEyes.bundle
/BeautyResources/AdvancedResources/beautyStyleMakeupPureSexy.bundle
```

##### Stickers

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/StickerBaseResources.bundle
/BeautyResources/AdvancedResources/stickerAnimal.bundle
/BeautyResources/AdvancedResources/stickerCat.bundle
/BeautyResources/AdvancedResources/stickerClawMachine.bundle
/BeautyResources/AdvancedResources/stickerClown.bundle
/BeautyResources/AdvancedResources/stickerCoolGirl.bundle
/BeautyResources/AdvancedResources/stickerDeer.bundle
/BeautyResources/AdvancedResources/stickerDive.bundle
/BeautyResources/AdvancedResources/stickerSailorMoon.bundle
/BeautyResources/AdvancedResources/stickerWatermelon.bundle
```

##### Background segmentation

If you don't need this feature, you can delete the following resources.

```
/BeautyResources/BackgroundSegmentation.model
/BeautyResources/BackgroundImages/
```
