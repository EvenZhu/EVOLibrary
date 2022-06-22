//
//  UILabel+MFAdd.h
//  NewMissFresh
//
//  Created by 爱上党 on 2016/11/1.
//  Copyright © 2016年 com.missfresh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UILable 相关的便利方法
 */
@interface UILabel (MFAdd)

+ (UILabel *)labelWithFontSize:(CGFloat)size color:(NSInteger)color;    ///systemFont
+ (UILabel *)labelWithLightFontSize:(CGFloat)size color:(NSInteger)color; /// lightFont
+ (UILabel *)labelWithRegularFontSize:(CGFloat)size color:(NSInteger)color; ///regularFont
+ (UILabel *)labelWithMediumFontSize:(CGFloat)size color:(NSInteger)color; ///mediumFont
+ (UILabel *)labelWithSemiboldFontSize:(CGFloat)size color:(NSInteger)color; ///semiboldFont
+ (UILabel *)labelWithBoldFontSize:(CGFloat)size color:(NSInteger)color;    ///boldSystemFont

+ (UILabel *)labelWithTitle:(NSString *)title fontSize:(CGFloat)size color:(NSInteger)color;    ///systemFont
+ (UILabel *)labelWithTitle:(NSString *)title lightFontSize:(CGFloat)size color:(NSInteger)color; ///lightFont
+ (UILabel *)labelWithTitle:(NSString *)title regularFontSize:(CGFloat)size color:(NSInteger)color;    ///regularFont
+ (UILabel *)labelWithTitle:(NSString *)title mediumFontSize:(CGFloat)size color:(NSInteger)color;    ///mediumFont
+ (UILabel *)labelWithTitle:(NSString *)title semiboldFontSize:(CGFloat)size color:(NSInteger)color;    ///semiboldFont
+ (UILabel *)labelWithTitle:(NSString *)title boldFontFontSize:(CGFloat)size color:(NSInteger)color;    ///boldSystemFont

- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title color:(NSInteger)color;

- (void)setFontSize:(CGFloat)size color:(NSInteger)color;   ///systemFont
- (void)setLightFontSize:(CGFloat)size color:(NSInteger)color; ///lightFont
- (void)setRegularFontSize:(CGFloat)size color:(NSInteger)color;   ///regularFont
- (void)setMediumFontSize:(CGFloat)size color:(NSInteger)color;   ///mediumFont
- (void)setSemiboldFontSize:(CGFloat)size color:(NSInteger)color;   ///semiboldFont
- (void)setBoldFontSize:(CGFloat)size color:(NSInteger)color;   ///boldSystemFont

- (void)setTitle:(NSString *)title fontSize:(CGFloat)size color:(NSInteger)color;   ///systemFont
- (void)setTitle:(NSString *)title lightFontSize:(CGFloat)size color:(NSInteger)color; ///lightFont
- (void)setTitle:(NSString *)title regularFontSize:(CGFloat)size color:(NSInteger)color;   ///regularFont
- (void)setTitle:(NSString *)title mediumFontSize:(CGFloat)size color:(NSInteger)color;   ///mediumFont
- (void)setTitle:(NSString *)title semiboldFontSize:(CGFloat)size color:(NSInteger)color;   ///semiboldFont
- (void)setTitle:(NSString *)title boldFontFontSize:(CGFloat)size color:(NSInteger)color;   ///boldSystemFont

@end
