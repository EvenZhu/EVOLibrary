//
//  UIFont+MFAdd.m
//  NewMissFresh
//
//  Created by karl on 2018/09/13.
//  Copyright © 2018年 com.missfresh. All rights reserved.
//

#import "UIFont+MFAdd.h"

@implementation UIFont (MFAdd)

+ (UIFont *)lightFont:(CGFloat)fontSize {
    return [self fetchCompatibleFont:fontSize weight:UIFontWeightLight];
}

+ (UIFont *)regularFont:(CGFloat)fontSize {
    return [self fetchCompatibleFont:fontSize weight:UIFontWeightRegular];
}

+ (UIFont *)mediumFont:(CGFloat)fontSize {
    return [self fetchCompatibleFont:fontSize weight:UIFontWeightMedium];
}

+ (UIFont *)semiboldFont:(CGFloat)fontSize {
    return [self fetchCompatibleFont:fontSize weight:UIFontWeightSemibold];
}

+ (UIFont *)fetchCompatibleFont:(CGFloat)fontSize weight:(UIFontWeight)weight {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if (@available(iOS 8.2, *)) {
        if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
            font = [UIFont systemFontOfSize:fontSize weight:weight];
        }
    }
    return font;
}

+ (UIFont *)regularPingFangFont:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (UIFont *)mediumPingFangFont:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}

+ (UIFont *)semiboldPingFangFont:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
}

@end
