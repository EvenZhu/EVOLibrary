//
//  MBProgressHUD+MFAdd.m
//

#import "MBProgressHUD+MFAdd.h"
#import "UIWindow+MFAdd.h"

@implementation MBProgressHUD (MFAdd)

+ (void)showProcessTip:(NSString *)tip {
    [self hideProcessTip];
    [MBProgressHUD showHUDAddedTo:[UIWindow mainWindow] animated:YES withTitle:tip];
}

+ (void)showProcessTip:(NSString *)tip offY:(CGFloat)y {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDAddedTo:[UIWindow mainWindow] animated:YES withTitle:tip moveY:y];
    });
}

+ (void)hideProcessTip {
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if(![windows containsObject:[UIWindow mainWindow]]){
        
        NSMutableArray *tempWindows = [windows mutableCopy];
        [tempWindows addObject:[UIWindow mainWindow]];
        windows = [tempWindows copy];
    }
    
    [MBProgressHUD hideHUDsForViews:windows animated:NO];
}

+ (void)showSuccessTip:(NSString *)tip {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_success" text:tip duration:1.5];
    });
}

+ (void)showFailTip:(NSString *)tip {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_fail" text:tip duration:1];
    });
}

+ (void)showFailTipInFront:(NSString *)tip{
    [CATransaction begin];
    UIWindow *win = [[[UIApplication sharedApplication] windows] lastObject];
    [MBProgressHUD hideHUDForView:win animated:NO];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:win];
    [win addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_send_fail"]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = tip;
    [HUD showAnimated:YES];
    [CATransaction commit];
    [HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)showHUDInFrontWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration{
    [CATransaction begin];
    UIWindow *keyWindow = [[[UIApplication sharedApplication] windows] lastObject];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:keyWindow];
    [HUD setUserInteractionEnabled:YES];
    [keyWindow addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = text;
    HUD.detailsLabel.text = detailsText;
    HUD.detailsLabel.font = detailsFont;
    [HUD showAnimated:YES];
    [CATransaction commit];
    [HUD hideAnimated:YES afterDelay:duration];
}

+ (instancetype )showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = title;
    //hud.graceTime = 0.3;
    [view addSubview:hud];
    [hud showAnimated:animated];
    return hud;
}

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title moveY:(CGFloat) offY
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = title;
    [hud setCenter:CGPointMake(hud.center.x, hud.center.y+offY)];
    [view addSubview:hud];
    [hud showAnimated:animated];
    return hud;
}

+ (void)hideHUDsForViews:(NSArray *)views animated:(BOOL)animated
{
    for (UIView *subview in views) {
        [MBProgressHUD hideHUDsForViews:subview.subviews animated:animated];
    }
}

+ (instancetype)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text duration:(float)duration {
    
    UIWindow *win = [UIWindow mainWindow];
    [MBProgressHUD hideHUDForView:win  animated:NO];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:win];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = text;
    
    [win addSubview:HUD];
    [HUD showAnimated:YES];
    
    [HUD hideAnimated:YES afterDelay:duration];
    return HUD;
}

+ (instancetype)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration {
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:keyWindow];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = text;
    HUD.detailsLabel.text = detailsText;
    HUD.detailsLabel.font = detailsFont;
    
    [keyWindow addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:duration];
    
    return HUD;
}


@end
