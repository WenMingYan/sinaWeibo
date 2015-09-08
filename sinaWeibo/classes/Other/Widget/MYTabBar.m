//
//  MYTabBar.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYTabBar.h"

@interface MYTabBar ()

@property (nonatomic,weak) UIButton *plusButton;

@end

@implementation MYTabBar


#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------
- (instancetype)init {
    if (self = [super init]) {
        // 初始化中间的button
        UIButton *plusButton = [[UIButton alloc] init];
        self.plusButton = plusButton;
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:plusButton];
        plusButton.adjustsImageWhenHighlighted = NO;
        [plusButton addTarget:self action:@selector(onClickPlus:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupTabBatButton];
    // 设置plusButton的frame
    
    [self setupPlusButtonFrame];
    
}

#pragma mark - --------------------功能函数------------------

- (void)setupPlusButtonFrame {
    self.plusButton.frame = CGRectMake((kScreenWidth / (self.items.count + 1) *(int)(self.items.count /2)), 0, self.width / (self.items.count + 1), self.height);
}

/**
 *  设置tatBar的4个控件
 */
- (void)setupTabBatButton {
    int index = 0;
    // 遍历所有子控件
    CGFloat tabBarButtonWidth = self.width / (self.items.count + 1);
    CGFloat tabBarButtonHeight = self.height;
    // 根据索引调整位置
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        tabBarButton.width = tabBarButtonWidth;
        tabBarButton.height = tabBarButtonHeight;
        tabBarButton.x = tabBarButtonWidth * index;
        tabBarButton.y = 0;
        if (index >=2) {
            tabBarButton.x = tabBarButtonWidth * (index + 1);
        }
        index++;
    }
}

#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------
- (void)onClickPlus:(UIButton *)sender {
    DLog(@"onClickPlus");
    if ([self.myTabBarDelegate respondsToSelector:@selector(tabBarOnClickPlus)]) {
        [self.myTabBarDelegate tabBarOnClickPlus];
    }
}
#pragma mark - --------------------代理方法------------------







@end
