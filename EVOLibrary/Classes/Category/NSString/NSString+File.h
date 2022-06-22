//
//  NSString+file.h
//  weibo
//
//  Created by 祝彭辉 on 13-8-28.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)

- (NSString *)filenameAppend:(NSString *)append;

- (NSString *)URLEncodeString;

- (NSString *)URLEncodeStringForUploadFile;

- (NSString *)URLEncodeStringForUploadVideoFile;

- (NSString *)transform:(NSString *)chinese;


/**获取Document文件路径 */
-(NSString *)getDocumentFile;


@end
