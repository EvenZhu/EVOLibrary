//
//  NSObject+LRSetNilValue.m
//  LRRemoteTreatment
//
//  Created by liuyaobin on 2020/9/22.
//

#import "NSObject+LRSetNilValue.h"

@implementation NSObject (LRSetNilValue)

- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"setNilValueForKey:%@",key);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"UndefinedKey:%@",key);
}

@end
