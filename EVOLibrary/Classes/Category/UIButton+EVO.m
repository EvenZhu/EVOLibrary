//
//  UIButton+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "UIButton+EVO.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton (EVO)


+ (instancetype)buttonWithText:(NSString *)text
                     textColor:(UIColor *_Nullable)textColor
                 touchedAction:(EVOTouchedAction)touchedAction {
    return [self buttonWithText:text
                      textColor:textColor
                          image:nil
                  touchedAction:touchedAction];
}

+ (instancetype)buttonWithImage:(UIImage *)image
                  touchedAction:(EVOTouchedAction)touchedAction {
    return [self buttonWithText:nil
                      textColor:nil
                          image:image
                  touchedAction:touchedAction];
}

+ (instancetype)buttonWithText:(NSString *)text
                     textColor:(UIColor *_Nullable)textColor
                         image:(UIImage *)image
                 touchedAction:(EVOTouchedAction)touchedAction {
    return [self buttonWithText:text
                      textColor:textColor
                          image:image
                    isRightSide:NO
                  touchedAction:touchedAction];
}

+ (instancetype)buttonWithText:(NSString *)text
                     textColor:(UIColor *_Nullable)textColor
                         image:(UIImage *)image
                   isRightSide:(BOOL)isRightSide
                 touchedAction:(EVOTouchedAction)touchedAction {
    return [[self alloc] initWithText:text
                            textColor:textColor
                                image:image
                          isRightSide:isRightSide
                        touchedAction:touchedAction];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithText:(NSString *_Nullable)text
                   textColor:(UIColor *_Nullable)textColor
                       image:(UIImage *_Nullable)image
                 isRightSide:(BOOL)isRightSide
               touchedAction:(EVOTouchedAction _Nullable)touchedAction {
    self = [super init];
    if (self) {
#pragma clang diagnostic pop
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:textColor forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        if (isRightSide) {
            self.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
        }
        
        if (touchedAction) {
            objc_setAssociatedObject(self, UIButtonBlockKey, touchedAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
            [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)actionTouched:(UIButton *)button {
    EVOTouchedAction block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(button.tag);
    }
}

- (void)setHighlightedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedImage {
    return [self imageForState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)selectedImage {
    return [self imageForState:UIControlStateSelected];
}

- (void)setNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)normalImage {
    return [self imageForState:UIControlStateNormal];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundColor:backgroundColor forState:state];
}

@end
