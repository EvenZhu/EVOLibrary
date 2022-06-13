//
//  UIImageView+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "UIImageView+EVO.h"

@implementation UIImageView (EVO)

- (instancetype)initWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {
    self = [self initWithImage:image];
    if (self) {
        self.layer.cornerRadius = cornerRadius;
    }
    return self;
}

@end
