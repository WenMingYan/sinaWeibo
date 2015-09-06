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
    //--消息
    UIViewController *message = [[UIViewController alloc] init];
    message.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:message];
    //--发现
    UIViewController *find = [[UIViewController alloc] init];
    find.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:find];
    //--我
    UIViewController *me = [[UIViewController alloc] init];
    me.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:me];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
