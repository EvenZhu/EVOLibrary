//
//  UIViewController+LRAdd.h
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LRAdd)

+ (UIViewController *)getCurrentViewController ;

+ (UIViewController *)getTopViewController ;

@end

NS_ASSUME_NONNULL_END
