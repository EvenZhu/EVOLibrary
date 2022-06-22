//
//  LRPayManager.h
//  LRTelemedicine_Patient
//
//  Created by liuyaobin on 2020/9/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRPayManager : NSObject


/// H5支付宝支付替换urlScheme
/// @param urlStr 支付宝支付完成返回url地址
+ (NSURL*)changeURLSchemeStr:(NSString*)urlStr;


/// 字符转字典
/// @param urlStr urlStr 
+ (NSDictionary*)dictionaryWithUrlString:(NSString*)urlStr;


@end

NS_ASSUME_NONNULL_END
