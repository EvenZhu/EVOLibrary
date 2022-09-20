//
//  UIColor+MFAdd.h
//  工具类整理
//
//  Created by philia on 2017/9/15.
//  Copyright © 2017年 philia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MFAdd)

/**
 使用 16 进制数字创建颜色，例如 0xFF0000 创建红色

 @param hex 16 进制无符号32位整数
 @return 颜色
 */
+ (instancetype)colorWithHex:(uint32_t)hex;

/**
 生成随机颜色

 @return 随机颜色值
 */
+ (instancetype)randomColor;


/**
 使用 R / G / B 数值创建颜色

 @param red red
 @param green red
 @param blue blue
 @return 颜色
 */

+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 *  hex值转换颜色
 *
 *  @param hexStr hex value
 *
 *  @return UIColor
 */
+ (__kindof UIColor *)colorWithHexStr:(NSString *)hexStr;

/**
 *  UIColor转换hex值
 *
 *  @param color UIColor
 *
 *  @return hexStr
 */
+ (__kindof NSString *)hexFromUIColor:(UIColor*)color;

@end
