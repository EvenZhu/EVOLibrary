//
//  UIView+EVO.m
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/17.
//

#import "UIView+EVO.h"

@implementation UIView (EVO)

- (void)setGradualChangingColor:(UIColor *)fromColor
                        toColor:(UIColor *)toColor
                  withDirection:(GradualChangingDirection)direction
                   cornerRadius:(CGFloat)cornerRadius {
    CALayer *layer = [self layerWithgradualChangingColor:fromColor
                                                 toColor:toColor
                                           withDirection:direction
                                            cornerRadius:cornerRadius];
    [self.layer addSublayer:layer];
}

- (CALayer *)layerWithgradualChangingColor:(UIColor *)fromColor
                                   toColor:(UIColor *)toColor
                             withDirection:(GradualChangingDirection)direction
                              cornerRadius:(CGFloat)cornerRadius {
    return [self layerWithGradualChangingColors:@[fromColor,
                                                  toColor]
                                      withDirection:direction
                                   cornerRadius:cornerRadius];
}

- (CALayer *)layerWithGradualChangingColors:(NSArray<UIColor *> *)colors
                              withDirection:(GradualChangingDirection)direction
                               cornerRadius:(CGFloat)cornerRadius {
    // CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.cornerRadius = cornerRadius;

    NSMutableArray *CGColors = @[].mutableCopy;
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [CGColors addObject:(__bridge id)obj.CGColor];
    }];
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = CGColors.copy;

    [self setGradualChangingDirection:direction
                        gradientLayer:gradientLayer];

    if (colors.count == 2) {
        //  设置颜色变化点，取值范围 0.0~1.0
        gradientLayer.locations = @[@0,
                                    @1];
    }else {
        // 设置颜色变化点，动态计算每个颜色所对应的位置
        NSMutableArray *tempLocations = @[].mutableCopy;
        [tempLocations addObject:@0];
        float step = 1.0 / (colors.count - 1);
        [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx != 0) {
                if (idx != colors.count - 1) {
                    [tempLocations addObject:@1];
                }else {
                    [tempLocations addObject:@(step * idx)];
                }
            }
        }];
    }
    
    return gradientLayer;
}
 
/// 设置渐变layer的渐变方向
/// @param direction 渐变方向
/// @param gradientLayer 渐变layer
- (void)setGradualChangingDirection:(GradualChangingDirection)direction
                      gradientLayer:(CAGradientLayer *)gradientLayer {
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    switch (direction) {
        case GradualChangingDirectionTTB:
            gradientLayer.startPoint = CGPointMake(0.5, 0);
            gradientLayer.endPoint = CGPointMake(0.5, 1);
            break;
        case GradualChangingDirectionLTR:
            gradientLayer.startPoint = CGPointMake(0, 0.5);
            gradientLayer.endPoint = CGPointMake(1, 0.5);
            break;
        case GradualChangingDirectionLTTRB:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 1);
            break;
        case GradualChangingDirectionLBTRT:
            gradientLayer.startPoint = CGPointMake(0, 1);
            gradientLayer.endPoint = CGPointMake(1, 0);
            break;
        default:
            break;
    }
}

- (void)setPartCornerRadious:(CGFloat)cornerRadius
                 borderColor:(UIColor *)borderColor
                 borderWidth:(CGFloat)borderWidth
          forRoundingCorners:(UIRectCorner)reactCorner {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:reactCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *maskLayer= [[CAShapeLayer alloc]init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    
    if (borderWidth > 0) {
        CAShapeLayer *borderLayer = [[CAShapeLayer alloc]init];
        borderLayer.lineWidth = borderWidth;
        borderLayer.strokeColor = borderColor.CGColor;
        borderLayer.fillColor = UIColor.clearColor.CGColor;
        borderLayer.frame = self.bounds;
        borderLayer.path = path.CGPath;
        
        [self.layer insertSublayer:borderLayer atIndex:0];
    }
    
    self.layer.mask = maskLayer;
}

- (void)addShadow {
    [self addShadow:UIColor.blackColor
         withOffset:CGSizeZero];
}

- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset {
    [self addShadow:color
         withOffset:offset
        withOpacity:0.06
         withRadius:0];
}

- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset
      withOpacity:(CGFloat)opacity {
    [self addShadow:color
         withOffset:offset
        withOpacity:opacity
         withRadius:0];
}

- (void)addShadow:(UIColor *)color
       withOffset:(CGSize)offset
      withOpacity:(CGFloat)opacity
       withRadius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    if (radius != 0) {
        self.layer.shadowRadius = radius;
    }
}

@end
