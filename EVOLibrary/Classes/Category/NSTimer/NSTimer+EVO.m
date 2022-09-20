//
//  NSTimer+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "NSTimer+EVO.h"

@implementation NSTimer (EVO)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                         block:(void (^)(void))inBlock
                                       repeats:(BOOL)isRepeats {
    void (^block)(void) = [inBlock copy];
    id timer = [self scheduledTimerWithTimeInterval:timeInterval
                                             target:self selector:@selector(executeSimpleBlock:)
                                           userInfo:block
                                            repeats:isRepeats];
    return timer;
}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                                block:(void (^)(void))inBlock
                              repeats:(BOOL)isRepeats {
    void (^block)(void) = [inBlock copy];
    id timer = [self timerWithTimeInterval:timeInterval
                                    target:self
                                  selector:@selector(executeSimpleBlock:)
                                  userInfo:block repeats:isRepeats];
    return timer;
}

+ (void)executeSimpleBlock:(NSTimer *)timer {
    if([timer userInfo]) {
        void (^block)(void) = (void (^)(void))[timer userInfo];
        block();
    }
}

- (void)pauseTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return;
    }

    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
