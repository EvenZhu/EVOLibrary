//
//  UIImageView+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 图像视图生成分类
@interface UIImageView (EVO)

/// 创建一个带圆角的图片
/// @param image 图片
/// @param cornerRadius 圆角
- (instancetype)initWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
