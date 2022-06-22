//
//  UILabel+AttributeString.m
//  LRRemoteTreatment
//
//  Created by lyb on 2020/4/13.
//

#import "UILabel+AttributeString.h"

@implementation UILabel (AttributeString)

- (NSMutableAttributedString *)setLabelText:(NSString *)text fontTextFontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor andFontRange:(NSRange)fontRange behindTextFontSize:(CGFloat)behindSize behindColor:(UIColor *)behindColor andBehindRange:(NSRange)behindRange {
    if (!text || [text isEqualToString:@""]) {
            return nil;
        }
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];

        if (fontRange.length) {
            [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:fontRange];
            if (fontColor) {
                [attributeString addAttribute:NSForegroundColorAttributeName value:fontColor range:fontRange];
            }
        }
        if (behindRange.length) {
            [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:behindSize] range:behindRange];
            if (behindColor) {
                [attributeString addAttribute:NSForegroundColorAttributeName value:behindColor range:behindRange];
            }
        }
        return attributeString;

}

@end
