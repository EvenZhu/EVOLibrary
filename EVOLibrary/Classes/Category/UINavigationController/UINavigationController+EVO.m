//
//  UINavigationController+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "UINavigationController+EVO.h"

@implementation UINavigationController (EVO)

- (UIViewController *)findViewController:(NSString*)className {
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:NSClassFromString(className)]) {
            return viewController;
        }
    }
    return nil;
}

- (BOOL)isOnlyContainRootViewController {
    if (self.viewControllers &&
        self.viewControllers.count == 1) {
        return YES;
    }
    return NO;
}

- (UIViewController *)rootViewController {
    if (self.viewControllers && [self.viewControllers count] >0) {
        return [self.viewControllers firstObject];
    }
    return nil;
}

- (NSArray *)popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated {
    return [self popToViewController:[self findViewController:className] animated:YES];
}

- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated {
    NSInteger viewControllersCount = self.viewControllers.count;
    if (viewControllersCount > level) {
        NSInteger idx = viewControllersCount - level - 1;
        UIViewController *viewController = self.viewControllers[idx];
        return [self popToViewController:viewController animated:animated];
    } else {
        return [self popToRootViewControllerAnimated:animated];
    }
}

-(void)pushViewControllerHideTabBar:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed=YES;
    [self pushViewController: viewController animated:YES];
}

@end
