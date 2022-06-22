//
//  UILabel+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "UILabel+EVO.h"
#import "EVOMarginLabel.h"
#import "EVOLibrary/EVOMacro.h"

@implementation UILabel (EVO)

+ (instancetype)labelWithText:(NSString *)text {
    return [self labelWithText:text
                          font:EVOFont14
                     textColor:UIColor.blackColor];
}

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color {
    return [self labelWithText:text
                          font:font
                     textColor:color
                 textAlignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWithText:text
                          font:font
                     textColor:color
                 textAlignment:textAlignment
                 contentInsets:UIEdgeInsetsZero];
}

+ (instancetype)labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                contentInsets:(UIEdgeInsets)contentInsets {
    return [self labelWithText:text
                          font:font
                     textColor:color
                 textAlignment:NSTextAlignmentCenter
                 contentInsets:contentInsets];
}

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
                contentInsets:(UIEdgeInsets)contentInsets {
    return [[self alloc] initWithText:text
                                 font:font
                            textColor:color
                        textAlignment:textAlignment
                        contentInsets:contentInsets];
}

- (instancetype)initWithText:(NSString *)text
                        font:(UIFont *)font
                   textColor:(UIColor *)color
               textAlignment:(NSTextAlignment)textAlignment
               contentInsets:(UIEdgeInsets)contentInsets {
    self = [super init];
    if (self) {
        if (contentInsets.left + contentInsets.top + contentInsets.bottom + contentInsets.right != 0) {
            self = [EVOMarginLabel labelWithContentInsets:contentInsets];
        }
        [self setupText:text
                   font:font
              textColor:color
          textAlignment:textAlignment];
    }
    return self;
}

- (void)setupText:(NSString *)text
             font:(UIFont *)font
        textColor:(UIColor *)color
    textAlignment:(NSTextAlignment)textAlignment {
    self.text = EVOValidString(text) ? text : @"";
    self.font = font;
    self.textColor = color;
    self.textAlignment = textAlignment;
}

@end
