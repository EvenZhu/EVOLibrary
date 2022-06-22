//
//  UIView+Loading.m
//  LRRemoteTreatment
//
//  Created by 何强 on 2020/8/10.
//

#import "UIView+Loading.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (Loading)

- (void)loading {
    [self loadingWithContent:nil];
}

- (void)loadingDefaultText {
    [self loadingWithContent:@"加载中..."];
}

- (void)loadingWithContent:(nullable NSString *)content {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hub.mode = MBProgressHUDModeIndeterminate;
        hub.label.text = content;
    });
}

-(void)hideLoading {
    dispatch_async(dispatch_get_main_queue(), ^{
       [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
