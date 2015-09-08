//
//  MYHomeTableViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYHomeTableViewController.h"
#import "MYTableViewController.h"
#import "OneViewController.h"
#import "MYTitleButton.h"
#import "MYPopView.h"

@interface MYHomeTableViewController () <MYPopViewDelegate>

@property (nonatomic,strong) MYPopView *popView;
@property (nonatomic,strong) MYTitleButton *titleButton;

@end

@implementation MYHomeTableViewController



#pragma mark - --------------------退出清空------------------
- (void)dealloc {
    self.popView = nil;
    self.titleButton = nil;
}

#pragma mark - --------------------初始化--------------------
- (void)viewDidLoad {
    // 设置导航栏左右边按钮
    UIButton *leftButton = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch"
                                           highlightImageName:@"navigationbar_friendsearch_highlighted"
                                                       target:self
                                                       action:@selector(onClickFriendSearch:)];
    UIButton *rightButton = [UIBarButtonItem itemWithImageName:@"navigationbar_pop"
                                            highlightImageName:@"navigationbar_pop_highlighted"
                                                        target:self
                                                        action:@selector(onCLickPop:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    // 设置导航栏中间的按钮
    self.titleButton = [[MYTitleButton alloc] init];
    self.titleButton.adjustsImageWhenHighlighted = NO;
    [self.titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [self.titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateSelected];

    self.navigationItem.titleView = self.titleButton;
    NSString *title = @"首页";
    [self.titleButton setTitle:title forState:UIControlStateNormal];
    self.titleButton.width = 100;
    self.titleButton.height = 30;
    [self.titleButton addTarget:self action:@selector(onClickTitle:) forControlEvents:UIControlEventTouchUpInside];
    // 点击首页时显示的popView
    self.popView = [[MYPopView alloc] init];
    self.popView.delegate = self;
}

#pragma mark - --------------------属性相关------------------

#pragma mark - --------------------接口API------------------

#pragma mark - --------------------父类方法重写--------------

#pragma mark - --------------------功能函数------------------


#pragma mark - --------------------手势事件------------------

#pragma mark - --------------------按钮事件------------------

/**
 *  点击title时
 *
 *  @param sender button
 */
- (void)onClickTitle:(UIButton *)sender {
    if (self.popView.isShow) {
        [self.popView dismiss];
    } else {
        [self.popView showInView:self.navigationController.view];
    }
}

- (void)onClickFriendSearch:(UIButton *)button {
    DLog(@"onClickFriendSearch");
}

- (void)onCLickPop:(UIButton *)button {
    DLog(@"onCLickPop");
}

#pragma mark - --------------------代理方法------------------

#pragma mark - popViewDelegate
- (NSArray *)popViewWithSetDate{
    
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:@"abcd"];
    [arr addObject:@"abcd"];
    [arr addObject:@"abcd"];
    [arr addObject:@"abcd"];
    return arr;
}

- (void)popView:(MYPopView *)popView didSelectItemIndex:(int)index {
    DLog(@"index = %d",index);
}

- (void)popViewWhenShowOrDismiss:(BOOL)isShow {
    self.titleButton.selected = isShow;
}

#pragma mark - tableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifider = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
    }
    cell.textLabel.text = @"abc";
    cell.detailTextLabel.text = @"detail";
    [self.navigationController hidesBottomBarWhenPushed];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MYTableViewController *vc = [[MYTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
