//
//  UILabel+AttributeString.h
//  LRRemoteTreatment
//
//  Created by lyb on 2020/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (AttributeString)

/// 设置label的attribute text
/// @param text 整个label的text
/// @param fontSize label的字体大小
/// @param fontColor 要设置range字体颜色
/// @param fontRange 要设置text的range
/// @param behindSize 其他字体大小
/// @param behindColor 其他字体颜色
/// @param behindRange 其他字体的range
- (NSMutableAttributedString *)setLabelText:(NSString *)text fontTextFontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor andFontRange:(NSRange)fontRange behindTextFontSize:(CGFloat)behindSize behindColor:(UIColor *)behindColor andBehindRange:(NSRange)behindRange;


@end

NS_ASSUME_NONNULL_END
