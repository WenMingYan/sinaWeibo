//
//  MYFindTableViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYFindTableViewController.h"
#import "MYSearchBar.h"

@implementation MYFindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [MYSearchBar searchBar];
}

@end
