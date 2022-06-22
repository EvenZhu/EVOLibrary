//
//  UISegmentedControl+Custom.m
//  LRRemoteTreatment
//
//  Created by lyb on 2020/8/5.
//

#import "UISegmentedControl+Custom.h"
#import "EVOLibrary/EVOMacro.h"

@implementation UISegmentedControl (Custom)

- (void)segmentedIOS13Style {

    if (@available(iOS 13, *)) {
        UIColor *tintColor = EVOHexColor(0x07C160);
        UIImage *tintColorImage = [self imageWithColor:tintColor];
        [self setBackgroundImage:[self imageWithColor:self.backgroundColor ? self.backgroundColor : [UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:tintColorImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:[self imageWithColor:[tintColor colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:tintColorImage forState:UIControlStateSelected|UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName: tintColor, NSFontAttributeName: [UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
        [self setDividerImage:tintColorImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        self.layer.borderWidth = 1;
//        self.layer.borderColor = [tintColor CGColor];
        self.selectedSegmentTintColor = EVOHexColor(0x07C160);

    }

}

- (UIImage *)imageWithColor: (UIColor *)color {

    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);

    UIGraphicsBeginImageContext(rect.size);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return theImage;

}

@end
