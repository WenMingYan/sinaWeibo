//
//  MYOAuthViewController.m
//  sinaWeibo
//
//  Created by 温明妍 on 15/9/9.
//  Copyright (c) 2015年 wmy. All rights reserved.
//

#import "MYOAuthViewController.h"
#import "MYTabBarViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

@interface MYOAuthViewController() <UIWebViewDelegate>

@end

@implementation MYOAuthViewController


#pragma mark - --------------------退出清空------------------
#pragma mark - --------------------初始化--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",KWeiBoAppKey,kRedirectURI];
    DLog(@"%@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    [self.view addSubview:webView];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
}
#pragma mark - --------------------属性相关------------------
#pragma mark - --------------------接口API------------------
#pragma mark - --------------------父类方法重写--------------
#pragma mark - --------------------功能函数------------------
#pragma mark - --------------------手势事件------------------
#pragma mark - --------------------按钮事件------------------
#pragma mark - --------------------代理方法------------------

#pragma mark UIWebViewDelegate

/**
 *  每当发送一个请求之前都会先调用这个代理方法，询问代理是否允许加载这个请求
 *
 *  @param webView        webView
 *  @param request        即将发送的请求
 *  @param navigationType navigationType
 *
 *  @return YES:允许加载  NO: 禁止加载
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    DLog(@"%@",request.URL.absoluteString);
    NSString *url = request.URL.absoluteString;
    // 判断是否为回调地址
    NSRange range = [url rangeOfString:kRedirectURI];
    if (range.location == 0 && range.length > 0) {// 回调地址
        int from = range.location + range.length + 7;
        NSString *code = [url substringFromIndex:from];
        DLog(@"code = %@",code);
                // 禁止加载页面
        [self accessTokenWithCode:code];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    DLog(@"webViewDidFinishLoad");
    [MBProgressHUD showMessage:@"正在加载.."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    DLog(@"webViewDidFinishLoad");
    [MBProgressHUD hideHUD];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    DLog(@"didFailLoadWithError");
    [MBProgressHUD hideHUD];
    if (error.code != 102) {// Frame load interrupted
        // 跳转到主界面
        // 发送post请求
        [MBProgressHUD showError:@"加载失败"];
    } else {
    }
}

- (void)accessTokenWithCode:(NSString *)code {
    // 获取请求管理者
    AFHTTPRequestOperationManager *operation = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *requestDict = [NSMutableDictionary dictionary];
    requestDict[@"client_id"] = KWeiBoAppKey;
    requestDict[@"client_secret"] = kWeiBoSecrect;
    requestDict[@"grant_type"] = @"authorization_code";
    requestDict[@"code"] = code;
    requestDict[@"redirect_uri"] = kRedirectURI;
    
    [operation POST:@"https://api.weibo.com/oauth2/access_token" parameters:requestDict success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        // 请求成功
        DLog(@"access_token 请求成功 request success operation=%@\n responseObject=%@",operation,responseObject);
        // 一个用户对应一个uid
        NSString *uid = responseObject[@"uid"];
        NSString *access_token = responseObject[@"access_token"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:access_token forKey:@"access_token"];
        [defaults setObject:uid forKey:@"uid"];
        [defaults synchronize];
        [UIApplication sharedApplication].keyWindow.rootViewController = [[MYTabBarViewController alloc] init];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 请求失败
        DLog(@"access_token 请求失败 error = %@",error);
    }];
}

@end
