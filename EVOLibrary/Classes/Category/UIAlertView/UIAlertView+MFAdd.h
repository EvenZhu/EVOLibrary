//
//  UIAlertView+MFAdd.h
//  UIAlertView+MFAdd
//
//  Created by Jonghwan Hyeon on 8/14/14.
//  Copyright (c) 2014 Jonghwan Hyeon. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 UIAlertView 的便利使用方法（目前苹果早已废弃了UIAlertView的使用，建议使用UIAlertController，早日替换）
 */
@interface UIAlertView (MFAdd)

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles;

- (instancetype)initWithMessage:(NSString *)message
              cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitle:(NSString *)otherButtonTitle;

- (instancetype)initWithMessage:(NSString *)message
              cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitle:(NSString *)otherButtonTitle;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle;

- (instancetype)initWithMessage:(NSString *)message
              cancelButtonTitle:(NSString *)cancelButtonTitle;

- (void)showUsingBlock:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))block;

@end
