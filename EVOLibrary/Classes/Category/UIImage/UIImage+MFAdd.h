//
//  UIImage+MFAdd.h
//  QiangXianHuo
//
//  Created by king on 16/1/17.
//  Copyright © 2016年 QiangXianHuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MFAdd)

/**
 根据颜色和大小创建图片

 @param color 需要创建的图片颜色
 @param size 需要创建的图片大小
 @return 创建完成的图片
 */
+ (UIImage *_Nullable)imageWithColor:(UIColor *_Nonnull)color size:(CGSize)size;

/**
 对指定的UIView进行截屏生成图片

 @param view 需要被截屏的View
 @return 截屏后生成的图片
 */
+ (UIImage *_Nullable)imageFromView:(UIView *_Nonnull)view;


/**
 根据NSData生成指定尺寸的二维码图片

 @param data 二维码数据
 @param size 需要生成的二维码的尺寸
 @return 生成的二维码数据
 */
+ (UIImage *_Nullable)QRImageWithData:(NSData *_Nullable)data
                                 size:(CGSize)size;


/**
 根据字符串生成二维码

 @param string 需要生成二维码的字符串
 @param size 二维码尺寸
 @return 生成的二维码图片
 */
+ (UIImage *_Nullable)QRImageWithString:(NSString *_Nullable)string
                                   size:(CGSize)size;


/**
 加载特定bundle下的图片资源

 @param name 图片资源名称
 @param className 和资源在同一个包内的类名
 @param bundleName bundle名称
 @return 图片资源
 */
+ (UIImage *_Nullable)imageNamed:(NSString *_Nullable)name
                       className:(NSString *_Nullable)className
                      bundleName:(NSString *_Nullable)bundleName;


/**
 图片缩放到指定大小

 @param size 大小
 @return 缩放后的图片
 */
- (UIImage *_Nullable)imageByResizeToSize:(CGSize)size;


/**
 绘制圆角图片（备注：用法说明->可配合SD的图片存储将该方法绘制好圆角图片存储到缓存中来解决圆角绘制的性能问题）

 @param radius 弧度
 @param backgoundColor 背景颜色
 @return 圆角图片
 */
- (UIImage *_Nullable)imageByRoundCornerRadius:(CGFloat)radius backgroundColor:(UIColor *_Nonnull)backgoundColor;


/**
 绘制圆角图片

 @param radius 弧度
 @param backgoundColor 背景颜色
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @return 圆角图片
 */
- (UIImage *_Nullable)imageByRoundCornerRadius:(CGFloat)radius
                               backgroundColor:(UIColor *_Nullable)backgoundColor
                                   borderColor:(UIColor *_Nullable)borderColor
                                   borderWidth:(CGFloat)borderWidth;

+ (NSData *_Nullable)resetSizeOfImageData:(UIImage *_Nonnull)sourceImage maxSize:(NSInteger)maxSize;
@end
