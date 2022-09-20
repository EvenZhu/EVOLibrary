//
//  UIDevice+MFAdd.m
//  MFBaseKit
//
//  Created by 祝彭辉 on 2018/9/21.
//  Copyright © 2018年 祝彭辉. All rights reserved.
//

#import "UIDevice+MFAdd.h"

@implementation UIDevice (MFAdd)

+ (BOOL)isMoreThaniPhoneX {
    // 先判断当前设备是否为 iPhone 或 iPod touch
    if (@available(iOS 13.0, *)) {
        if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            return [self verifyScreen];
        }
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return [self verifyScreen];
    }
    return NO;
}

+ (BOOL)verifyScreen {
    // 获取屏幕的宽度和高度，取较大一方判断是否为 812.0 或 896.0
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat maxLength = screenWidth > screenHeight ? screenWidth : screenHeight;
    
    return maxLength >= 812.0f || maxLength >= 896.0f;
}

@end
