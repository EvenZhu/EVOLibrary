//
//  UIView+NoDataView.m
//  LRRemoteTreatment
//
//  Created by lyb on 2020/5/15.
//

#import <objc/runtime.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "UIView+NoDataView.h"
#import "EVOLibrary/UIFont+MFAdd.h"
#import "EVOLibrary/EVOMacro.h"
#import <Masonry/Masonry.h>

static char *DefaultKey = "DefaultKey";

@implementation UIView (NoDataView)

- (UIView *)bgView {
    return objc_getAssociatedObject(self, DefaultKey);
}

- (void)setBgView:(UIView *)bgView {
    objc_setAssociatedObject(self, DefaultKey , bgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addNoView {
    [self addNoViewWithText:@"暂无内容"];
}

- (void)addDisconnectionView {
    [self addNoViewWithText:@"当前网络异常" defaultImageType:DefaultImageTypeNetworkLess];
}

- (void)addNoViewWithText:(NSString *)message {
    [self addNoViewWithText:message defaultImageType:DefaultImageTypeNoData];
}

- (void)addNoViewWithText:(NSString *)message defaultImageType:(DefaultImageType)type {
    [self addNoViewWithText:message defaultImageType:type withFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
}

/**默认图根据frame定*/
- (void)addNoViewWithText:(NSString *)message defaultImageType:(DefaultImageType)type withFrame:(CGRect)frame {
    [self.bgView removeFromSuperview];
    
    self.bgView = [[UIView alloc] initWithFrame:frame];
//    self.bgView.backgroundColor = kColorGrayF7F7F7;
    self.bgView.backgroundColor = [UIColor whiteColor];
//    self.bgView.userInteractionEnabled = NO;
    
    // 默认图片
    UIImageView *iv = [[UIImageView alloc] init];
    switch (type) {
        case DefaultImageTypeNoData:
            [iv setImage:[UIImage imageNamed:@"empty_data"]];
            break;
            
        case DefaultImageTypeNetworkLess:
            [iv setImage:[UIImage imageNamed:@"no_network"]];
            break;
            
        case DefaultImageTypeNoMessage:
            [iv setImage:[UIImage imageNamed:@"no_message"]];
            break;
        case DefaultImageTypeNoSchedule:
            [iv setImage:[UIImage imageNamed:@"no_schedule"]];
            break;
            
        default:
            break;
    }
    CGFloat ivY = self.bgView.frame.size.height / 2 - iv.image.size.height / 2 - 25;
    iv.frame = CGRectMake(self.bgView.frame.size.width / 2 - iv.image.size.width / 2,
                          ivY > 100 ? 100 : ivY,
                          iv.image.size.width,
                          iv.image.size.height);
    [self.bgView addSubview:iv];
    
    // 默认文字
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iv.frame)+20, EVOScreenWidth, 30)];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = message;
    textLabel.textColor = EVOHexColor(0x848484);
    [self.bgView addSubview:textLabel];
    
    [self addSubview:self.bgView];
    
    if (type == DefaultImageTypeNetworkLess) {
        UILabel *subTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(EVOScreenWidth / 2 - 92, CGRectGetMaxY(textLabel.frame)+5, 185, 40)];
        subTextLabel.textAlignment = NSTextAlignmentCenter;
        subTextLabel.text = @"移动数据或WiFi网络连接异常 去设置网络吧";
        subTextLabel.textColor = EVOHexColor(0x666666);
        subTextLabel.font = EVORegularFont(14);
        subTextLabel.numberOfLines = 2;
        [self.bgView addSubview:subTextLabel];
        
        UIButton *setNetworkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        setNetworkBtn.frame = CGRectMake(EVOScreenWidth / 2 - 69, CGRectGetMaxY(subTextLabel.frame) + 22, 138, 45);
        setNetworkBtn.layer.cornerRadius = 11;
        [setNetworkBtn setTitle:@"去设置" forState:UIControlStateNormal];
        [setNetworkBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [setNetworkBtn setBackgroundColor:EVOHexColor(0x07C160)];
        setNetworkBtn.titleLabel.font = EVORegularFont(16);
        [[setNetworkBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            NSURL *urlString = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        prefs:root=WIFI // iOS10 已弃用
            if ([[UIApplication sharedApplication] canOpenURL:urlString]) {
                [[UIApplication sharedApplication] openURL:urlString options:@{} completionHandler:nil];
            }
            
        }];
        [self.bgView addSubview:setNetworkBtn];
    }
    
}

- (void)addAutolayoutNoViewWithText:(NSString *)message defaultImageType:(DefaultImageType)type withVerticalOffset:(CGFloat)offsetY {
    [self.bgView removeFromSuperview];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    // 默认图片
    UIImageView *iv = [[UIImageView alloc] init];
    [self.bgView addSubview:iv];
    
    switch (type) {
        case DefaultImageTypeNoData:
            [iv setImage:[UIImage imageNamed:@"empty_data"]];
            break;
            
        case DefaultImageTypeNetworkLess:
            [iv setImage:[UIImage imageNamed:@"no_network"]];
            break;
            
        case DefaultImageTypeNoMessage:
            [iv setImage:[UIImage imageNamed:@"no_message"]];
            break;
        case DefaultImageTypeNoSchedule:
            [iv setImage:[UIImage imageNamed:@"no_schedule"]];
            break;
            
        default:
            break;
    }
    
    CGFloat imageW = iv.image.size.width;
    CGFloat imageH = iv.image.size.height;
    CGFloat ivY = self.frame.size.height / 2 - imageH / 2 - offsetY;
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(ivY > 100 ? 100 : ivY);
        make.width.mas_equalTo(imageW);
        make.height.mas_equalTo(imageH);
    }];
    
    // 默认文字
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.bgView addSubview:textLabel];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = message;
    textLabel.textColor = EVOHexColor(0x848484);
    
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView);
        make.top.equalTo(iv.mas_bottom).offset(20);
        make.width.equalTo(self.bgView);
        make.height.mas_equalTo(30);
    }];
    
    
    
    if (type == DefaultImageTypeNetworkLess) {
        UILabel *subTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.bgView addSubview:subTextLabel];
        subTextLabel.textAlignment = NSTextAlignmentCenter;
        subTextLabel.text = @"移动数据或WiFi网络连接异常 去设置网络吧";
        subTextLabel.textColor = EVOHexColor(0x666666);
        subTextLabel.font = EVORegularFont(14);
        subTextLabel.numberOfLines = 2;
        [subTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgView);
            make.top.equalTo(textLabel.mas_bottom).offset(5);
            make.width.mas_equalTo(185);
            make.height.mas_equalTo(40);
        }];
        
        
        UIButton *setNetworkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:setNetworkBtn];
        setNetworkBtn.layer.cornerRadius = 11;
        [setNetworkBtn setTitle:@"去设置" forState:UIControlStateNormal];
        [setNetworkBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [setNetworkBtn setBackgroundColor:EVOHexColor(0x353D58)];
        setNetworkBtn.titleLabel.font = EVORegularFont(16);
        [setNetworkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(subTextLabel);
            make.top.equalTo(subTextLabel.mas_bottom).offset(22);
            make.width.mas_equalTo(138);
            make.height.mas_equalTo(45);
        }];
        
        [[setNetworkBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            NSURL *urlString = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        prefs:root=WIFI // iOS10 已弃用
            if ([[UIApplication sharedApplication] canOpenURL:urlString]) {
                [[UIApplication sharedApplication] openURL:urlString options:@{} completionHandler:nil];
            }
            
        }];
    }
    
}

- (void)removeNoView {
    [self.bgView removeFromSuperview];
}

@end
