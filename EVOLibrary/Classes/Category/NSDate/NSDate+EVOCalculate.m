//
//  NSDate+EVOCalculate.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/8.
//

#import "NSDate+EVOCalculate.h"

#define EVOCurrentCalendar  [NSCalendar currentCalendar]

@implementation NSDate (EVOCalculate)

- (NSUInteger)day { return [NSDate day:self]; }

- (NSUInteger)month { return [NSDate month:self]; }

- (NSUInteger)year { return [NSDate year:self]; }

- (NSUInteger)hour { return [NSDate hour:self]; }

- (NSUInteger)minute { return [NSDate minute:self]; }

- (NSUInteger)second { return [NSDate second:self]; }

+ (NSDateComponents *)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date {
    return [EVOCurrentCalendar components:unitFlags fromDate:date];
}

+ (NSUInteger)day:(NSDate *)date {
    return [[self components:NSCalendarUnitDay fromDate:date] day];
}

+ (NSUInteger)month:(NSDate *)date {
    return [[self components:NSCalendarUnitMonth fromDate:date] month];
}

+ (NSUInteger)year:(NSDate *)date {
    return [[self components:NSCalendarUnitYear fromDate:date] year];
}

+ (NSUInteger)hour:(NSDate *)date {
    return [[self components:NSCalendarUnitHour fromDate:date] hour];
}

+ (NSUInteger)minute:(NSDate *)date {
    return [[self components:NSCalendarUnitMinute fromDate:date] minute];
}

+ (NSUInteger)second:(NSDate *)date {
    return [[self components:NSCalendarUnitSecond fromDate:date] second];
}

- (NSUInteger)daysInYear {
    return [NSDate daysInYear:self];
}

+ (NSUInteger)daysInYear:(NSDate *)date {
    return [self isLeapYear:date] ? 366 : 365;
}

- (NSUInteger)daysInMonth {
    return [NSDate daysInMonth:self];
}

+ (NSUInteger)daysInMonth:(NSDate *)date {
    return [self daysInMonth:date month:[date month]];
}

- (NSUInteger)daysInMonth:(NSUInteger)month {
    return [NSDate daysInMonth:self month:month];
}

+ (NSUInteger)daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (BOOL)isLeapYear {
    return [NSDate isLeapYear:self];
}

+ (BOOL)isLeapYear:(NSDate *)date {
    NSUInteger year = [date year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)formatYMD {
    return [NSDate formatYMD:self];
}

+ (NSString *)formatYMD:(NSDate *)date {
    return NSStringFormat(@"%lu-%02lu-%02lu",(unsigned long)[date year],(unsigned long)[date month], (unsigned long)[date day]);
}

- (NSUInteger)weeksOfMonth {
    return [NSDate weeksOfMonth:self];
}

+ (NSUInteger)weeksOfMonth:(NSDate *)date {
    return [[date lastdayOfMonth] weekOfYear] - [[date begindayOfMonth] weekOfYear] + 1;
}

- (NSUInteger)weekOfYear {
    return [NSDate weekOfYear:self];
}

+ (NSUInteger)weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date year];
    
    NSDate *lastdate = [date lastdayOfMonth];
    
    for (i = 1; [[lastdate dateAfterDay:-7 * i] year] == year; i++) { }
    
    return i;
}

- (NSDate *)dateAfterDay:(NSUInteger)day {
    return [NSDate dateAfterDate:self day:day];
}

+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [EVOCurrentCalendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)dateAfterMonth:(NSUInteger)month {
    return [NSDate dateAfterDate:self month:month];
}

+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [EVOCurrentCalendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)begindayOfMonth {
    return [NSDate begindayOfMonth:self];
}

+ (NSDate *)begindayOfMonth:(NSDate *)date {
    return [self dateAfterDate:date day:-[date day] + 1];
}

- (NSDate *)lastdayOfMonth {
    return [NSDate lastdayOfMonth:self];
}

+ (NSDate *)lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self begindayOfMonth:date];
    return [[lastDate dateAfterMonth:1] dateAfterDay:-1];
}

- (NSUInteger)daysAgo {
    return [NSDate daysAgo:self];
}

+ (NSUInteger)daysAgo:(NSDate *)date {
    NSDateComponents *components = [EVOCurrentCalendar components:(NSCalendarUnitDay)
                                                         fromDate:date
                                                           toDate:[NSDate date]
                                                          options:0];
    
    return [components day];
}

- (NSInteger)weekday {
    return [NSDate weekday:self];
}

+ (NSInteger)weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)dayFromWeekday {
    return [NSDate dayFromWeekday:self];
}

+ (NSString *)dayFromWeekday:(NSDate *)date {
    NSArray *weeks = @[@"",
                       @"周日",
                       @"周一",
                       @"周二",
                       @"周三",
                       @"周四",
                       @"周五",
                       @"周六"];
    NSInteger week = [date weekday];
    if (week <= weeks.count) {
        return weeks[week];
    }
    return @"";
}

- (BOOL)isSameDay:(NSDate *)anotherDate {
    NSDateComponents *components1 = [EVOCurrentCalendar components:(NSCalendarUnitYear
                                                                    | NSCalendarUnitMonth
                                                                    | NSCalendarUnitDay)
                                                          fromDate:self];
    NSDateComponents *components2 = [EVOCurrentCalendar components:(NSCalendarUnitYear
                                                                    | NSCalendarUnitMonth
                                                                    | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)isToday {
    return [self isSameDay:[NSDate date]];
}

+ (NSString *)monthWithMonthNumber:(NSInteger)month {
    NSArray *months = @[@"",
                       @"January",
                       @"February",
                       @"March",
                       @"April",
                       @"May",
                       @"June",
                       @"July",
                       @"August",
                       @"September",
                       @"October",
                       @"November",
                       @"December"];
    if (month <= months.count) {
        return months[month];
    }
    return @"";
}

- (NSString *)dateString {
    return [self stringWithFormat:[self ymdFormat]];
}

+ (NSString *)dateString:(NSDate *)date {
    return [date stringWithFormat:[self ymdFormat]];
}

+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date stringWithFormat:[self ymdFormat]];
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSString *)ymdFormat { return [NSDate ymdFormat]; }

- (NSString *)hmsFormat { return [NSDate hmsFormat]; }

- (NSString *)ymdHmsFormat { return [NSDate ymdHmsFormat]; }

+ (NSString *)ymdFormat { return @"yyyy-MM-dd"; }

+ (NSString *)hmsFormat { return @"HH:mm:ss"; }

+ (NSString *)ymdHmsFormat {
    return NSStringFormat(@"%@ %@", [self ymdFormat], [self hmsFormat]);
}

- (NSDate *)offsetYears:(int)numYears {
    return [NSDate offsetYears:numYears fromDate:self];
}

+ (NSDate *)offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) { return nil; }
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [[self calendar] dateByAddingComponents:offsetComponents
                                            toDate:fromDate
                                           options:0];
}

- (NSDate *)offsetMonths:(int)numMonths {
    return [NSDate offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) { return nil; }
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [[self calendar] dateByAddingComponents:offsetComponents
                                            toDate:fromDate
                                           options:0];
}

- (NSDate *)offsetDays:(int)numDays {
    return [NSDate offsetDays:numDays fromDate:self];
}

+ (NSDate *)offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) { return nil; }
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [[self calendar] dateByAddingComponents:offsetComponents
                                            toDate:fromDate
                                           options:0];
}

- (NSDate *)offsetHours:(int)hours {
    return [NSDate offsetHours:hours fromDate:self];
}

+ (NSDate *)offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) { return nil; }
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [[self calendar] dateByAddingComponents:offsetComponents
                                            toDate:fromDate
                                           options:0];
}

+ (NSCalendar *)calendar {
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
}

+ (NSString *)timeToTimeStamps {
    NSDate *sendDate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddHHmm"];
    NSString *timeStamps=[dateformatter stringFromDate:sendDate];
    return timeStamps;
}

@end
