//
//  UIView+EVOGesture.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EVOGestureAction)(UIGestureRecognizer *gestureRecoginzer);

/// 视图手势添加和管理分类
@interface UIView (EVOGesture)

/// 为当前视图添加tap手势
/// @param block 执行代码块
- (void)addTapActionWithBlock:(EVOGestureAction)block;

/// 添加长按手势
/// @param block 执行代码块
- (void)addLongPressActionWithBlock:(EVOGestureAction)block;

/// 扩大点击热区
/// @param size size 热区范围
- (void)setEnlargeEdge:(CGFloat)size;

/// 扩大点击热区
/// @param top 顶部热区扩大范围
/// @param right 右侧热区扩大范围
/// @param bottom 底部热区扩大范围
/// @param left 左侧热区扩大范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

@end

NS_ASSUME_NONNULL_END
