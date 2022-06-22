//
//  UIButton+MFAdd.h
//  扩大控件响应
//
//  Created by 爱上党 on 16/1/25.
//  Copyright © 2016年 尚高林. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MFEdgeInsetsType) {
    MFEdgeInsetsTypeTitle,//标题
    MFEdgeInsetsTypeImage//图片
};

typedef NS_ENUM(NSInteger, MFMarginType) {
    MFMarginTypeTop         ,
    MFMarginTypeLeft        ,
    MFMarginTypeBottom      ,
    MFMarginTypeRight       ,
    MFMarginTypeLeftTop     ,
    MFMarginTypeLeftBottom  ,
    MFMarginTypeRightTop    ,
    MFMarginTypeRightBottom
};

typedef void(^EventBlock)(UIButton *button);
/**
 UIButton 快捷创建和配置方法
 */
@interface UIButton (MFAdd)

+ (UIButton *)buttonWithNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor;
+ (UIButton *)buttonWithNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor backgroundColor:(NSInteger)backgroundColor;

- (void)setNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor;
- (void)setNormalStateTitle:(NSString *)title fonstSize:(CGFloat)fonstSize titleColor:(NSInteger)titleColor backgroundColor:(NSInteger)backgroundColor;

@end


/**
 UIButton 扩展响应事件的范围
 */
@interface UIButton (MFEnlargeEdge)

/**
 设置四周扩展距离

 @param size 扩展的尺寸 上下左右均取得该值
 */
- (void)setEnlargeEdge:(CGFloat)size;


/**
 分别设置四周扩展距离

 @param top 上
 @param right 右
 @param bottom 下
 @param left 左
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;


/**
 分别设置四周扩展距离

 @param insets UIEdgeInsets值
 */
- (void)setEnlargeEdgeInset:(UIEdgeInsets)insets;

@end



/**
 UIButton 调整图片和文字的布局
 */
@interface UIButton (MFEdgeInsets)


/**
 默认情况下，imageEdgeInsets和titleEdgeInsets都是0。先不考虑height,
 
 if (button.width小于imageView上image的width){图像会被压缩，文字不显示}
 
 if (button.width < imageView.width + label.width){图像正常显示，文字显示不全}
 
 if (button.width >＝ imageView.width + label.width){图像和文字都居中显示，imageView在左，label在右，中间没有空隙}
 */


/**
 *  图片在上，标题在下，居中显示
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setImageUpTitleDownWithSpacing:(CGFloat)spacing;

/**
 *  图片在右，标题在左
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setImageRightTitleLeftWithSpacing:(CGFloat)spacing;

/**
 *  按钮默认风格：图片在标题左边
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setDefaultImageTitleStyleWithSpacing:(CGFloat)spacing;


/**
 *  按钮只设置了title or image，该方法可以改变它们的位置
 */
- (void)setEdgeInsetsWithType:(MFEdgeInsetsType)edgeInsetsType marginType:(MFMarginType)marginType margin:(CGFloat)margin;

@end

@interface UIButton (MFEvent)
/**
 * UIControlEventTouchUpInside 类型的事件
 */
- (void)addTouchUpInsideEvent:(EventBlock)event;
/**
 * 仅适用于button只有一个事件
 */
- (void)addEventForControlEvents:(UIControlEvents)controlEvents action:(EventBlock)event;
@end
