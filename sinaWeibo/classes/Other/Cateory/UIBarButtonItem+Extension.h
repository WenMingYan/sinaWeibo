//
//  UIBarButtonItem+Extension.h
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/7.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIButton *)itemWithImageName:(NSString *)image highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action;
@end
