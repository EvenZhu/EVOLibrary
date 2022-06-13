//
//  UILabel+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 文本标签生成分类
@interface UILabel (EVO)

+ (instancetype)labelWithText:(NSString *)text;

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color;

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                textAlignment:(NSTextAlignment)textAlignment;

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                contentInsets:(UIEdgeInsets)contentInsets;

/// 快捷创建一个文本标签
/// @param text 文本
/// @param font 字体
/// @param color 文字颜色
/// @param textAlignment 对齐方式
/// @param contentInsets 文本标签外间距
+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                textAlignment:(NSTextAlignment)textAlignment
                contentInsets:(UIEdgeInsets)contentInsets;

@end

NS_ASSUME_NONNULL_END
