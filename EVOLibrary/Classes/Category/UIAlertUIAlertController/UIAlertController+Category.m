//
//  UIAlertController+Category.m
//  LRRemoteTreatment
//
//  Created by lyb on 2020/3/17.
//

#import "UIAlertController+Category.h"


@implementation UIAlertController (Category)


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
                           otherButtonTitles:(nullable NSString *)otherBtnTitles,... {
   UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:[NSString stringWithFormat:@"%@",message] preferredStyle:alertControllerStyle];
   
   //添加按钮
   if (cancelBtnTitle.length) {
       UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           block(0);
       }];
       [alertController addAction:cancelAction];
   }
   if (destructiveBtnTitle.length) {
       UIAlertAction * destructiveAction = [UIAlertAction actionWithTitle:destructiveBtnTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
           block(1);
       }];
       [alertController addAction:destructiveAction];
   }
   if (otherBtnTitles.length) {
       UIAlertAction *otherActions = [UIAlertAction actionWithTitle:otherBtnTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
           (!cancelBtnTitle.length && !destructiveBtnTitle.length) ? block(0) : (((cancelBtnTitle.length && !destructiveBtnTitle.length) || (!cancelBtnTitle.length && destructiveBtnTitle.length)) ? block(1) : block(2));
       }];
       [alertController addAction:otherActions];

       va_list args;
       va_start(args, otherBtnTitles);
       if (otherBtnTitles.length) {
           NSString * otherString;
           int index = 2;
           (!cancelBtnTitle.length && !destructiveBtnTitle.length) ? (index = 0) : ((cancelBtnTitle.length && !destructiveBtnTitle.length) || (!cancelBtnTitle.length && destructiveBtnTitle.length) ? (index = 1) : (index = 2));
           while ((otherString = va_arg(args, NSString*))) {
               index ++ ;
               UIAlertAction * otherActions = [UIAlertAction actionWithTitle:otherString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   block(index);
               }];
               [alertController addAction:otherActions];
           }
       }
       va_end(args);
   }
   [viewController presentViewController:alertController animated:YES completion:nil];
}


@end
