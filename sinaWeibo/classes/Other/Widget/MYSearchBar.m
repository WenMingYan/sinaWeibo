//
//  MYSearchBar.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYSearchBar.h"

@implementation MYSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizeImage:@"searchbar_textfield_background"];
        // 当想做某个功能但是没有时，可以到父类中进行寻找
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        leftView.contentMode = UIViewContentModeCenter;
        leftView.width =leftView.image.size.width + 10;
        leftView.height = leftView.image.size.height;
        self.leftView = leftView;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        // 设置了此项才会出现放大镜
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.background = [UIImage resizeImage:@"searchbar_textfield_background"];
        // 当想做某个功能但是没有时，可以到父类中进行寻找
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        leftView.contentMode = UIViewContentModeCenter;
        leftView.width =leftView.image.size.width + 10;
        leftView.height = leftView.image.size.height;
        self.leftView = leftView;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        // 设置了此项才会出现放大镜
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar {
    MYSearchBar *searchBar = [[MYSearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 20, 30)];
    searchBar.background = [UIImage resizeImage:@"searchbar_textfield_background"];
    // 当想做某个功能但是没有时，可以到父类中进行寻找
    searchBar.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
    leftView.contentMode = UIViewContentModeCenter;
    leftView.width =leftView.image.size.width + 10;
    leftView.height = leftView.image.size.height;
    searchBar.leftView = leftView;
    searchBar.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 设置了此项才会出现放大镜
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    return searchBar;
}


@end
