//
//  MYMeTableViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYMeTableViewController.h"

@implementation MYMeTableViewController

#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(onClickSetting)];
    // 通过appearance对象可以修改整个项目中所有的UIBarButtonItem样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    dict[UITextAttributeTextColor] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:dict forState:UIControlStateNormal];
}

#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
#pragma mark - --------------------功能函数------------------
#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------

- (void)onClickSetting {
    
}

#pragma mark - --------------------代理方法------------------

@end
