//
//  NSString+LREmoji.h
//  LRTelemedicine_Patient
//
//  Created by liuyaobin on 2021/7/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LREmoji)

///return value 是否包含表情
+ (BOOL)stringContainsEmoji:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
