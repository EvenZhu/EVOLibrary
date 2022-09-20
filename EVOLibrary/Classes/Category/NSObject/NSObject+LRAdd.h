//
//  NSObject+LRAdd.h
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/24.
//

#import <Foundation/Foundation.h>
#import "NSString+LRAdd.h"

NS_ASSUME_NONNULL_BEGIN

static BOOL is_empty(id input) {
    if (!input) {
        return YES;
    }
    
    if ([input isKindOfClass:[NSString class]]) {
        return [NSString lr_isEmpty:(NSString *)input];
    }
    return NO;
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
static BOOL non_empty(id input) {
    return !is_empty(input);
};
#pragma clang diagnostic pop

@interface NSObject (LRAdd)

///暂时只判断字符串 no set
@property (nonatomic, assign) BOOL isEmpty;

///暂时只判断字符串 no set
@property (nonatomic, assign) BOOL nonEmpty;

/// 把秒换算成小时
/// @param seconds 秒
+ (NSString *)getHourFromSeconds:(CGFloat)seconds;

/// 时间字符串格式转换
/// 2020-07-16转成 2020年07月16日
/// @param dateStr 时间字符串
+ (NSString *)getChineseYMDFormYMDHMS:(NSString *)dateStr;

@end

/**
 NSObject 增加的基于push推送的授权情况的询问和处理
 */
@interface NSObject (MFPushSetting)


/**
 是否允许推送通知的权限

 @return 是否授权
 */
- (BOOL)isAllowedNotification;


/**
 对于push权限未授权的操作
 */
- (void)handleNotAllowedPush;

@end

/**
  NSObject 手机号是否合法的校验
 */
@interface NSObject (MFPhoneVerify)

- (BOOL)checkTelNumber:(NSString *)telNumber;

@end

NS_ASSUME_NONNULL_END
