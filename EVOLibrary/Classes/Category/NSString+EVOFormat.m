//
//  NSString+EVOFormat.m
//  Expecta
//
//  Created by 祝彭辉 on 2022/6/8.
//

#import "NSString+EVOFormat.h"

@implementation NSString (EVOFormat)

NSString *NSStringFormat(NSString *format, ...) {
    va_list arglist;
    va_start(arglist, format);
    NSString *outStr = [[NSString alloc] initWithFormat:format arguments:arglist];
    va_end(arglist);
    
    return outStr;
}

NSString *NSStringFromInt(int intValue) {
    return NSStringFormat(@"%d", intValue);
}

NSString *NSStringFromInteger(NSInteger integerValue) {
    return NSStringFormat(@"%zd", integerValue);
}

NSString *NSStringFromUInteger(NSUInteger uIntegerValue) {
    return NSStringFormat(@"%tu", uIntegerValue);
}

NSString *NSStringFromFloat(float floatValue) {
    return NSStringFormat(@"%f", floatValue);
}

NSString *NSStringCGFloat(CGFloat cgFloatValue) {
    return NSStringFormat(@"%f", cgFloatValue);
}

NSString *NSStringDouble(double doubleValue) {
    return NSStringFormat(@"%lf", doubleValue);
}

NSString *AppendInt(NSString *str, int intValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringFromInt(intValue)];
}

NSString *AppendInteger(NSString *str, NSInteger integerValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringFromInteger(integerValue)];
}

NSString *AppendUInteger(NSString *str, NSUInteger uIntegerValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringFromUInteger(uIntegerValue)];
}

NSString *AppendFloat(NSString *str, float floatValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringFromFloat(floatValue)];
}

NSString *AppendCGFloat(NSString *str, CGFloat cgFloatValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringCGFloat(cgFloatValue)];
}

NSString *AppendDouble(NSString *str, double doubleValue) {
    return [EVOSafeStriing(str) stringByAppendingString:NSStringDouble(doubleValue)];
}

NSString *AppendString(NSString *str, NSString *appendString) {
    return [EVOSafeStriing(str) stringByAppendingString:EVOSafeStriing(appendString)];
}

@end
