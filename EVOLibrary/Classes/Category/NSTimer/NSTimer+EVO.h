//
//  NSTimer+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 定时器生成和管理分类
@interface NSTimer (EVO)

/// 开启一个当前线程内可重复执行的NSTimer对象
/// 该方法只能保证不循环引用，但是需要在持有timer的对象释放后执行[xxx.timer invalidate];释放
/// @param timeInterval 重复时间
/// @param inBlock 操作内容
/// @param isRepeats 是否重复
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                         block:(void (^)(void))inBlock
                                       repeats:(BOOL)isRepeats;

/// 开启一个需添加到线程的可重复执行的NSTimer对象
/// @param timeInterval 重复时间
/// @param inBlock 操作内容
/// @param isRepeats 是否重复
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                                block:(void (^)(void))inBlock
                              repeats:(BOOL)isRepeats;

/// 暂停NSTimer
- (void)pauseTimer;

/// 开始NSTimer
- (void)resumeTimer;

/// 延迟开始NSTimer
/// @param interval 延迟时间
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

NS_ASSUME_NONNULL_END
