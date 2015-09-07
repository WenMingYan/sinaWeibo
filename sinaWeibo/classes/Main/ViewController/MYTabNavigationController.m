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
 *  这个方法在第一次使用时才会调用
 */
+ (void)initialize {
    if (self == [MYTabNavigationController class]) {
        // 通过appearance对象可以修改整个项目中所有的UIBarButtonItem样式
        UIBarButtonItem *appearance = [UIBarButtonItem appearance];
        NSMutableDictionary *norDict = [NSMutableDictionary dictionary];
        norDict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        norDict[UITextAttributeTextColor] = [UIColor orangeColor];
        [appearance setTitleTextAttributes:norDict forState:UIControlStateNormal];
        
        NSMutableDictionary *highlightDict = [NSMutableDictionary dictionary];
        highlightDict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        highlightDict[UITextAttributeTextColor] = [UIColor redColor];
        [appearance setTitleTextAttributes:highlightDict forState:UIControlStateHighlighted];
        
        NSMutableDictionary *disableDict = [NSMutableDictionary dictionary];
        disableDict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        disableDict[UITextAttributeTextColor] = [UIColor grayColor];
        [appearance setTitleTextAttributes:disableDict forState:UIControlStateDisabled];
    }
}

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
