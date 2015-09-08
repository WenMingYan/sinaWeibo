//
//  MYPopView.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYPopView.h"
#define kDefaultBtnTag 100
#define kPopViewWidth 150
#define kPopViewItemHeight 30

@interface MYPopView ()
@property (nonatomic,weak) UIImageView *backgroundPopView;

@end

@implementation MYPopView





#pragma mark - --------------------退出清空------------------

- (void)dealloc {
    self.backgroundPopView = nil;
}

#pragma mark - --------------------初始化--------------------

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addTarget:self action:@selector(onClickBackground) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setDelegate:(id<MYPopViewDelegate>)delegate {
    _delegate = delegate;
    NSArray *array = [self.delegate popViewWithSetDate];
    // 初始化popView
    // -- 背景
    UIImageView *backgroundPopView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - kPopViewWidth) * 0.5, 50, kPopViewWidth,
                                                                                   kPopViewItemHeight * array.count + 10)];
    self.backgroundPopView = backgroundPopView;
    backgroundPopView.userInteractionEnabled = YES;
    // 设置背景
    backgroundPopView.image = [UIImage resizeImage:@"popover_background"];
    // -- 设置按钮
    for (int i = 0 ; i < array.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,i * kPopViewItemHeight + 7, kPopViewWidth, kPopViewItemHeight)];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.contentMode = UIViewContentModeCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = kDefaultBtnTag + i;
        [backgroundPopView addSubview:btn];
        [btn addTarget:self action:@selector(onClickPopViewItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self addSubview:backgroundPopView];
    [self setNeedsDisplay];
}

- (instancetype)initWithDelegate:(id<MYPopViewDelegate>)delegate{
    if (self = [super init]) {
        self.delegate = delegate;
        self.isShow = NO;
        [self setBackgroundColor:[UIColor clearColor]];
        [self addTarget:self action:@selector(onClickBackground) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithDelegate:(id<MYPopViewDelegate>)delegate dimBackgroundColor:(UIColor *)backgroundColor popViewImage:(NSString *)imageString {
    if (self = [self initWithDelegate:delegate]) {
        self.backgroundColor = backgroundColor;
        self.backgroundPopView.image = [UIImage resizeImage:imageString];
    }
    return self;
}

#pragma mark - --------------------属性相关------------------

- (void)setBackgroundPopViewStirng:(NSString *)backgroundPopViewStirng {
    _backgroundPopViewStirng = backgroundPopViewStirng;
    self.backgroundPopView.image = [UIImage resizeImage:backgroundPopViewStirng];
}

- (void)setWidth:(CGFloat)width {
    self.backgroundPopView.width = width;
    self.backgroundPopView.x = (kScreenWidth - width) * 0.5;
}

#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
#pragma mark - --------------------功能函数------------------
- (void) showInView:(UIView *)view {
    self.isShow = YES;
    if ([self.delegate respondsToSelector:@selector(popViewWhenShowOrDismiss:)]) {
        [self.delegate popViewWhenShowOrDismiss:YES];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.backgroundPopView.alpha = 1;
    } completion:^(BOOL finished) {
        [view addSubview:self];
    }];
}

- (void)dismiss {
    self.isShow = NO;
    if ([self.delegate respondsToSelector:@selector(popViewWhenShowOrDismiss:)]) {
        [self.delegate popViewWhenShowOrDismiss:NO];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.backgroundPopView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - --------------------手势事件------------------

#pragma mark - --------------------按钮事件------------------
/**
 *  点击popView中的按钮
 *
 *  @param btn buttonItem
 */
- (void)onClickPopViewItem:(UIButton *)btn {
    DLog(@"onClickPopViewItem");
    if (self.delegate && [self.delegate respondsToSelector:@selector(popNavigationItemAnimated:)]) {
        [self.delegate popView:self didSelectItemIndex:(btn.tag - kDefaultBtnTag)];
    }
    [self dismiss];
}

/**
 *  点击背景
 */
- (void)onClickBackground {
    [self dismiss];
}
#pragma mark - --------------------代理方法------------------




@end
