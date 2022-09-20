//
//  UIView+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/17.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradualChangingDirection) {
    GradualChangingDirectionTTB,    // 从上到下
    GradualChangingDirectionLTR,    // 从左到右
    GradualChangingDirectionLTTRB,  // 从左上到右下
    GradualChangingDirectionLBTRT,  // 从左下到右上
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EVO)

/// 设置渐变色背景
/// @param fromColor 渐变起始颜色
/// @param toColor 渐变结束颜色
/// @param direction 渐变方向
/// @param cornerRadius 圆角大小
- (void)setGradualChangingColor:(UIColor *)fromColor
                        toColor:(UIColor *)toColor
                  withDirection:(GradualChangingDirection)direction
                   cornerRadius:(CGFloat)cornerRadius;

/// 创建渐变色背景
/// @param fromColor 渐变起始颜色
/// @param toColor 渐变结束颜色
/// @param direction 渐变方向
/// @param cornerRadius 圆角大小
- (CALayer *)layerWithgradualChangingColor:(UIColor *)fromColor
                                   toColor:(UIColor *)toColor
                             withDirection:(GradualChangingDirection)direction
                              cornerRadius:(CGFloat)cornerRadius;

/// 创建渐变色背景
/// @param colors 渐变颜色数组
/// @param direction 渐变方向
/// @param cornerRadius 圆角大小
/// 渐变layer采用颜色均分渐变，如果需要定义渐变色的占比，需要对该方法进行扩展
- (CALayer *)layerWithGradualChangingColors:(NSArray<UIColor *> *)colors
                              withDirection:(GradualChangingDirection)direction
                               cornerRadius:(CGFloat)cornerRadius;

/// 设置部分圆角
/// @param cornerRadius 圆角大小
/// @param borderColor 边线
/// @param borderWidth 边线宽度
/// @param reactCorner 圆角位置
- (void)setPartCornerRadious:(CGFloat)cornerRadius
                 borderColor:(UIColor *)borderColor
                 borderWidth:(CGFloat)borderWidth
          forRoundingCorners:(UIRectCorner)reactCorner;

/// 为视图添加简单阴影
- (void)addShadow;

- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset;

- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset
      withOpacity:(CGFloat)opacity;

/// 添加一个阴影
/// @param color 颜色
/// @param offset offset
/// @param opacity 透明度
/// @param radius 圆角
- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset
      withOpacity:(CGFloat)opacity
       withRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
