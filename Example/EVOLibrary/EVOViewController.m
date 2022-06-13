//
//  EVOViewController.m
//  EVOLibrary
//
//  Created by wbxxmya@163.com on 06/07/2022.
//  Copyright (c) 2022 wbxxmya@163.com. All rights reserved.
//

#import "EVOViewController.h"

@interface EVOViewController ()

@end

@implementation EVOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = AppendString(@"Example for ", @"EVOLibrary");
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:EVORGB(123, 34, 200),
                                     NSFontAttributeName:EVOBoldFont20};
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    self.view.backgroundColor = EVOHexColor(0xffffff);
    
    UIButton *icon = [UIButton buttonWithText:@"点我"
                                    textColor:EVOHexColor(0x333333)
                                        image:EVOImageNamed(@"icon_app")
                                  isRightSide:YES
                                touchedAction:^(NSInteger tag) {
        NSLog(@"点击的按钮tag = %zd", tag);
    }];
    icon.frame = CGRectMake(0, 0, 120, 120);
    icon.center = self.view.center;
    [self.view addSubview:icon];
    
    UILabel *label = [UILabel labelWithText:@"带外间距的文字"
                                       font:EVOFont14
                                  textColor:EVOHexColor(0x2Ff676)
                              textAlignment:NSTextAlignmentRight
                              contentInsets:UIEdgeInsetsMake(10, 10, 10, 20)];
    label.frame = CGRectMake(60, 100, 200, 30);
    [self.view addSubview:label];
    
    NSLog(@"当前设备%@全面iPhone", EVOIsFullScreenIPhone ? @"是" : @"不是");
    NSLog(@"当前App Version：%@", EVOAPPVersion);
    NSLog(@"当前App Build：%@", EVOAPPBuild);
    
    NSString *s = @"s";
    NSLog(@"%@%@一个空字符串", s, EVOValidString(s) ? @"不是" : @"是");
}

@end
