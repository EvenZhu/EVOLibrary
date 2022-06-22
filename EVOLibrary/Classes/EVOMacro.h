//
//  EVOMacro.h
//  Pods
//
//  Created by 祝彭辉 on 2022/6/8.
//

#ifndef EVOMacro_h
#define EVOMacro_h

#pragma mark - 系统相关

/// 检测当前设备是否为iPhone
#define EVOIsIPhone                 (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/// 检测当前设备是否为全面屏iPhone - 高于iPhoneX
#define EVOIsFullScreenIPhone       EVOScreenWidth >= 375.0f && EVOScreenHeight >= 812.0f && EVOIsIPhone
/// 屏幕bounds
#define EVOScreenBounds [UIScreen mainScreen].bounds
/// 屏幕宽高
#define EVOScreenWidth  EVOScreenBounds.size.width
/// 屏幕高度
#define EVOScreenHeight EVOScreenBounds.size.height
/// 导航栏高度
#define EVONavBarHeight             (44)
/// 状态栏高度
#define EVOStatusBarHeight          [EVOApp statusBarFrame].size.height
/// 状态栏+导航栏高度
#define EVONavBarAndStatusBarHeight (EVOStatusBarHeight + EVONavBarHeight)
/// TabBar高度
#define EVOTabBarHeight             (CGFloat)(EVOIsFullScreenIPhone?(49.0 + 34.0):(49.0))
/// 顶部安全区域远离高度
#define EVOTopBarSafeHeight         (CGFloat)(EVOIsFullScreenIPhone?(44.0):(0))
/// 底部安全区域远离高度
#define EVOBottomSafeHeight         (CGFloat)(EVOIsFullScreenIPhone?(34.0):(0))
/// iPhoneX的状态栏高度差值
#define EVOTopBarDifHeight          (CGFloat)(EVOIsFullScreenIPhone?(24.0):(0))
/// 导航条和Tabbar总高度
#define EVONavAndTabHeight          (EVONavBarAndStatusBarHeight + EVOTabBarHeight)


#pragma mark - APP相关

/// UIApplication单例
#define EVOApp                  [UIApplication sharedApplication]
/// 系统AppDelegate
#define APPDELEGATE             [EVOApp delegate]
/// 当前App的根视图
#define EVOAppWindow            EVOEVOApp.delegate.window
/// 当前App的keyWindow
#define APPKeyWindow            (EVOApp.keyWindow) ? : EVOApp.windows.firstObject
/// 根控制器
#define EVORootVC               EVOAppWindow.rootViewController
/// NSUserDefaults单例
#define EVOUserDefaults         [NSUserDefaults standardUserDefaults]
/// 管理中心
#define EVONotificationCenter   [NSNotificationCenter defaultCenter]
/// 应用mainBundle
#define EVOMainBundle           [NSBundle mainBundle]
/// 应用内部版本号build - 99 or x.x.x
#define EVOAPPBuild             [EVOMainBundle objectForInfoDictionaryKey:@"CFBundleVersion"]
/// 应用外部版本号 - x.x.x
#define EVOAPPVersion           [EVOMainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


#pragma mark - 颜色和字体

/// 16进制数转换rabValue - EVORgbValue(0x333333)
#define EVORgbValue(rgbValue, bit)  ((float)((rgbValue & (bit == 16 ? 0xFF0000 : bit == 8 ? 0xFF00 : 0xFF)) >> bit)) / 255.0
/// 带透明度的16进制颜色-  - EVORgbValue(0x333333, 0.5)
#define EVOHexAColor(rgbValue, a)   [UIColor colorWithRed:EVORgbValue(rgbValue, 16) \
                                    green:EVORgbValue(rgbValue, 8) \
                                    blue:EVORgbValue(rgbValue, 0) alpha:a]
/// 16进制颜色 - EVOHexColor(0x333333)
#define EVOHexColor(rgbValue)       EVOHexAColor(rgbValue, 1.0)
/// 带透明度的RGB颜色
#define EVORGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define EVORGB(r,g,b)               EVORGBA(r, g, b, 1.0f)
/// 快捷创建苹方普通字体
#define EVOFont(s)                  [UIFont systemFontOfSize:s]
/// 快捷创建苹方light字体
#define EVOLightFont(s)             [UIFont lightFont:s]
/// 快捷创建苹方regular字体
#define EVORegularFont(s)           [UIFont regularFont:s]
/// 快捷创建苹方medium字体
#define EVOMediumFont(s)            [UIFont mediumFont:s]
/// 快捷创建苹方semibold字体
#define EVOSemiboldFont(s)          [UIFont semiboldFont:s]
/// 快捷创建苹方粗体字体
#define EVOBoldFont(s)              [UIFont systemFontOfSize:s weight:UIFontWeightBold]
/// 普通20号字体
#define EVOFont20 EVOFont(20)
/// 普通16号字体
#define EVOFont16 EVOFont(16)
/// 普通15号字体
#define EVOFont15 EVOFont(15)
/// 普通14号字体
#define EVOFont14 EVOFont(14)
/// 普通12号字体
#define EVOFont12 EVOFont(12)
/// 粗体14号字体
#define EVOBoldFont14 EVOBoldFont(14)
/// 粗体16号字体
#define EVOBoldFont16 EVOBoldFont(16)
/// 粗体20号字体
#define EVOBoldFont20 EVOBoldFont(20)


#pragma mark - 尺寸相关

/// App触发区域默认宽高
#define EVONormalHeight 44
/// 大间距
#define EVOLARGE_SPACE  30
/// 中间距
#define EVOMediumSpace  20
/// 普通间距
#define EVONormalSpace  15
/// 小间距
#define EVOSMALL_SPACE  10
/// 最小间距
#define EVOMIN_SPACE       5


#pragma mark - 快捷操作

/// 判断字符串非空
#define EVOValidString(s)   (s != nil && ![s isKindOfClass:[NSNull class]] && [s isKindOfClass:[NSString class]] && s.length)
/// 判断字典非空
#define EVOValidDict(d)     (d != nil && [d isKindOfClass:[NSDictionary class]] && d.allKeys.count)
/// 判断数组非空
#define EVOValidArray(a)    (a != nil && [a isKindOfClass:[NSArray class]] && a.count)
/// 获取一个安全的字符串 - 为空则返回空字符串
#define EVOSafeStriing(s)   (EVOValidString(s) ? s : @"")
/// 判断对象是否为空
#define EVOIsNull(obj) (obj == nil || [obj isEqual:[NSNull null]] || [obj isKindOfClass:[NSNull class]])
/// 打印日志 - 方法、行号、日期、log内容
#if DEBUG
#define NSLog(FORMAT, ...)  fprintf(stderr,"Log at %s:%d on %s\n \t%s\n", \
                            __FUNCTION__, __LINE__, NSDate.date.description.UTF8String, \
                            [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
/// 系统进程信息参数
#define EVOProcessArguments                 [[NSProcessInfo processInfo] arguments]
/// 系统进程信息是否含有指定参数
#define EVOHasProcessArgument(argumentName) [EVOProcessArguments containsObject:argumentName]
/// 根据名称生成UIImage对象 - 图片在Images.xcassets中
#define EVOImageNamed(imageName) [UIImage imageNamed:imageName]
/// 获取文字自适应宽度
#define EVOBoundingSize(text, width, font)  [text boundingRectWithSize:CGSizeMake(width, 30) \
                                            options:NSStringDrawingUsesLineFragmentOrigin \
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} \
                                            context:nil]
/// 单例生成代码 - 头文件
#define EVOSingletonH \
+ (instancetype)shared;
/// 单例生成代码 - 实现文件
#define EVOSingletonM(className) \
static className* _instace = nil; \
+ (instancetype)shared \
{ \
if (_instace == nil) { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[super allocWithZone:NULL] init];\
}); \
} \
return _instace; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
return [self shared];\
} \

#endif /* EVOMacro_h */
