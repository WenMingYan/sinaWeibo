//
//  MYTabNavigationController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYTabNavigationController.h"

@implementation MYTabNavigationController

/**
 *  拦截所有Push进来的子控制器
 *
 *  @param viewController viewController
 *  @param animated       animated
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [super pushViewController:viewController animated:animated];
    // 非栈底
    
    if (self.viewControllers.count > 0) {// 如果push的不是栈底控制器
        [self hidesBottomBarWhenPushed];
        UIButton *leftButton = [UIBarButtonItem itemWithImageName:@"navigationbar_back"
                                               highlightImageName:@"navigationbar_back_highlighted"
                                                           target:self
                                                           action:@selector(onClickBack:)];
        UIButton *rightButton = [UIBarButtonItem itemWithImageName:@"navigationbar_more"
                                                highlightImageName:@"navigationbar_more_highlighted"
                                                            target:self
                                                            action:@selector(onClickHome:)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }
}

- (void)onClickBack:(UIButton *)button {
    [self popViewControllerAnimated:YES];
}

- (void)onClickHome:(UIButton *)button {
    [self popToRootViewControllerAnimated:YES];
}

@end
