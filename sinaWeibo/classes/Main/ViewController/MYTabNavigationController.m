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
        [self setupBarButtonItemTheme];
        [self setupNavigationBarTheme];
    }
}

+ (void)setupNavigationBarTheme {
    UINavigationBar *appearance = [UINavigationBar appearance];
    if (!isAfteriOS7) {
        [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    // 设置文字属性(适配iOS6)
    NSMutableDictionary *titleDict = [NSMutableDictionary dictionary];
    titleDict[UITextAttributeTextColor] = [UIColor blackColor];
    titleDict[UITextAttributeFont] = navigationTitleFont;
    titleDict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:titleDict];
}

/**
 *  设置 BarButtonItem 主题
 */
+ (void)setupBarButtonItemTheme {
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    NSMutableDictionary *norDict = [NSMutableDictionary dictionary];
    norDict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    norDict[UITextAttributeTextColor] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:norDict forState:UIControlStateNormal];
    // 设置背景 (为了让按钮的背景消失，然后设置完全透明的图片)
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *highlightDict = [NSMutableDictionary dictionaryWithDictionary:norDict];
    highlightDict[UITextAttributeTextColor] = [UIColor redColor];
    [appearance setTitleTextAttributes:highlightDict forState:UIControlStateHighlighted];
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *disableDict = [NSMutableDictionary dictionaryWithDictionary:norDict];
    disableDict[UITextAttributeTextColor] = [UIColor grayColor];
    [appearance setTitleTextAttributes:disableDict forState:UIControlStateDisabled];
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];

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
    
    if (self.viewControllers.count > 1) {// 如果push的不是栈底控制器
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
