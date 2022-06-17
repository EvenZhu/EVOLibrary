//
//  UIImage+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import "UIImage+EVO.h"
#import "EVOLibrary/EVOMacro.h"

@implementation UIImage (EVO)

+ (instancetype)waterImageWithImage:(UIImage *)image
                         waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect {
    return [self waterImageWithImage:image
                          waterImage:waterImage
                      waterImageRect:rect screenScale:YES];
}

+ (instancetype)waterImageWithImage:(UIImage *)image
                         waterImage:(UIImage *)waterImage
                     waterImageRect:(CGRect)rect
                        screenScale:(BOOL)makeScale {
    CGSize size = image.size;
    CGFloat xScale = 1.;
    CGFloat yScale = 1.;
    CGFloat widthScale = 1.;
    CGFloat heightScale = 1.;
    CGRect newRect = CGRectZero;
    if (makeScale) {
        if (size.width > EVOScreenWidth || size.height > EVOScreenHeight) {
            xScale = rect.origin.x / EVOScreenWidth * size.width;
            yScale = rect.origin.y / (EVOScreenHeight - EVONavBarAndStatusBarHeight) * size.height;
            widthScale = rect.size.width / EVOScreenWidth * size.width;
            heightScale = rect.size.height / (EVOScreenHeight - EVONavBarAndStatusBarHeight * 3) * size.height;
            newRect = CGRectMake(xScale, yScale, widthScale, heightScale);
        }
    }else{
        newRect = rect;
    }
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.绘制背景图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //绘制水印图片到当前上下文
    [waterImage drawInRect:newRect];
    //4.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

+ (instancetype)createImageWithColor:(UIColor *)color
                                rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (instancetype)imageWithFrame:(CGSize)size colors:(NSArray*)colors
                  gradientType:(GradientType)gradientType {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case 0:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        case 1:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, 0.0);
            break;
        case 2:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case 3:
            start = CGPointMake(size.width, 0.0);
            end = CGPointMake(0.0,size.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return image;
}

-(void)imageWriteToSavedPhotosAlbum:(UIImage *)image
                             result:(EVOCompletionBlock)completionBlock{
    void *blockAsContext = (__bridge_retained void *)[completionBlock copy];
    
    UIImageWriteToSavedPhotosAlbum(image, UIImage.class, @selector(evo_image:didFinishSavingWithError:contextInfo:),blockAsContext);
}

- (void)evo_image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    EVOCompletionBlock block = (__bridge_transfer id)contextInfo;
    if (!block) { return; }
    block(error);
}

+ (instancetype)convertViewToImage:(UIView *)view {
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 旋转图片
/// @param orientation 旋转方向
- (instancetype)rotationWithOrientation:(UIImageOrientation)orientation {
    UIImage *image = [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:orientation];
    return image;
}

@end
