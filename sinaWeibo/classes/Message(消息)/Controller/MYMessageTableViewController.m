//
//  MYMessageTableViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYMessageTableViewController.h"

@implementation MYMessageTableViewController


#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------


- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"--MYMessageTableViewController--viewDidLoad--");
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(onClickWrite)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}
#pragma mark - --------------------属性相关------------------

#pragma mark - --------------------接口API------------------

#pragma mark - --------------------父类方法重写--------------

#pragma mark - --------------------功能函数------------------

#pragma mark - --------------------手势事件------------------

#pragma mark - --------------------按钮事件------------------

- (void)onClickWrite {
    DLog(@"onClickWrite");
}

#pragma mark - --------------------代理方法------------------
@end
