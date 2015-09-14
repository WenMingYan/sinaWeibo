//
//  MYLoginTool.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/14.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYControllerTool.h"

@implementation MYControllerTool

+ (void)chooseController {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:lastVersions];
    NSDictionary *infoDictionary = [NSBundle mainBundle].infoDictionary;
    NSString *nowVersion = infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    UIViewController *controller = nil;
    
    if ([nowVersion isEqualToString:lastVersion]) {
        // 如果上次登录成功了，那么就直接跳转到mytabar
        NSString *accessToken = [defaults objectForKey:@"access_token"];
        if (accessToken !=nil) {
            controller = [[MYTabBarViewController alloc] init];
        } else {
            controller = [[MYOAuthViewController alloc] init];
        }
    } else {
        controller = [[MYNewVersionViewController alloc] init];
        [defaults setObject:nowVersion forKey:lastVersions];
        [defaults synchronize];
    }
    
    self.window.rootViewController = controller;
}

@end
