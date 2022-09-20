//
//  UIView+LRBlockGesture.h
//  LRTelemedicine_Patient
//
//  Created by zhaozijian on 2020/3/24.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer * _Nonnull gestureRecoginzer);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LRBlockGesture)

/**
 *  添加tap手势
 *  @param block 代码块
 */
- (void)lr_addTapActionWithBlock:(GestureActionBlock)block;

/**
 *  添加长按手势
 *  @param block 代码块
 */
- (void)lr_addLongPressActionWithBlock:(GestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END
