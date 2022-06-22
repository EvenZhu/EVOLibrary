//
//  UIView+Loading.h
//  LRRemoteTreatment
//
//  Created by 何强 on 2020/8/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Loading)

- (void)loading;
- (void)loadingDefaultText;
- (void)loadingWithContent:(nullable NSString *)content;
- (void)hideLoading;

@end

NS_ASSUME_NONNULL_END
