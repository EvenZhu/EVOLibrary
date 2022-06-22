//
//  UIImage+LRAdd.m
//  LRRemoteTreatment
//
//  Created by 何强 on 2020/7/16.
//

#import "UIImage+LRAdd.h"

@implementation UIImage (LRAdd)

+ (UIImage*)createImageWithColor:(UIColor*)color andSize:(CGSize)size {
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return theImage;
}

+ (UIImage *)roundrectImageFor:(UIImage *)img roundrect:(CGFloat)corner {
    int w = img.size.width * img.scale;
    int h = img.size.height * img.scale;
    CGRect rect = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), false, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:corner] addClip];
    [img drawInRect:rect];
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return ret;
}

- (UIImage *)roundrectImageFor:(UIImage *)img roundrect:(CGFloat)corner {
    return [[self class] roundrectImageFor:img roundrect:corner];
}

@end
