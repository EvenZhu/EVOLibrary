//
//  EVOMarginLabel.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "EVOMarginLabel.h"

@interface EVOMarginLabel ()

@property (nonatomic, assign) UIEdgeInsets contentInsets;

@end

@implementation EVOMarginLabel

+ (instancetype)labelWithContentInsets:(UIEdgeInsets)contentInsets {
    return [[self alloc] initWithContentInsets:contentInsets];
}

- (instancetype)initWithContentInsets:(UIEdgeInsets)contentInsets {
    self = [super init];
    if (self) {
        self.contentInsets = contentInsets;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.contentInsets.left;
    rect.origin.y -= self.contentInsets.top;
    rect.size.width += self.contentInsets.left + self.contentInsets.right;
    rect.size.height += self.contentInsets.top + self.contentInsets.bottom;
    
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.contentInsets)];
}

@end
