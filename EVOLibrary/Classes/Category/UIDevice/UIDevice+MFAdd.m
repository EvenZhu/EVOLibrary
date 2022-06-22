//
//  UIDevice+MFAdd.m
//  MFBaseKit
//
//  Created by 董宝君 on 2018/9/21.
//  Copyright © 2018年 董宝君. All rights reserved.
//

#import "UIDevice+MFAdd.h"

@implementation UIDevice (MFAdd)

+ (BOOL)isiPhoneX {
    // 先判断当前设备是否为 iPhone 或 iPod touch
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        // 获取屏幕的宽度和高度，取较大一方判断是否为 812.0 或 896.0
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        CGFloat maxLength = screenWidth > screenHeight ? screenWidth : screenHeight;
        if (maxLength >= 812.0f || maxLength >= 896.0f) {
            return YES;
        }
    }
    return NO;
}

@end
