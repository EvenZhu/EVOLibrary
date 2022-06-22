//
//  UIImage+LRAdd.h
//  LRRemoteTreatment
//
//  Created by 何强 on 2020/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LRAdd)

+ (UIImage*)createImageWithColor:(UIColor*)color andSize:(CGSize)size;

+ (UIImage *)roundrectImageFor:(UIImage *)img roundrect:(CGFloat)corner;
- (UIImage *)roundrectImageFor:(UIImage *)img roundrect:(CGFloat)corner;

@end

NS_ASSUME_NONNULL_END
