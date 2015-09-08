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
#import "MYComposeViewController.h"
#import "MYTabNavigationController.h"
#import "MYTabBar.h"


@interface MYTabBarViewController () <MYTabBarDelegate>

@property (nonatomic,weak) UINavigationController *navigation;

@end

@implementation MYTabBarViewController

#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViewControllers];
       MYTabBar *tabBar = [[MYTabBar alloc] init];
    tabBar.bounds = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    [self setValue:tabBar forKey:@"tabBar"];
    if (!isAfteriOS7) {
        tabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
        self.tabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
        tabBar.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_background"];
    }
    tabBar.tintColor = [UIColor orangeColor];
    tabBar.myTabBarDelegate = self;
}

#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - --------------------功能函数------------------
/**
 *添加子控制器
 */
- (void)addSubViewControllers {
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

- (void)addOneChildVc:(UIViewController *)controller title:(NSString *)title imageName:(NSString*)imageName selectImageName:(NSString *)selectImage {
    MYTabNavigationController *nav = [[MYTabNavigationController alloc] initWithRootViewController:controller];
    [nav addChildViewController:controller];
    [self addChildViewController:nav];
    controller.title = title;
    UIImage *homeSelectImage = [UIImage imageWithName:selectImage];
    // 用原图，不要渲染（此方法不能在iOS6中）
    if (isAfteriOS7) {
        homeSelectImage = [homeSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    controller.tabBarItem.image = [UIImage imageWithName:imageName];
    controller.tabBarItem.selectedImage = homeSelectImage;
    
}

#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------
#pragma mark - --------------------代理方法------------------

- (void)tabBarOnClickPlus {
    MYComposeViewController *composeViewController = [[MYComposeViewController alloc] init];

    [self downToUp:composeViewController];
}

- (void)downToUp:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    MYTabNavigationController *navigationController = [[MYTabNavigationController alloc] initWithRootViewController:viewController];
    [navigationController.view.layer addAnimation:transition forKey:nil];
    navigationController.navigationBarHidden = NO;
//    [navigationController pushViewController:viewController animated:NO];
    [self presentViewController:navigationController animated:YES completion:nil];
}








@end
