//
//  ZegoFaceUnityUtils.h
//  Pods
//
//  Created by Patrick Fu on 2020/11/18.
//  Copyright © 2020 Zego. All rights reserved.
//

#ifndef ZegoFaceUnityUtils_h
#define ZegoFaceUnityUtils_h

#import <Foundation/Foundation.h>

@interface ZegoFaceUnityUtils : NSObject

+ (BOOL)boolValue:(NSNumber *)number;

+ (int)intValue:(NSNumber *)number;

+ (unsigned int)unsignedIntValue:(NSNumber *)number;

+ (unsigned long)unsignedLongValue:(NSNumber *)number;

+ (unsigned long long)unsignedLongLongValue:(NSNumber *)number;

+ (long long)longLongValue:(NSNumber *)number;

+ (float)floatValue:(NSNumber *)number;

+ (double)doubleValue:(NSNumber *)number;

+ (BOOL)isNullObject:(id)object;

@end

#endif /* ZegoFaceUnityUtils_h */
