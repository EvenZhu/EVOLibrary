//
//  NSString+EVOFormat.h
//  Expecta
//
//  Created by 祝彭辉 on 2022/6/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 字符串生成和转换分类
@interface NSString (EVOFormat)

/// 生成一个格式化字符串
/// @param format 格式化内容
FOUNDATION_EXPORT NSString *NSStringFormat(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

/// 根据int类型数值生成字符串
/// @param intValue int类型数值
FOUNDATION_EXPORT NSString *NSStringFromInt(int intValue);

/// 根据NSInteger类型数值生成字符串
/// @param integerValue Integer类型数值
FOUNDATION_EXPORT NSString *NSStringFromInteger(NSInteger integerValue);

/// 根据NSUInteger类型数值生成字符串
/// @param uIntegerValue NSUInteger类型数值
FOUNDATION_EXPORT NSString *NSStringFromUInteger(NSUInteger uIntegerValue);

/// 根据float类型数值生成字符串
/// @param floatValue float类型数值
FOUNDATION_EXPORT NSString *NSStringFromFloat(float floatValue);

/// 根据CGFloat类型数值生成字符串
/// @param cgFloatValue CGFloat类型数值
FOUNDATION_EXPORT NSString *NSStringCGFloat(CGFloat cgFloatValue);

/// 根据double类型数值生成字符串
/// @param doubleValue double类型数值
FOUNDATION_EXPORT NSString *NSStringDouble(double doubleValue);

/// 将int类型数值拼接到字符串
/// @param str 字符串
/// @param intValue int类型数值
FOUNDATION_EXPORT NSString *AppendInt(NSString *str, int intValue);

/// 将NSInteger类型数值拼接到字符串
/// @param str 字符串
/// @param integerValue NSInteger类型数值
FOUNDATION_EXPORT NSString *AppendInteger(NSString *str, NSInteger integerValue);

/// 将NSUInteger类型数值拼接到字符串
/// @param str 字符串
/// @param uIntegerValue NSUInteger类型数值
FOUNDATION_EXPORT NSString *AppendUInteger(NSString *str, NSUInteger uIntegerValue);

/// 将float类型数值拼接到字符串
/// @param str 字符串
/// @param floatValue float类型数值
FOUNDATION_EXPORT NSString *AppendFloat(NSString *str, float floatValue);

/// 将CGFloat类型数值拼接到字符串
/// @param str 字符串
/// @param cgFloatValue CGFloat类型数值
FOUNDATION_EXPORT NSString *AppendCGFloat(NSString *str, CGFloat cgFloatValue);

/// 将double类型数值拼接到字符串
/// @param str 字符串
/// @param doubleValue double类型数值
FOUNDATION_EXPORT NSString *AppendDouble(NSString *str, double doubleValue);

/// 将两个字符串进行拼接
/// @param str 字符串
/// @param appendString 拼接字符串
FOUNDATION_EXPORT NSString *AppendString(NSString *str, NSString *appendString);

@end

NS_ASSUME_NONNULL_END
