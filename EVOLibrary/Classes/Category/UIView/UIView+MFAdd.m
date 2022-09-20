//
//  UIView+MFAdd.m
//  NewMissFresh
//
//  Created by 爱上党 on 2016/11/1.
//  Copyright © 2016年 com.missfresh. All rights reserved.
//

#import "UIView+MFAdd.h"

@implementation UIView (MFAdd)
+ (UIView *)line {
   return [self lineWithColor:0xe6e6e6];
}

+ (UIView *)lineWithColor:(NSInteger)color {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = EVOHexColor(color);
    return line;
}

- (void)setCornerRadius:(CGFloat)R bounds:(BOOL)bounds {
    self.layer.masksToBounds = bounds;
    self.layer.cornerRadius = R;
}

- (void)setBorderColor:(NSInteger)borderColor borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = EVOHexColor(borderColor).CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)setCornerRadius:(CGFloat)R bounds:(BOOL)bounds borderColor:(NSInteger)borderColor borderWidth:(CGFloat)borderWidth {
    [self setCornerRadius:R bounds:bounds];
    [self setBorderColor:borderColor borderWidth:borderWidth];
}

- (UIImage *)snapshotImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

- (UIViewController *)currentViewController
{
 UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
// modal展现方式的底层视图不同
// 取到第一层时，取到的是UITransitionView，通过这个view拿不到控制器
UIView *firstView = [keyWindow.subviews firstObject];
UIView *secondView = [firstView.subviews firstObject];
UIViewController *vc = [secondView parentController];
        
if ([vc isKindOfClass:[UITabBarController class]]) {
    UITabBarController *tab = (UITabBarController *)vc;
    if ([tab.selectedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
        return [nav.viewControllers lastObject];
    } else {
        return tab.selectedViewController;
    }
} else if ([vc isKindOfClass:[UINavigationController class]]) {
    UINavigationController *nav = (UINavigationController *)vc;
    return [nav.viewControllers lastObject];
} else {
    return vc;
}
return nil;
}

- (void)removeAllSubviews {
    
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)setBottomCornerRadius:(CGFloat)width {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(width, 5)];
     CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
     maskLayer.frame = self.bounds;
     maskLayer.path = maskPath.CGPath;
     self.layer.mask = maskLayer;
}

@end
