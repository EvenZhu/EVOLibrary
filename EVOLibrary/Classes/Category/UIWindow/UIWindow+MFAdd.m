//
//  UIWindow+MFAdd.m
//

#import "UIWindow+MFAdd.h"

@implementation UIWindow (MFAdd)

+ (UIWindow *)mainWindow {
    
    return [[UIApplication sharedApplication] keyWindow];
}

@end
