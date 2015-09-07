//
//  OneViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/7.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@implementation OneViewController


- (IBAction)onClickJumpTwo:(id)sender {
    TwoViewController *vc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
