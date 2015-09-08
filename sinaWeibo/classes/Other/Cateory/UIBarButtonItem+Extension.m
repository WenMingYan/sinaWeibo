//
//  UIBarButtonItem+Extension.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/7.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIButton *)itemWithImageName:(NSString *)image highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}



@end
