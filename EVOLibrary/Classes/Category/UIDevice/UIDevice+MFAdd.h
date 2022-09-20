//
//  UIDevice+MFAdd.h
//  MFBaseKit
//
//  Created by 祝彭辉 on 2018/9/21.
//  Copyright © 2018年 祝彭辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (MFAdd)

/// 检测当前设备是否为全面屏iPhone
+ (BOOL)isMoreThaniPhoneX;

@end

NS_ASSUME_NONNULL_END
