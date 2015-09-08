//
//  MYComposeViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYComposeViewController.h"

@implementation MYComposeViewController

#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onClickCancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onClickSetting)];
}

#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
#pragma mark - --------------------功能函数------------------

#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------
/**
 *  点击取消
 */
- (void)onClickCancel {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.navigationController.navigationBarHidden = NO;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/**
 *  点击设置
 */
- (void)onClickSetting {
    
}

#pragma mark - --------------------代理方法------------------




@end
