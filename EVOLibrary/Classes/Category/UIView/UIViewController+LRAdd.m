//
//  UIViewController+LRAdd.m
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/4/17.
//

#import "UIViewController+LRAdd.h"

@implementation UIViewController (LRAdd)

+ (UIViewController *)getCurrentViewController {
    UIViewController *controller = [[UIApplication sharedApplication].keyWindow rootViewController];
    return controller;
}

+ (UIViewController *)getTopViewController {
    UIViewController *topVC = nil;
    UIViewController *currentVC = [self getCurrentViewController];
    if ([currentVC isKindOfClass:UINavigationController.class]) {
        if (currentVC.presentedViewController == nil) {
            UINavigationController *navi = (UINavigationController *)currentVC;
            topVC = navi.topViewController;
        } else {
            while (currentVC.presentedViewController != nil) {
                currentVC = currentVC.presentedViewController;
            }
            topVC = currentVC;
        }
    } else if ([currentVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbarVC = (UITabBarController *)currentVC;
        UINavigationController *selectVC = tabbarVC.selectedViewController;
        if (selectVC.presentedViewController == nil) {
            topVC = selectVC.topViewController;
        } else {
            UIViewController *vc = selectVC;
            while (vc.presentedViewController != nil) {
                vc = vc.presentedViewController;
            }
            topVC = vc;
        }
    } else {
        topVC = currentVC;
    }
    return topVC;
}
@end
