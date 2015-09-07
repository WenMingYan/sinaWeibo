//
//  MYFindTableViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/6.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYFindTableViewController.h"

@implementation MYFindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0, 0, kScreenWidth, 30);
    [searchBar setBackgroundImage:[UIImage resizeImage:@"searchbar_textfield_background"]];
    
    self.navigationItem.titleView = searchBar;
    
}

@end
