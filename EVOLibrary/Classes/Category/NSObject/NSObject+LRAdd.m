//
//  NSObject+LRAdd.m
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/24.
//

#import "NSObject+LRAdd.h"
#import <UserNotifications/UserNotifications.h>
#import "MBProgressHUD+MFAdd.h"

@implementation NSObject (LRAdd)

- (void)showProcessTip:(NSString *)tip {
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:NO];
    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES withTitle:tip];
}

- (void)showProcessTip:(NSString *)tip offY:(CGFloat)y {
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:NO];
    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES withTitle:tip moveY:y];
}

- (void)hideProcessTip {
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:NO];
}

- (void)showSuccessTip:(NSString *)tip {
    if ([tip length] > 10) {
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_success" text:@"" detailText:tip detailFont:[UIFont boldSystemFontOfSize:14] duration:1.5];
    } else {
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_success" text:tip duration:1.5];
    }
}

- (void)showSuccessImage:(NSString *)image tip:(NSString *)tip {
    if ([tip length] > 10) {
        MBProgressHUD *hud = [MBProgressHUD showHUDInKeyWindowWithImage:image text:@"" detailText:tip detailFont:[UIFont boldSystemFontOfSize:14] duration:1.5];
        hud.backgroundColor = [UIColor whiteColor];
    } else {
        [MBProgressHUD showHUDInKeyWindowWithImage:image text:tip duration:1.5];
    }
}

- (void)showTip:(NSString *)tip {
    [self showTip:tip duration:2];
}

- (void)showTip:(NSString *)tip duration:(CGFloat)duration {
    UIWindow *window = [self bl_topsideWindow];
    [MBProgressHUD hideHUDsForViews:window animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    if (tip.length > 10) {
        hud.detailsLabel.text = tip;
        hud.detailsLabel.font = [UIFont boldSystemFontOfSize:14];
    } else {
        hud.label.text = tip;
    }
    hud.minShowTime = duration;
    [hud hideAnimated:YES afterDelay:duration];
}

- (void)showFailTip:(NSString *)tip {
    [self showFailTip:tip duration:1.5];
}

- (void)showFailTip:(NSString *)tip duration:(float)duration {
    if ([tip length] > 10) {
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_fail" text:@"" detailText:tip detailFont:[UIFont boldSystemFontOfSize:14] duration:duration];
    } else {
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_fail" text:tip duration:duration];
    }
}

- (UIWindow *)bl_topsideWindow {
    return [[UIApplication sharedApplication] keyWindow];
}

- (void)setIsEmpty:(BOOL)isEmpty {}

- (void)setNonEmpty:(BOOL)nonEmpty {}

- (BOOL)isEmpty {
    if (!self) {
        return YES;
    } else if ([self isKindOfClass:[NSString class]]) {
        return [NSString lr_isEmpty:(NSString *)self];
    }
    return NO;
}

- (BOOL)nonEmpty {
    if (self && ([self isKindOfClass:[NSString class]] && ![NSString lr_isEmpty:(NSString *)self])) {
        return YES;
    }
    return NO;
}

+ (NSString *)getHourFromSeconds:(CGFloat)seconds {
    NSString *hourStr = [NSString stringWithFormat:@"%.1f",(seconds/3600)];
    NSString *format_time = [NSString stringWithFormat:@"%@h",hourStr];
    return format_time;
}

+ (NSString *)getChineseYMDFormYMDHMS:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    return [formatter stringFromDate:date];
}

@end


@implementation NSObject (MFPushSetting)

- (BOOL)isAllowedNotification {
    
    __block BOOL enabled = NO;
    if(@available(iOS 10.0, *)){
        
        dispatch_semaphore_t sem;
        sem = dispatch_semaphore_create(0);
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            
            if(settings.authorizationStatus == UNAuthorizationStatusAuthorized){
                
                enabled = YES;
            }
            
            dispatch_semaphore_signal(sem);
        }];
        
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        
    }else{
        
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_10_0
        
        UIApplication *application = [UIApplication sharedApplication];
        if([application respondsToSelector:@selector(currentUserNotificationSettings)]){
            
            UIUserNotificationSettings *setting = [application currentUserNotificationSettings];
            if(setting.types != UIUserNotificationTypeNone){
                
                enabled = YES;
            }
        }
#endif
    }
    
    return enabled;
}

- (void)handleNotAllowedPush {
    
    if ([[UIDevice currentDevice] systemVersion] >= 8) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            
            NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]){
                
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    
                }];
            }else{
                
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_10_0
                [[UIApplication sharedApplication] openURL:url];
#endif
            }
        }
        return;
    }
}

@end


@implementation NSObject (MFPhoneVerify)

- (BOOL)checkTelNumber:(NSString *)telNumber {
    
    NSString *pattern = @"^[0-9]{11}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

@end

