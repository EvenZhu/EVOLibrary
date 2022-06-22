//
//  NSString+LRAdd.h
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LRAdd)

/**
 字符串转为富文本字符串

 @param targets 需要特殊处理的字符串数组，传入的字符串在整个字符串中存在多个时，会全部做处理
 @param targetAtattriDicArray 需要特殊处理的字符串对应的富文本字典数组,如果数组数量和 targets数组一致，则会一一对应，
                              如果数组数量小于targets，则targets中后面的字符串都按targetAtattriDicArray的第一个进行处理
 @param basicAttriDic 整个字符串需要的富文本处理字典
 @return 富文本字符串
 */
- (NSAttributedString *)exchangeToAttributtedString:(NSArray<NSString *> *)targets
                              targetAtattriDicArray:(NSArray<NSDictionary<NSAttributedStringKey,id> *> *)targetAtattriDicArray
                                      basicAttriDic:(NSDictionary<NSAttributedStringKey,id> *)basicAttriDic;


/**
 查找字符串中含有的多个字字符串

 @param targetText 需要查找的子字符串
 @return NSRange转成的NSValue的数组
 */
- (NSArray<NSValue *> *)getSubStringRangesWithTargetText:(NSString *)targetText;

/**
 身份证查出年龄

 @param IDStr 需要查找的子字符串
 @return 年龄
 */
- (NSString *)calculateAgeStr:(NSString *)IDStr;

/**
*时间戳转化成 时间
*/
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format ;


/// 时间字符串格式转换
/// 2020-07-16 16:08:06转成 2020-07-16
/// @param dateStr 时间字符串
+ (NSString *)getYMDFormYMDHMS:(NSString *)dateStr;

/// 时间字符串格式转换
/// 2020-07-16转成 2020年07月16日
/// @param dateStr 时间字符串
+ (NSString *)getChineseYMDFormYMD:(NSString *)dateStr;

/// 获取当前日期（带时分秒）
+(NSString *)getNowFullDate;

/// 获取当前时间-多少天之前
/// @param days 天数
+ (NSString *)getFullDateBefor:(NSInteger)days;
/// 获取当前时间-多少天之后
/// @param days 天数
+ (NSString *)getFullDateAfter:(NSInteger)days;

+ (BOOL)lr_isEmpty:(NSString *)aString;

//去除首尾空格
+ (NSString *)getStripHeadAndTailSpace:(NSString *)originalString;
//避免nil,则返回空
+(NSString *)avoidNilValue:(NSString *)value;
//json转成json串
+(NSString *)jsonConvertToJsonString:(NSDictionary *)dict;
//秒转时分秒
+ (NSString*)timeformatFromSeconds:(NSInteger)seconds;


/// 获取周几
/// @param string 数字字符串
+ (NSString *)getDayOfWeekWith:(NSString *)string;

/// 对敏感信息进行隐藏
/// @param ruleRange 范围
/// @param stars 星星数
- (NSString *)hideSensitiveRules:(NSRange)ruleRange starsLength:(NSInteger)stars;

- (NSString *)replaceCharactersInReplaceRange:(NSRange)replaceRange;

@end


/**
 * 单行的包含有中文字符的文本使用lineSpacing时，默认的attribute string会在后面多加一行空白行
 * 此category解决 多加一行空白行的 问题
 */

@interface NSString (LRLinespace)


/**
 根据参数创建属性字符串
 */
- (NSAttributedString *)getAttributeStringWithSize:(CGSize)size
                                              font:(UIFont *)font
                                       lineSpacing:(CGFloat)lineSpacing;

/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)realBoundingRectWithSize:(CGSize)size
                              font:(UIFont*)font
                       lineSpacing:(CGFloat)lineSpacing;

/**
 * 计算最大行数文字高度，可以处理计算带行间距的
 */
- (CGFloat)realBoundingRectWithSize:(CGSize)size
                               font:(UIFont*)font
                        lineSpacing:(CGFloat)lineSpacing
                           maxLines:(NSInteger)maxLines;


/**
 *  计算是否超过一行
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size
                             font:(UIFont *)font
                     lineSpaceing:(CGFloat)lineSpacing;


///16进制字符串转数字
- (NSInteger)get16Number;

@end


@interface NSString (LRCheckString)

- (BOOL)checkPassword;

@end

NS_ASSUME_NONNULL_END
