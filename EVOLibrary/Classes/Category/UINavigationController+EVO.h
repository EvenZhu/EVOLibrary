//
//  UINavigationController+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 导航栏功能扩展分类
@interface UINavigationController (EVO)

/// 寻找Navigation中的某个viewcontroler对象
/// @param className 指定viewcontroler类名
- (UIViewController *)findViewController:(NSString*)className;

/// 判断是否只有一个RootViewController
- (BOOL)isOnlyContainRootViewController;

/// 返回导航栏的根视图控制器
- (UIViewController *)rootViewController;

/// 返回指定的viewcontroler
/// @param className 指定viewcontroler类名
/// @param animated 是否动画
- (NSArray *)popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated;

/// pop n层
/// @param level pop层数
/// @param animated 是否动画
- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

/// push 一个不包含TabBar的控制器
/// @param viewController 指定的视图控制器
/// @param animated 是否动画
-(void)pushViewControllerHideTabBar:(UIViewController *)viewController animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
