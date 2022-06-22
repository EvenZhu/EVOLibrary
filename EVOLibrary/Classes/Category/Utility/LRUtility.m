//
//  LRUtility.m
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/25.
//

#import "LRUtility.h"
#include <CommonCrypto/CommonHMAC.h>
#include <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSString+File.h"

#ifdef DEBUG
NSString * gatewayAddress = GatewayAddressDebug;
NSString * shareWebAddress = ShareWebAddressDebug;
NSString * webPageAddress = WebPageAddressDebug;
NSString * fileServerAddress = FileServerAddressDebug;
NSString * videoServerAddress = VideoServerAddressDebug;

#else
NSString * gatewayAddress = GatewayAddress;
NSString * shareWebAddress = ShareWebAddress;
NSString * webPageAddress = WebPageAddress;
NSString * fileServerAddress = FileServerAddress;
NSString * videoServerAddress = VideoServerAddress;

#endif

@implementation LRUtility


+ (void)showHintMessage:(NSString *)message {
    [self showHintMessage:message duration:2];
}

+ (void)showHintMessage:(NSString *)message duration:(float)duration {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenBounds.size.width;
    CGFloat screenHeight = screenBounds.size.height;
    CGFloat currentWidth = screenWidth - 40;
    CGSize boundSize = CGSizeMake(currentWidth, CGFLOAT_MAX);
    
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect requiredRect = [message boundingRectWithSize:boundSize options:NSStringDrawingUsesLineFragmentOrigin  attributes:attr context:nil];
    CGSize labelSize = requiredRect.size;
    label.frame = CGRectMake(10, 5, labelSize.width, labelSize.height);
    
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    [showview addSubview:label];
    
    showview.frame = CGRectMake((screenWidth - labelSize.width - 20)/2, screenHeight / 2, labelSize.width+20, labelSize.height+10);
    [UIView animateWithDuration:duration animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}



@end
