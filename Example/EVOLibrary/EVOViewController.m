//
//  EVOViewController.m
//  EVOLibrary
//
//  Created by wbxxmya@163.com on 06/07/2022.
//  Copyright (c) 2022 wbxxmya@163.com. All rights reserved.
//

#import "EVOViewController.h"
#import <NSString+EVOFormat.h>

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
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    icon.image = EVOImageNamed(@"icon_app");
    icon.center = self.view.center;
    [self.view addSubview:icon];
    
    NSLog(@"当前设备%@全面iPhone", EVOIsFullScreenIPhone ? @"是" : @"不是");
    NSLog(@"当前App Version：%@", EVOAPPVersion);
    NSLog(@"当前App Build：%@", EVOAPPBuild);
    
    NSString *s = @"s";
    NSLog(@"%@%@一个空字符串", s, EVOValidString(s) ? @"不是" : @"是")
}

@end
