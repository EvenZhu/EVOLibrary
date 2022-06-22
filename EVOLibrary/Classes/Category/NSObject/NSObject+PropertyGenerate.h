//
//  NSObject+PropertyGenerate.h
//  LRRemoteTreatment
//
//  Created by lyb on 2020/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (PropertyGenerate)

/**
 *  自动生成属性申明Code
 *
 *  @param dict 传入的字典
 */
+ (void)propertyCodeWithDictionary:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
