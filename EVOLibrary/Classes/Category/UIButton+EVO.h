//
//  UIButton+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EVOTouchedAction)(NSInteger tag);

/// 按钮生成和事件管理分类
@interface UIButton (EVO)

/// 生成一个按钮
/// @param text 按钮标题
/// @param image 按钮图片
/// @param touchedAction 点击事件
+ (instancetype)buttonWithText:(NSString *)text
                     textColor:(UIColor *_Nullable)textColor
                         image:(UIImage *)image
                   isRightSide:(BOOL)isRightSide
                 touchedAction:(EVOTouchedAction)touchedAction;

+ (instancetype)buttonWithText:(NSString *)text
                     textColor:(UIColor *_Nullable)textColor
                 touchedAction:(EVOTouchedAction)touchedAction;

+ (instancetype)buttonWithImage:(UIImage *)image
                  touchedAction:(EVOTouchedAction)touchedAction;

+ (instancetype)buttonWithText:(NSString * _Nullable)text
                     textColor:(UIColor *_Nullable)textColor
                         image:(UIImage * _Nullable)image
                 touchedAction:(EVOTouchedAction)touchedAction;

/// 设置高亮状态下的图片
/// @param image 图片
- (void)setHighlightedImage:(UIImage *)image;

/// 返回高亮状态下的图片
- (UIImage *)highlightedImage;

/// 设置普通状态下的图片
/// @param image 图片
- (void)setNormalImage:(UIImage *)image;

/// 返回普通状态下的图片
- (UIImage *)normalImage;

/// 设置选中状态下的图片
/// @param image 图片
- (void)setSelectedImage:(UIImage *)image;

/// 返回选中状态下的图片
- (UIImage *)selectedImage;

/// 使用颜色设置按钮背景
/// @param backgroundColor 背景颜色
/// @param state 按钮状态
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
