//
//  MYNewVersionViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYNewVersionViewController.h"
#import "MYTabBarViewController.h"
#import "MYOAuthViewController.h"

#define kImageCount 4

@interface MYNewVersionViewController () <UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIPageControl *pageControl;

@end

@implementation MYNewVersionViewController



#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpScrollView];
    [self setUppageView];
}
#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
#pragma mark - --------------------功能函数------------------

- (void)setUpLastImageButtonsWithImageView:(UIImageView *)imageView {
    // 将button添加到最后一个imageView
    imageView.userInteractionEnabled = YES;
    // - 分享
    UIButton *shareButton = [[UIButton alloc] init];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    shareButton.selected = true;
    [shareButton addTarget:self action:@selector(onClickShare:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.size = CGSizeMake(150, 30);
    shareButton.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.68);
    [imageView addSubview:shareButton];
    // - 开始
    UIButton *beginButton = [[UIButton alloc] init];
    [beginButton setBackgroundImage:[UIImage resizeImage:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [beginButton setBackgroundImage:[UIImage resizeImage:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    beginButton.size = CGSizeMake(150, 30);
    beginButton.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.75);
    [beginButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [beginButton addTarget:self action:@selector(onClickBigin:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:beginButton];
    
    
}

- (void)setUppageView {
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    _pageControl = pageControl;
    pageControl.numberOfPages = kImageCount;
    pageControl.center = CGPointMake(kScreenWidth * 0.5 , kScreenHeight - 100);
    pageControl.currentPageIndicatorTintColor = Color(253, 98, 42, 1);
    pageControl.pageIndicatorTintColor = Color(189, 189, 189, 1);
    [self.view addSubview:pageControl];
}

- (void)setUpScrollView {
    // 添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.contentSize = CGSizeMake(kImageCount * kScreenWidth, kScreenHeight);
    _scrollView = scrollView;
    scrollView.frame = self.view.bounds;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    for (int i = 0; i < kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        //        imageView.backgroundColor = ColorRandom;
        if (Screen3P5Inch) {
            [imageView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"new_feature_%d",(i + 1)]]];
        } else {
            [imageView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"new_feature_%d-568h",(i + 1)]]];
            
        }
        [scrollView addSubview:imageView];
        if (i == (kImageCount - 1)) {
            [self setUpLastImageButtonsWithImageView:imageView];
        }
    }
    [self.view addSubview:scrollView];

}
#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------

- (void)onClickBigin:(UIButton *)button {
    DLog(@"onClickBigin");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [defaults objectForKey:@"access_token"];
    UIViewController *controller = nil;
    if (accessToken !=nil) {
        controller = [[MYTabBarViewController alloc] init];
    } else {
        controller = [[MYOAuthViewController alloc] init];
    }
    [UIApplication sharedApplication].keyWindow.rootViewController = controller;
    
}

- (void)onClickShare:(UIButton *)button {
    button.selected = !button.selected;
}

#pragma mark - --------------------代理方法------------------

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int currentPage = floor((scrollView.contentOffset.x - kScreenWidth / 2) / kScreenWidth) + 1;
    self.pageControl.currentPage = currentPage;
}


@end
