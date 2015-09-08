//
//  MYTabBar.h
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MYTabBarDelegate <NSObject>

- (void)tabBarOnClickPlus;

@end

@interface MYTabBar : UITabBar

@property (nonatomic,strong) id<MYTabBarDelegate> myTabBarDelegate;

@end
