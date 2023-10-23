//
//  ZegoFaceunityVideoProcess.m
//  Pods-Runner
//
//  Created by lizhanpeng@ZEGO on 2020/9/16.
//

#import "ZegoFaceunityVideoProcess.h"
#import "FUManager.h"
#import <ZegoExpressEngine/ZegoExpressEngine.h>

@interface ZegoFaceunityVideoProcess()<ZegoCustomVideoProcessHandler>

@end

@implementation ZegoFaceunityVideoProcess

#pragma mark -ZegoCustomVideoProcessHandler
- (void)onCapturedUnprocessedCVPixelBuffer:(CVPixelBufferRef)buffer timestamp:(CMTime)timestamp channel:(ZegoPublishChannel)channel {
    // ⭐️ Processing video frame data with FaceUnity
    CVPixelBufferRef processedPixelBuffer = [[FUManager shareManager] renderItemsToPixelBuffer:buffer];
    // ⭐️ Send pixel buffer to ZEGO SDK
    [[ZegoExpressEngine sharedEngine] sendCustomVideoProcessedCVPixelBuffer:processedPixelBuffer timestamp:timestamp];
}

@end
