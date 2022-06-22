//
//  LRUtility.h
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//debug
#define GatewayAddressDebug     @"http://39.106.206.137:8020"
#define ShareWebAddressDebug    @"http://192.168.1.18"
#define WebPageAddressDebug     @"http://192.168.1.18:8802"
#define FileServerAddressDebug  @"http://192.168.1.15:8011/file/"
#define VideoServerAddressDebug @"http://211.102.216.237:8088/fileServer/webapi"

//release
#define GatewayAddress     @"http://dhapi3.rz158.com"
#define ShareWebAddress    @"http://lianrenHealth.rz158.com"
#define WebPageAddress     @"http://lianrenHealth.rz158:8095"
#define FileServerAddress  @"http://lianrenHealth.rz158.com/file/"
#define VideoServerAddress @"http://lianrenHealth.rz158.com/fileServer/webapi"


extern NSString * gatewayAddress;
extern NSString * shareWebAddress;
extern NSString * shopWebAddress;
extern NSString * webPageAddress;
extern NSString * fileServerAddress;
extern NSString * videoServerAddress;


@interface LRUtility : NSObject

+ (void)showHintMessage:(NSString *)message;
+ (void)showHintMessage:(NSString *)message duration:(float)duration;

@end

NS_ASSUME_NONNULL_END
