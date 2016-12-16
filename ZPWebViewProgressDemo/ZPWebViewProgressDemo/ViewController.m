//
//  ViewController.m
//  ZPWebViewProgressDemo
//
//  Created by yueru on 2016/12/16.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "ViewController.h"
#import "ZPWebViewProgress.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) UIWebView *webView;
@property (strong, nonatomic) ZPWebViewProgress *progress;

@end

@implementation ViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    webView.backgroundColor = [UIColor darkTextColor];
    self.view = webView;
    self.webView = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置URL
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/codeZP/ZPWebViewProgress"]]];
    
    //添加进度条
    self.progress = [[ZPWebViewProgress alloc] init];
    self.progress.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    [self.navigationController.navigationBar.layer addSublayer:self.progress];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.progress startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.progress finishedLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.progress finishedLoad];
}

- (void)dealloc {
    [self.progress closeTimer];
    [self.progress removeFromSuperlayer];
    self.progress = nil;
}

@end
