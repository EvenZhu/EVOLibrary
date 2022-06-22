//
//  UIFont+MFAdd.h
//  NewMissFresh
//
//  Created by karl on 2018/09/13.
//  Copyright © 2018年 com.missfresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MFAdd)
+ (UIFont *)lightFont:(CGFloat)fontSize;
+ (UIFont *)regularFont:(CGFloat)fontSize;
+ (UIFont *)mediumFont:(CGFloat)fontSize;
+ (UIFont *)semiboldFont:(CGFloat)fontSize;
+ (UIFont *)fetchCompatibleFont:(CGFloat)fontSize weight:(UIFontWeight)weight;

+ (UIFont *)regularPingFangFont:(CGFloat)fontSize;
+ (UIFont *)mediumPingFangFont:(CGFloat)fontSize;
+ (UIFont *)semiboldPingFangFont:(CGFloat)fontSize;

@end
