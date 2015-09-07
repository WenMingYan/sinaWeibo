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

@implementation MYHomeTableViewController



#pragma mark - --------------------退出清空------------------
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
}

#pragma mark - --------------------属性相关------------------

#pragma mark - --------------------接口API------------------

#pragma mark - --------------------父类方法重写--------------

#pragma mark - --------------------功能函数------------------


#pragma mark - --------------------手势事件------------------

#pragma mark - --------------------按钮事件------------------

- (void)onClickFriendSearch:(UIButton *)button {
    DLog(@"onClickFriendSearch");
    OneViewController *vc = [[OneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onCLickPop:(UIButton *)button {
    DLog(@"onCLickPop");
}

#pragma mark - --------------------代理方法------------------

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
