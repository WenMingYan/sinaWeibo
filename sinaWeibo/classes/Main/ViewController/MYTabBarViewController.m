//
//  MYTabBarViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYTabBarViewController.h"
#import "MYHomeTableViewController.h"
#import "MYMessageTableViewController.h"
#import "MYMeTableViewController.h"
#import "MYFindTableViewController.h"
#import "MYTabNavigationController.h"

@interface MYTabBarViewController ()

@property (nonatomic,weak) UINavigationController *navigation;

@end

@implementation MYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    //--首页
    MYHomeTableViewController *home = [[MYHomeTableViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    //--消息
    MYMessageTableViewController *message = [[MYMessageTableViewController alloc] init];
    [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    //--发现
    MYFindTableViewController *find = [[MYFindTableViewController alloc] init];
    [self addOneChildVc:find title:@"发现" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    //--我
    MYMeTableViewController *me = [[MYMeTableViewController alloc] init];
    [self addOneChildVc:me title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addOneChildVc:(UIViewController *)controller title:(NSString *)title imageName:(NSString*)imageName selectImageName:(NSString *)selectImage {
    MYTabNavigationController *nav = [[MYTabNavigationController alloc] initWithRootViewController:controller];
    [nav addChildViewController:controller];
    [self addChildViewController:nav];
//    controller.view.backgroundColor = ColorRandom;
    controller.title = title;
    UIImage *homeSelectImage = [UIImage imageWithName:selectImage];
    // 用原图，不要渲染（此方法不能在iOS6中）
    if (isAfteriOS7) {
        homeSelectImage = [homeSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    controller.tabBarItem.image = [UIImage imageWithName:imageName];
    controller.tabBarItem.selectedImage = homeSelectImage;

}



@end
