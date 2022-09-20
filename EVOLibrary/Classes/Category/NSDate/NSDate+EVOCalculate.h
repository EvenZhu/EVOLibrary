//
//  NSDate+EVOCalculate.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 日期格式和计算分类
@interface NSDate (EVOCalculate)

/// 获取当前日期的日、月、年、小时、分钟、秒
- (NSUInteger)year;
- (NSUInteger)month;
- (NSUInteger)day;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;

/// 获取指定日期的日、月、年、小时、分钟、秒
/// @param date 指定日期
+ (NSUInteger)year:(NSDate *)date;
+ (NSUInteger)month:(NSDate *)date;
+ (NSUInteger)day:(NSDate *)date;
+ (NSUInteger)hour:(NSDate *)date;
+ (NSUInteger)minute:(NSDate *)date;
+ (NSUInteger)second:(NSDate *)date;

/// 获取当前年份的总天数
- (NSUInteger)daysInYear;
/// 获取指定日期所在年份的总天数
/// @param date 指定的日期
+ (NSUInteger)daysInYear:(NSDate *)date;

/// 获取当前月份的天数
- (NSUInteger)daysInMonth;
/// 获取指定日期所在月份的天数
/// @param date 指定的日期
+ (NSUInteger)daysInMonth:(NSDate *)date;

/// 获取当前日期指定月份的天数
/// @param month 指定的月份
- (NSUInteger)daysInMonth:(NSUInteger)month;
/// 获取指定日期指定月份的天数
/// @param date 指定的日期
/// @param month 指定的月份
+ (NSUInteger)daysInMonth:(NSDate *)date month:(NSUInteger)month;

/// 判断当前年份是否为闰年
- (BOOL)isLeapYear;
/// 判断指定日期所在年份是否为闰年
/// @param date 指定日期
+ (BOOL)isLeapYear:(NSDate *)date;

/// 计算当前日期是当年的第几周
- (NSUInteger)weekOfYear;
/// 计算指定日期是当年的第几周
/// @param date 指定日期
+ (NSUInteger)weekOfYear:(NSDate *)date;

/// 获取当前日期格式化为YYYY-MM-dd格式的字符串
- (NSString *)formatYMD;
/// 获取当前日期指定日期格式化为YYYY-MM-dd格式的字符串
/// @param date 指定日期
+ (NSString *)formatYMD:(NSDate *)date;

/// 返回当前月一共有几周(可能为4,5,6)
- (NSUInteger)weeksOfMonth;
/// 返回指定日期所在月一共有几周(可能为4,5,6)
/// @param date 指定日期
+ (NSUInteger)weeksOfMonth:(NSDate *)date;

/// 获取当月的第一天的日期
- (NSDate *)begindayOfMonth;
/// 获取指定日期所在月的第一天的日期
/// @param date 指定日期
+ (NSDate *)begindayOfMonth:(NSDate *)date;

/// 获取当月的最后一天的日期
- (NSDate *)lastdayOfMonth;
/// 获取指定日期所在月份的最后一天的日期
/// @param date 指定日期
+ (NSDate *)lastdayOfMonth:(NSDate *)date;

/// 返回当前日期day天后的日期(若day为负数,则为|day|天前的日期)
/// @param day 指定天数
- (NSDate *)dateAfterDay:(NSUInteger)day;
/// 返回指定日期day天后的日期(若day为负数,则为|day|天前的日期)
/// @param date 指定日期
/// @param day 指定天数
+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day;

/// 返回当前日期month月后的日期(若month为负数,则为|month|月前的日期)
/// @param month 指定天数
- (NSDate *)dateAfterMonth:(NSUInteger)month;
/// 返回指定日期month月后的日期(若month为负数,则为|month|月前的日期)
/// @param date 指定日期
/// @param month 指定天数
+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month;

/// 返回当前时间numYears年后的日期
/// @param numYears 指定年数
- (NSDate *)offsetYears:(int)numYears;
/// 返回指定时间numYears年后的日期
/// @param numYears 指定年数
/// @param fromDate 指定日期
+ (NSDate *)offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/// 返回当前时间numMonths月后的日期
/// @param numMonths 指定月数
- (NSDate *)offsetMonths:(int)numMonths;
/// 返回指定时间numMonths月后的日期
/// @param numMonths 指定月数
/// @param fromDate 指定日期
+ (NSDate *)offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/// 返回当前时间numDays天后的日期
/// @param numDays 指定天数
- (NSDate *)offsetDays:(int)numDays;
/// 返回指定时间numDays天后的日期
/// @param numDays 指定天数
/// @param fromDate 指定日期
+ (NSDate *)offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/// 返回当前时间numHours小时后的日期
/// @param numHours 指定小时数
- (NSDate *)offsetHours:(int)numHours;
/// 返回指定时间numHours小时后的日期
/// @param numHours 指定小时数
/// @param fromDate 指定日期
+ (NSDate *)offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/// 距离当前日期前几天
- (NSUInteger)daysAgo;
/// 距离指定日期前几天
/// @param date 指定日期
+ (NSUInteger)daysAgo:(NSDate *)date;

/// 计算当前日期为星期几 - 数字
/// [1 - Sunday]、[2 - Monday]、[3 - Tuerday]、[4 - Wednesday]、[5 - Thursday]、[6 - Friday]、[7 - Saturday]
- (NSInteger)weekday;
/// 计算指定日期为星期几
/// @param date 指定日期
+ (NSInteger)weekday:(NSDate *)date;

/// 计算当前日期星期几 - 名称
/// 周日、周一、周二、周三、周四、周五、周六
- (NSString *)dayFromWeekday;
/// 计算指定日期为星期几
/// @param date 指定日期
+ (NSString *)dayFromWeekday:(NSDate *)date;

/// 当前日期是否和指定日期相等
/// @param date 指定的日期
- (BOOL)isSameDay:(NSDate*)date;

/// 是否是今天
- (BOOL)isToday;

/// 月份对应的名称 - 英文
/// @param month 月份
+ (NSString *)monthWithMonthNumber:(NSInteger)month;

/// 返回当前日期默认格式的字符串
- (NSString *)dateString;

/// 返回指定日期默认格式的字符串
/// @param date 指定的日期
+ (NSString *)dateString:(NSDate *)date;

/// 根据指定的格式返回指定日期字符串
/// @param date 指定日期
/// @param format 日期格式
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;

/// 根据指定的格式返回当前日期字符串
/// @param format 日期格式
- (NSString *)stringWithFormat:(NSString *)format;

/// 根据指定的格式返回指定日期字符串对应的日期
/// @param string 日期字符串
/// @param format 日期格式
+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format;

/// 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
- (NSString *)ymdFormat;
- (NSString *)hmsFormat;
- (NSString *)ymdHmsFormat;
+ (NSString *)ymdFormat;
+ (NSString *)hmsFormat;
+ (NSString *)ymdHmsFormat;

/// 返回当前时间戳
+(NSString *)timeToTimeStamps;

@end

NS_ASSUME_NONNULL_END
