//
//  UIButton+MFAdd.m
//  扩大控件响应
//
//  Created by 爱上党 on 16/1/25.
//  Copyright © 2016年 尚高林. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+MFAdd.h"
#import "EVOLibrary/EVOMacro.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MF_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define MF_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

@implementation UIButton (MFAdd)

+ (UIButton *)buttonWithNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:EVOHexColor(titleColor) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fonstSize];
    return button;
}

+ (UIButton *)buttonWithNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor backgroundColor:(NSInteger)backgroundColor {
    UIButton *button = [self buttonWithNormalStateTitle:title fonstSize:fonstSize titleColor:titleColor];
    button.backgroundColor = EVOHexColor(backgroundColor);
    return button;
}

- (void)setNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:EVOHexColor(titleColor) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:fonstSize];
}

- (void)setNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor backgroundColor:(NSInteger)backgroundColor {
    [self setNormalStateTitle:title fonstSize:fonstSize titleColor:titleColor];
    self.backgroundColor = EVOHexColor(backgroundColor);
}

@end


@implementation UIButton (MFEnlargeEdge)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdge:(CGFloat)size {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeInset:(UIEdgeInsets)insets {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:insets.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:insets.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:insets.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:insets.left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

@end


@implementation UIButton (MFEdgeInsets)

- (void)setImageUpTitleDownWithSpacing:(CGFloat)spacing {
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = MF_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}

- (void)setImageRightTitleLeftWithSpacing:(CGFloat)spacing {
    CGSize imageSize = self.imageView.bounds.size;//[self imageForState:UIControlStateNormal].size;
    
    CGSize titleSize = self.titleLabel.bounds.size;//MF_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    if (titleSize.width < 1e-6) {
        titleSize = [self attributedTitleForState:UIControlStateNormal].size;
    }
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, - (titleSize.width + spacing));
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - (imageSize.width + spacing), 0, imageSize.width);
}

- (void)setDefaultImageTitleStyleWithSpacing:(CGFloat)spacing {
    CGFloat delta = spacing/2.f;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -delta, 0, delta);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, delta, 0, -delta);
}

- (void)setEdgeInsetsWithType:(MFEdgeInsetsType)edgeInsetsType marginType:(MFMarginType)marginType margin:(CGFloat)margin {
    CGSize itemSize = CGSizeZero;
    if (edgeInsetsType == MFEdgeInsetsTypeTitle) {
        itemSize = MF_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    }
    else {
        itemSize = [self imageForState:UIControlStateNormal].size;
    }
    
    CGFloat horizontalDelta = (CGRectGetWidth(self.frame) - itemSize.width)/2.f - margin;
    CGFloat vertivalDelta = (CGRectGetHeight(self.frame) - itemSize.height)/2.f - margin;
    
    NSInteger horizontalSignFlag = 1;
    NSInteger verticalSignFlag = 1;
    
    switch (marginType) {
        case MFMarginTypeTop:
        {
            horizontalSignFlag = 0;
            verticalSignFlag = -1;
        }
            break;
        case MFMarginTypeLeft:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = 0;
        }
            break;
        case MFMarginTypeBottom:
        {
            horizontalSignFlag = 0;
            verticalSignFlag = 1;
        }
            break;
        case MFMarginTypeRight:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = 0;
        }
            break;
        case MFMarginTypeLeftTop:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = -1;
        }
            break;
        case MFMarginTypeLeftBottom:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = 1;
        }
            break;
        case MFMarginTypeRightTop:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = -1;
        }
            break;
        case MFMarginTypeRightBottom:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = 1;
        }
            break;
            
        default:
            break;
    }
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(vertivalDelta * verticalSignFlag, horizontalDelta * horizontalSignFlag, -vertivalDelta * verticalSignFlag, -horizontalDelta * horizontalSignFlag);
    if (edgeInsetsType == MFEdgeInsetsTypeTitle) {
        self.titleEdgeInsets = edgeInsets;
    }
    else {
        self.imageEdgeInsets = edgeInsets;
    }
}

@end

@implementation UIButton (MFEvent)
- (void)addTouchUpInsideEvent:(EventBlock)event {
    [self addEventForControlEvents:UIControlEventTouchUpInside action:event];
}

- (void)addEventForControlEvents:(UIControlEvents)controlEvents action:(EventBlock)event {
    objc_setAssociatedObject(self, @selector(addEventForControlEvents:action:), event, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(btnClick:) forControlEvents:controlEvents];
}

- (void)btnClick:(UIButton *)btn {
    EventBlock block = objc_getAssociatedObject(self, @selector(addEventForControlEvents:action:));
    if (block) {
        block(btn);
    }
}
@end
