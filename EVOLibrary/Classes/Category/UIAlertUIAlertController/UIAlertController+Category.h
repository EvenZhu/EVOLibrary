//
//  UIAlertController+Category.h
//  LRRemoteTreatment
//
//  Created by lyb on 2020/3/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CallBackBlock)(NSInteger btnIndex);

@interface UIAlertController (Category)

/**
 自定义封装的UIAlertController方法

 @param viewController       显示的vc
 @param alertControllerStyle UIAlertControllerStyle 样式
 @param title                标题
 @param message              提示信息
 @param block                回调block
 @param cancelBtnTitle       取消button标题
 @param destructiveBtnTitle  红色的按钮
 @param otherBtnTitles       其他button标题
 */
+ (void)showAlertCntrollerWithViewController:(UIViewController*)viewController
                        alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle
                                       title:(nullable NSString*)title
                                     message:(NSString*)message
                               callBackBlock:(CallBackBlock)block
                           cancelButtonTitle:(nullable NSString *)cancelBtnTitle
                      destructiveButtonTitle:(nullable NSString *)destructiveBtnTitle
                           otherButtonTitles:(nullable NSString *)otherBtnTitles,...NS_REQUIRES_NIL_TERMINATION;

@end

NS_ASSUME_NONNULL_END
