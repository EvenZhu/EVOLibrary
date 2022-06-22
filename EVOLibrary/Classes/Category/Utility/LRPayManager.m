//
//  LRPayManager.m
//  LRTelemedicine_Patient
//
//  Created by liuyaobin on 2020/9/4.
//

#import "LRPayManager.h"

@implementation LRPayManager

+ (NSURL*)changeURLSchemeStr:(NSString*)urlStr {
    NSString* tmpUrlStr = urlStr.copy;
    if([urlStr containsString:@"fromAppUrlScheme"]) {
        NSDictionary* tmpDic = [self dictionaryWithUrlString:tmpUrlStr];
        NSString* tmpValue = [tmpDic valueForKey:@"fromAppUrlScheme"];
        tmpUrlStr = [[tmpUrlStr stringByReplacingOccurrencesOfString:tmpValue withString:@"LRTelemedicine"] mutableCopy];
        tmpUrlStr = [[tmpUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] mutableCopy];
    }
    NSURL * newURl = [NSURL URLWithString:tmpUrlStr];
    return newURl;
}

+ (NSDictionary*)dictionaryWithUrlString:(NSString*)urlStr {
    if(urlStr && urlStr.length&& [urlStr rangeOfString:@"?"].length==1) {
        NSArray *array = [urlStr componentsSeparatedByString:@"?"];
        if(array && array.count==2) {
            NSString*paramsStr = array[1];
            if(paramsStr.length) {
                NSString* paramterStr = [paramsStr stringByRemovingPercentEncoding];
                NSData *jsonData = [paramterStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
                return responseDic;
            }
        }
    }
    return nil;
}

@end
