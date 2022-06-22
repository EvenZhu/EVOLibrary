//
//  NSString+file.m
//  weibo
//
//  Created by 祝彭辉 on 13-8-28.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)

- (NSString *)filenameAppend:(NSString *)append
{
    // 1.获取没有拓展名的文件名
    NSString *filename = [self stringByDeletingPathExtension];
    
    // 2.拼接append
    filename = [filename stringByAppendingString:append];
    
    // 3.拼接拓展名
    NSString *extension = [self pathExtension];
    
    // 4.生成新的文件名
    return [filename stringByAppendingPathExtension:extension];
}
- (NSString *)URLEncodeString
{
    NSString *URLEncodeString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,
                                                              NULL, // specify chars not to tansform
                                                              (CFStringRef)@"&+/=:?", // specify legal chars to tansform
                                                              kCFStringEncodingUTF8));
    return URLEncodeString;
}

- (NSString *)URLEncodeStringForUploadFile
{
    NSString *URLEncodeString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"&+/=",
                                                              kCFStringEncodingUTF8));
    // %3d %2f %2b -- = / +
    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%3D" withString:@"%3d"];
    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%2F" withString:@"%2f"];
    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%2B" withString:@"%2b"];
    
    return URLEncodeString;
}
- (NSString *)URLEncodeStringForUploadVideoFile
{
    NSString *URLEncodeString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"&+/=?:",
                                                              kCFStringEncodingUTF8));
    //    // %3d %2f %2b -- = / +
    //    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%3D" withString:@"%3d"];
    //    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%2F" withString:@"%2f"];
    //    URLEncodeString = [URLEncodeString stringByReplacingOccurrencesOfString:@"%2B" withString:@"%2b"];
    
    return URLEncodeString;
}


- (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}

-(NSString *)getDocumentFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    
    NSString *filePath = [path stringByAppendingPathComponent:self];
    
    return filePath;
}

@end
