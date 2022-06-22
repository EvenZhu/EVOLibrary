//
//  UIView+LRBlockGesture.m
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/24.
//

#import "UIView+LRBlockGesture.h"
#import <objc/runtime.h>

static char kYTActionHandlerTapBlockKey;
static char kYTActionHandlerTapGestureKey;
static char kYTActionHandlerLongPressBlockKey;
static char kYTActionHandlerLongPressGestureKey;

@implementation UIView (LRBlockGesture)


- (void)lr_addTapActionWithBlock:(GestureActionBlock)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kYTActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lr_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kYTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kYTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)lr_handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kYTActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (void)lr_addLongPressActionWithBlock:(GestureActionBlock)block {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kYTActionHandlerLongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lr_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kYTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kYTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)lr_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kYTActionHandlerLongPressBlockKey);
        if (block){
            block(gesture);
        }
    }
}

@end
