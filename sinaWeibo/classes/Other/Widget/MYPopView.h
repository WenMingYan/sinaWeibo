//
//  MYPopView.h
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/8.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYPopView;
@protocol MYPopViewDelegate <NSObject>
/**
 *  设置popView点开时需要显示的内容
 *
 *  @param popView popView
 *  @param array   显示内容的条目
 */
- (NSArray *)popViewWithSetDate;

- (void)popView:(MYPopView *)popView didSelectItemIndex:(int)index;

- (void)popViewWhenShowOrDismiss:(BOOL)isShow;
@end

@interface MYPopView : UIButton

@property (nonatomic,strong) id<MYPopViewDelegate> delegate;
@property (nonatomic,assign) BOOL isShow;
@property (nonatomic,strong) NSString *backgroundPopViewStirng;

/**
 *  初始化控件
 *
 *  @param delegate 代理
 *
 *  @return MYPopView
 */
- (instancetype)initWithDelegate:(id<MYPopViewDelegate>)delegate;
- (instancetype)initWithDelegate:(id<MYPopViewDelegate>)delegate dimBackgroundColor:(UIColor *)backgroundColor popViewImage:(NSString *)imageString;
/**
 *  显示popView
 */
- (void) showInView:(UIView *)view;

- (void)dismiss;

@end
