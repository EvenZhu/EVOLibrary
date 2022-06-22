//
//  NSString+LRAdd.m
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/27.
//

#import "NSString+LRAdd.h"

@implementation NSString (LRAdd)

- (NSAttributedString *)exchangeToAttributtedString:(NSArray<NSString *> *)targets targetAtattriDicArray:(NSArray<NSDictionary<NSAttributedStringKey,id> *> *)targetAtattriDicArray basicAttriDic:(NSDictionary<NSAttributedStringKey,id> *)basicAttriDic {
    NSMutableAttributedString *mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:self attributes: basicAttriDic];
    if (targets.count > 0 && targetAtattriDicArray.count > 0) {
        for (int i = 0; i < targets.count; i ++) {
            NSString *targetStr = targets[i];
            NSArray *arr = [self getSubStringRangesWithTargetText:targetStr];
            if (arr.count > 0) {
                NSDictionary *dic = nil;
                if (i < targetAtattriDicArray.count) {
                    dic = targetAtattriDicArray[i];
                } else {
                    dic = targetAtattriDicArray[0];
                }
                for (NSValue *value in arr) {
                    NSRange range = [value rangeValue];
                    [mutableAttriStr addAttributes:dic range:range];
                }
            }
        }
    }
    return [mutableAttriStr copy];
}

//计算年龄
- (NSString *)calculateAgeStr:(NSString *)IDStr {
  //截取身份证的出生日期并转换为日期格式
    NSString *dateStr = [self subsIDStrToDate:IDStr];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-mm-dd";
    NSDate *birthDate =  [formatter dateFromString:dateStr];
    NSTimeInterval dateDiff = [birthDate timeIntervalSinceNow];
    // 计算年龄
    int age  =  trunc(dateDiff/(60*60*24))/365;
    NSString *ageStr = [NSString stringWithFormat:@"%d", -age];
    return ageStr;
}

//截取身份证的出生日期并转换为日期格式
-(NSString *)subsIDStrToDate:(NSString *)str{
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *dateStr = [str substringWithRange:NSMakeRange(6, 8)];
    NSString  *year = [dateStr substringWithRange:NSMakeRange(0, 4)];
    NSString  *month = [dateStr substringWithRange:NSMakeRange(4, 2)];
    NSString  *day = [dateStr substringWithRange:NSMakeRange(6,2)];
    
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    
    return result;
}

- (NSArray<NSValue *> *)getSubStringRangesWithTargetText:(NSString *)targetText {
    NSMutableArray *arrayRanges = [NSMutableArray array];
    NSError *err= nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:targetText options:NSRegularExpressionCaseInsensitive error:&err];
    NSArray *results = [regex matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    if (err) {
        return nil;
    }
    for (NSTextCheckingResult *result in results) {
        [arrayRanges addObject:[NSValue valueWithRange:result.range]];
    }
    return arrayRanges;
}

+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd HH:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp / 1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}

+ (NSString *)getYMDFormYMDHMS:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
}

+ (NSString *)getChineseYMDFormYMD:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    return [formatter stringFromDate:date];
}

+ (NSString *)getNowFullDate {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)getFullDateBefor:(NSInteger)days {
    NSTimeInterval daysInte = 24*60*60*days;
    NSDate *now = [NSDate date];
    NSDate *intervalDays = [now dateByAddingTimeInterval:-daysInte];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:intervalDays];
    return dateStr;
}

+ (NSString *)getFullDateAfter:(NSInteger)days {
    NSTimeInterval daysInte = 24*60*60*days;
    NSDate *now = [NSDate date];
    NSDate *intervalDays = [now dateByAddingTimeInterval:daysInte];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:intervalDays];
    return dateStr;
}

+ (BOOL)lr_isEmpty:(NSString *)aString {
    if ((NSNull *)aString == [NSNull null]) {
        return YES;
    }
    if (aString == nil) {
        return YES;
    } else if ([aString length] == 0) {
        return YES;
    } else {
        aString = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([aString length] == 0) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)getStripHeadAndTailSpace:(NSString *)originalString {
    return [originalString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)avoidNilValue:(NSString *)value {
    if (!value || [value isEqual:[NSNull null]]) {
        return @"";
    }
    return value;
}

+ (NSString *)jsonConvertToJsonString:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"json解析失败:%@", error);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSString*)timeformatFromSeconds:(NSInteger)seconds {
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];

    return format_time;
}

+ (NSString *)getDayOfWeekWith:(NSString *)string {
    NSInteger week = [string integerValue];
    NSString *weekStr = @"";
    switch (week) {
        case 1:
            weekStr = @"周一";
            break;
        case 2:
            weekStr = @"周二";
            break;
        case 3:
            weekStr = @"周三";
            break;
        case 4:
            weekStr = @"周四";
            break;
        case 5:
            weekStr = @"周五";
            break;
        case 6:
            weekStr = @"周六";
            break;
        case 7:
            weekStr = @"周日";
            break;
        default:
            break;
    }
    return weekStr;
}

- (NSString *)hideSensitiveRules:(NSRange)ruleRange starsLength:(NSInteger)stars {
    if (!self || self.length < ruleRange.location + ruleRange.length) {
        return self;
    }
    
    NSMutableString * starString = [NSMutableString string];
    NSInteger x = 0;
    while (x++ < stars) {
        [starString appendString:@"*"];
    }
    
    NSMutableString *string = [NSMutableString stringWithString:self];
    return [string stringByReplacingCharactersInRange:ruleRange withString:starString];
}

- (NSString *)replaceCharactersInReplaceRange:(NSRange)replaceRange {
    if (self.length < replaceRange.location) {
        return self;
    }
    NSMutableString *string = [NSMutableString stringWithString:self];
    return [string stringByReplacingCharactersInRange:replaceRange withString:@"..."];
}

@end


@implementation NSString (LRLinespace)

- (NSAttributedString *)getAttributeStringWithSize:(CGSize)size
                                              font:(UIFont *)font
                                       lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self ?: @""];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    
    CGRect rect = [self systemBoundingRectWithSize:size font:font lineSpacing:lineSpacing];
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    CGFloat realLineSpacing = ((rect.size.height - font.lineHeight) <= lineSpacing) ? 0 : lineSpacing;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = realLineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    
    return attributeString;
}

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)realBoundingRectWithSize:(CGSize)size
                              font:(UIFont*)font
                       lineSpacing:(CGFloat)lineSpacing {
    
    CGRect rect = [self systemBoundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= lineSpacing) {
        if ([self containChinese:self]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x,
                              rect.origin.y,
                              rect.size.width,
                              rect.size.height-lineSpacing);
        }
    }
    
    return rect.size;
}

/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)realBoundingRectWithSize:(CGSize)size
                               font:(UIFont*)font
                        lineSpacing:(CGFloat)lineSpacing
                           maxLines:(NSInteger)maxLines {
    
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = font.lineHeight * maxLines + lineSpacing * (maxLines - 1);
    
    CGSize orginalSize = [self realBoundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if (orginalSize.height >= maxHeight) {
        return maxHeight;
    } else {
        return orginalSize.height;
    }
}

/**
 *  计算是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size
                             font:(UIFont *)font
                     lineSpaceing:(CGFloat)lineSpacing {
    
    if (([self realBoundingRectWithSize:size font:font lineSpacing:lineSpacing].height) > font.lineHeight) {
        return YES;
    } else {
        return NO;
    }
}

//判断是否包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

- (CGRect)systemBoundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attrs = @{
                            NSFontAttributeName: font,
                            NSParagraphStyleAttributeName: paragraphStyle
                            };
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [self boundingRectWithSize:size
                                     options:options
                                  attributes:attrs
                                     context:nil];
    return rect;
}

@end


@implementation NSString (LRCheckString)

- (BOOL)checkPassword {
   
    NSInteger alength = [self length];
  
    BOOL hasCapital = NO;//包含大写字母
    BOOL hasLowercase = NO;//包含小写字母
    BOOL hasNumber = NO;//包含数字
    BOOL hasSpecial = NO;//包含特殊字符
  
    for (int i = 0; i < alength; i++) {
        char commitChar = [self characterAtIndex: i];
        
        if ((commitChar > 64) && (commitChar < 91)) {
            hasCapital = YES;//字符串中含有大写英文字母
        } else if ((commitChar > 96) && (commitChar < 123)) {
            hasLowercase = YES;//字符串中含有小写英文字母
        } else if ((commitChar > 47) && (commitChar < 58)) {
            hasNumber = YES;//字符串中含有数字
        } else {
            hasSpecial = YES;//字符串中含有非法字符
        }
    }
    
    NSInteger index = 0;
    if (hasCapital) {
        index ++;
    }
    if (hasLowercase) {
        index ++;
    }
    if (hasNumber) {
        index ++;
    }
    if (hasSpecial) {
        index ++;
    }
    return index >= 3 ? YES : NO;

}


- (NSInteger)get16Number {
    
    NSString *s = self;
    
    if ([s hasPrefix:@"#"]) {
        s = [s substringFromIndex:1];
    }
    
    return strtoul(s.UTF8String, 0, 16);
}

@end
