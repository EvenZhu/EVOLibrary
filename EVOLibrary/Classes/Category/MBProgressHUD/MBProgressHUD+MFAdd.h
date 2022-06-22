//
//  MBProgressHUD+MFAdd.h
//

#import <MBProgressHUD/MBProgressHUD.h>

/**
 MBProgressHUD 相关的便利方法
 */
@interface MBProgressHUD (MFAdd)

+ (void)showProcessTip:(NSString *)tip;
+ (void)showProcessTip:(NSString *)tip offY:(CGFloat)y;
+ (void)hideProcessTip;
+ (void)showSuccessTip:(NSString *)tip;
+ (void)showFailTip:(NSString *)tip;
+ (void)showFailTipInFront:(NSString *)tip;
+ (void)hideHUDsForViews:(NSArray *)views animated:(BOOL)animated;
+ (void)showHUDInFrontWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration;

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title;
+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title moveY:(CGFloat) offY;
+ (instancetype)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text duration:(float)duration ;
+ (instancetype)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration;

@end
