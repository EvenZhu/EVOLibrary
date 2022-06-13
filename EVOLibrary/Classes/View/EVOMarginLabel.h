//
//  EVOMarginLabel.h
//  EVOLibrary
//
//  Created by 祝彭辉 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 带外间距的文本标签
@interface EVOMarginLabel : UILabel

/// 生成一个带外间距的文本标签
/// @param contentInsets 外间距
+ (instancetype)labelWithContentInsets:(UIEdgeInsets)contentInsets;

@end

NS_ASSUME_NONNULL_END
