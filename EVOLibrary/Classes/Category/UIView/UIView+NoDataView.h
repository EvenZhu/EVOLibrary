//
//  UIView+NoDataView.h
//  LRRemoteTreatment
//
//  Created by lyb on 2020/5/15.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger , DefaultImageType){
    DefaultImageTypeNoData = 1,     // 没有数据
    DefaultImageTypeNetworkLess = 2,  // 没有网络
    DefaultImageTypeNoMessage, //  没有消息
    DefaultImageTypeNoSchedule, // 没有排班
};


NS_ASSUME_NONNULL_BEGIN

@interface UIView (NoDataView)

/**
    显示默认空视图
 */
- (void)addNoView;

/**
    显示默认无网络视图
 */
- (void)addDisconnectionView;


// 添加nodata图：  defaultText 默认图提示文字   type 图片样式类型
- (void)addNoViewWithText:(NSString *)message;

- (void)addNoViewWithText:(NSString *)message
         defaultImageType:(DefaultImageType)type;

- (void)addNoViewWithText:(NSString *)message
               withDetail:(NSString *)detail
         defaultImageType:(DefaultImageType)type;

/**设置nodata图的frame*/
- (void)addNoViewWithText:(NSString *)message
         defaultImageType:(DefaultImageType)type
                withFrame:(CGRect)frame;

- (void)addNoViewWithText:(NSString *)message
               withDetail:(NSString *)detail
                withImage:(UIImage *)image;

/**设置nodata图的frame*/
- (void)addNoViewWithText:(NSString *)message
               withDetail:(NSString *)detail
                withImage:(UIImage *)image
         defaultImageType:(DefaultImageType)type
                withFrame:(CGRect)frame;

- (void)addAutolayoutNoViewWithText:(NSString *)message
                   defaultImageType:(DefaultImageType)type
                 withVerticalOffset:(CGFloat)offsetY;

// 移nodata图
- (void)removeNoView;

@property (nonatomic, strong, readonly) UIView *bgView;

@end

NS_ASSUME_NONNULL_END
