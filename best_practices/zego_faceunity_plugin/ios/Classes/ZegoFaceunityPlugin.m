#import "ZegoFaceunityPlugin.h"
#import "ZegoFaceunityVideoProcess.h"
#import "FUManager.h"
#import "ZegoFaceUnityUtils.h"
#import <objc/message.h>
#import <ZegoExpressEngine/ZegoExpressEngine.h>


@interface ZegoFaceunityPlugin()

@property (nonatomic, strong) ZegoFaceunityVideoProcess *faceunityVideoProcess;
@property (nonatomic, assign) BOOL isInit;

@end

@implementation ZegoFaceunityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"zego_faceunity_plugin"
            binaryMessenger:[registrar messenger]];
  ZegoFaceunityPlugin* instance = [[ZegoFaceunityPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    if ([call.method isEqualToString:@"init"]) {
        [self initPlugin];
        result(nil);
        
    } else if ([call.method isEqualToString:@"uninit"]) {
        [self unInit];
        result(nil);
        
    } else if ([call.method isEqualToString:@"setBeautyOption"]) {
        [self setBeautyOption:call.arguments];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)initPlugin {
    if (_isInit) {
        return;
    }
    _isInit = true;
    self.faceunityVideoProcess = [[ZegoFaceunityVideoProcess alloc] init];
    [FUManager setup];
    [[FUManager shareManager]loadFilter];
    [[FUManager shareManager]loadMakeupBundleWithName:@"face_makeup"];
    ZegoCustomVideoProcessConfig *config = [[ZegoCustomVideoProcessConfig alloc]init];
    config.bufferType = ZegoVideoBufferTypeCVPixelBuffer;
    [[ZegoExpressEngine sharedEngine]setCustomVideoProcessHandler:self.faceunityVideoProcess];
    [[ZegoExpressEngine sharedEngine]enableCustomVideoProcessing:YES config:config];
}

- (void)unInit {
    if (!_isInit) {
        return;
    }
    _isInit = false;
    ZegoCustomVideoProcessConfig *config = [[ZegoCustomVideoProcessConfig alloc]init];
    config.bufferType = ZegoVideoBufferTypeGLTexture2D;
    [[ZegoExpressEngine sharedEngine]enableCustomVideoProcessing:NO config:config];
    [[ZegoExpressEngine sharedEngine]setCustomVideoProcessHandler:nil];
    self.faceunityVideoProcess = nil;
    [FUManager releaseManager];
}

- (void)setBeautyOption:(id)arguments {
    
    double faceWhiten = [ZegoFaceUnityUtils doubleValue:arguments[@"faceWhiten"]];
    double faceRed = [ZegoFaceUnityUtils doubleValue:arguments[@"faceRed"]];
    double faceBlur = [ZegoFaceUnityUtils doubleValue:arguments[@"faceBlur"]];

    double eyeEnlarging = [ZegoFaceUnityUtils doubleValue:arguments[@"eyeEnlarging"]];

    double cheekThinning = [ZegoFaceUnityUtils doubleValue:arguments[@"cheekThinning"]];
    double cheekV = [ZegoFaceUnityUtils doubleValue:arguments[@"cheekV"]];
    double cheekNarrow = [ZegoFaceUnityUtils doubleValue:arguments[@"cheekNarrow"]];
    double cheekSmall = [ZegoFaceUnityUtils doubleValue:arguments[@"cheekSmall"]];

    double chinLevel = [ZegoFaceUnityUtils doubleValue:arguments[@"chinLevel"]];
    double foreHeadLevel = [ZegoFaceUnityUtils doubleValue:arguments[@"foreHeadLevel"]];
    double noseLevel = [ZegoFaceUnityUtils doubleValue:arguments[@"noseLevel"]];
    double mouthLevel = [ZegoFaceUnityUtils doubleValue:arguments[@"mouthLevel"]];
    
    [FUManager shareManager].whiteLevel = faceWhiten;
    [FUManager shareManager].redLevel = faceRed;
    [FUManager shareManager].blurLevel = faceBlur;
    [FUManager shareManager].enlargingLevel = eyeEnlarging;
    [FUManager shareManager].thinningLevel = cheekThinning;
    [FUManager shareManager].vLevel = cheekV;
    [FUManager shareManager].narrowLevel = cheekNarrow;
    [FUManager shareManager].smallLevel = cheekSmall;
    [FUManager shareManager].jewLevel = chinLevel;
    [FUManager shareManager].foreheadLevel = foreHeadLevel;
    [FUManager shareManager].noseLevel = noseLevel;
    [FUManager shareManager].mouthLevel = mouthLevel;
}

@end
