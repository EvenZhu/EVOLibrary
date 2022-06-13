//
//  UIImage+EVO.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletionBlock)(NSError *error);

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopBottom = 0,//从上到下
    GradientTypeLeftRight = 1,//从左到右
    GradientTypeUpLeftToLowRight = 2,//左上到右下
    GradientTypeUpRightToLowLeft = 3,//右上到左下
};

/// 图片生成分类
@interface UIImage (EVO)

/// 给图片添加水印，默认按照屏幕尺寸压缩
/// @param image 原图
/// @param waterImage 水印图
/// @param rect 水印图的位置
+ (instancetype)waterImageWithImage:(UIImage *)image
                         waterImage:(UIImage *)waterImage
                     waterImageRect:(CGRect)rect;

/// 给图片添加水印
/// @param image 原图
/// @param waterImage 水印图
/// @param rect 水印图的位置
/// @param makeScale 是否按照屏幕尺寸压缩
+ (instancetype)waterImageWithImage:(UIImage *)image
                         waterImage:(UIImage *)waterImage
                     waterImageRect:(CGRect)rect screenScale:(BOOL)makeScale;

/// 根据颜色返回一张图片
/// @param color 颜色
/// @param rect 大小
+ (instancetype)createImageWithColor:(UIColor *)color
                                rect:(CGRect)rect;

/// 返回一个渐变色图片
/// @param colors 颜色数组
/// @param gradientType 渐变方向
+ (instancetype)imageWithFrame:(CGSize)size colors:(NSArray *)colors
                  gradientType:(GradientType)gradientType;

/// 保存图片到相册
/// @param image 图片
/// @param completionBlock 保存结果回调
- (void)imageWriteToSavedPhotosAlbum:(UIImage *)image
                              result:(CompletionBlock)completionBlock;

/// 通过view生成一张图片
/// @param view 视图
+ (instancetype)convertViewToImage:(UIView *)view;

/// 旋转图片
/// @param orientation 旋转方向
- (instancetype)rotationWithOrientation:(UIImageOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
