//
//  UILabel+MFAdd.m
//  NewMissFresh
//
//  Created by 爱上党 on 2016/11/1.
//  Copyright © 2016年 com.missfresh. All rights reserved.
//

#import "UILabel+MFAdd.h"

@implementation UILabel (MFAdd)

#pragma mark - labelWithFontSize color

+ (UILabel *)labelWithFontSize:(CGFloat)size color:(NSInteger)color {
    UILabel *label = [[UILabel alloc] init];
    [label setFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithLightFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setLightFontSize:size color:color];
    return label;
}


+ (UILabel *)labelWithRegularFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setRegularFontSize:size color:color];
    return label;
}


+ (UILabel *)labelWithMediumFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setMediumFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithSemiboldFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setSemiboldFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithBoldFontSize:(CGFloat)size color:(NSInteger)color {
    UILabel *label = [[UILabel alloc] init];
    [label setBoldFontSize:size color:color];
    return label;
}

#pragma mark - labelWithTitle font color

+ (UILabel *)labelWithTitle:(NSString *)title fontSize:(CGFloat)size color:(NSInteger)color {
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title fontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title lightFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title lightFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title regularFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title regularFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title mediumFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title mediumFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title semiboldFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title semiboldFontSize:size color:color];
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title boldFontFontSize:(CGFloat)size color:(NSInteger)color {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTitle:title boldFontFontSize:size color:color];
    return label;
}

#pragma mark - set title and color

- (void)setTitle:(NSString *)title {
    self.text = title;
}

- (void)setTitle:(NSString *)title color:(NSInteger)color {
    self.text = title;
    self.textColor = EVOHexColor(color);
}

#pragma mark - set font and color

- (void)setFontSize:(CGFloat)size color:(NSInteger)color {
    
    self.font = EVOFont(size);
    self.textColor = EVOHexColor(color);
}

- (void)setLightFontSize:(CGFloat)size color:(NSInteger)color {
    
    self.font = EVOLightFont(size);
    self.textColor = EVOHexColor(color);
}

- (void)setRegularFontSize:(CGFloat)size color:(NSInteger)color {
    
    self.font = EVORegularFont(size);
    self.textColor = EVOHexColor(color);
}

- (void)setMediumFontSize:(CGFloat)size color:(NSInteger)color {
    
    self.font = EVOMediumFont(size);
    self.textColor = EVOHexColor(color);
}

- (void)setSemiboldFontSize:(CGFloat)size color:(NSInteger)color {
    
    self.font = EVOSemiboldFont(size);
    self.textColor = EVOHexColor(color);
}

- (void)setBoldFontSize:(CGFloat)size color:(NSInteger)color {
    self.font = EVOBoldFont(size);
    self.textColor = EVOHexColor(color);
}

#pragma mark - set title font color

- (void)setTitle:(NSString *)title fontSize:(CGFloat)size color:(NSInteger)color {
    [self setFontSize:size color:color];
    self.text = title;
}

- (void)setTitle:(NSString *)title lightFontSize:(CGFloat)size color:(NSInteger)color {
    
    [self setLightFontSize:size color:color];
    self.text = title;
}

- (void)setTitle:(NSString *)title regularFontSize:(CGFloat)size color:(NSInteger)color {
    
    [self setRegularFontSize:size color:color];
    self.text = title;
}

- (void)setTitle:(NSString *)title mediumFontSize:(CGFloat)size color:(NSInteger)color {
    
    [self setMediumFontSize:size color:color];
    self.text = title;
}

- (void)setTitle:(NSString *)title semiboldFontSize:(CGFloat)size color:(NSInteger)color {
    
    [self setSemiboldFontSize:size color:color];
    self.text = title;
}

- (void)setTitle:(NSString *)title boldFontFontSize:(CGFloat)size color:(NSInteger)color {
    
    [self setBoldFontSize:size color:color];
    self.text = title;
}

@end
