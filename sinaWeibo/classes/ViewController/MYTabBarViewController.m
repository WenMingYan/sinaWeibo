//
//  MYTabBarViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYTabBarViewController.h"

@interface MYTabBarViewController ()

@end

@implementation MYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    //--首页
    UIViewController *home = [[UIViewController alloc] init];
    home.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:home];
    home.title = @"首页";
    UIImage *homeSelectImage = [UIImage imageNamed:@"tabbar_home_selected"];
    // 用原图，不要渲染
    homeSelectImage = [homeSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    home.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    home.tabBarItem.selectedImage = homeSelectImage;
    //--消息
    UIViewController *message = [[UIViewController alloc] init];
    message.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:message];
    message.title = @"消息";
    UIImage *messageSelectImage = [UIImage imageNamed:@"tabbar_message_center_selected"];
    messageSelectImage = [messageSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    message.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    message.tabBarItem.selectedImage = messageSelectImage;
    //--发现
    UIViewController *find = [[UIViewController alloc] init];
    find.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:find];
    find.title = @"发现";
    UIImage *findSelectImage = [UIImage imageNamed:@"tabbar_discover_selected"];
    findSelectImage = [findSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    find.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    find.tabBarItem.selectedImage = findSelectImage;
    //--我
    UIViewController *me = [[UIViewController alloc] init];
    me.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:me];
    me.title = @"我";
    UIImage *meSelectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    messageSelectImage = [meSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    me.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    me.tabBarItem.selectedImage = messageSelectImage;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
