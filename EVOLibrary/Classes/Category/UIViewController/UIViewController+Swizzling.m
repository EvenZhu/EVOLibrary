//
//  UIViewController+Swizzling.m
//  LRRemoteTreatment
//
//  Created by lyb on 2020/3/4.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)

+ (void)load {
    
#ifdef DEBUG
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);
#endif
    
}

- (void)logViewWillAppear:(BOOL)animated {
    NSString *className = NSStringFromClass([self class]);
    
    if ([className hasPrefix:@"UI"] == NO) {
        NSLog(@"%@ will appear",className);
    }
    [self logViewWillAppear:animated];
    
}

@end
