//
//  UIView+MFAdd.h
//  NewMissFresh
//
//  Created by 爱上党 on 2016/11/1.
//  Copyright © 2016年 com.missfresh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIView相关的便捷方法
 */
@interface UIView (MFAdd)


/**
 创建View 默认颜色 0xe6e6e6
 */
+ (nullable UIView *)line;

/**
 根据颜色创建View
 */
+ (nullable UIView *)lineWithColor:(NSInteger)color;

/**
 设置圆角

 @param R 弧度
 @param bounds 裁剪
 */
- (void)setCornerRadius:(CGFloat)R bounds:(BOOL)bounds;

/**
 设置边框颜色和宽度

 @param borderColor 边框的颜色
 @param borderWidth 边框的宽度
 */
- (void)setBorderColor:(NSInteger)borderColor borderWidth:(CGFloat)borderWidth;


/**
 设置View的圆角 边框

 @param R 圆角的角度
 @param bounds layer是否超出裁剪
 @param borderColor 边框的颜色
 @param borderWidth 边框的宽度
 */
- (void)setCornerRadius:(CGFloat)R bounds:(BOOL)bounds borderColor:(NSInteger)borderColor borderWidth:(CGFloat)borderWidth;

- (UIViewController *_Nullable)parentController;

- (UIViewController *_Nullable)currentViewController;

/**
 对当前的View生成一张截图

 @return 截图的图片
 */
- (nullable UIImage *)snapshotImage;


/**
 对当前的View生成截屏 比snapshotImage方法快，但是可能会引起屏幕更新

 @param afterUpdates 是否在
 @return 截屏的图片
 */
- (nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;


/**
 删除所有的View
 */
- (void)removeAllSubviews;

- (void)setBottomCornerRadius:(CGFloat)width;

/**
 当前View所在的UIViewController 可能为nil
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

@end
