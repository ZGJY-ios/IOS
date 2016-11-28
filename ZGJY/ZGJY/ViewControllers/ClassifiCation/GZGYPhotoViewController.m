//
//  GZGYPhotoViewController.m
//  ZGJY
//
//  Created by YYS on 2016/11/18.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYPhotoViewController.h"

@interface GZGYPhotoViewController ()<UIWebViewDelegate>
{
    NSString * contentString;
}
@property(nonatomic, strong)NSMutableArray * imgArray;
@property(nonatomic, strong)UIWebView * webView;
@end

@implementation GZGYPhotoViewController
-(NSMutableArray *)imgArray
{
    if (_imgArray == nil) {
        _imgArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imgArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.introduction);
    self.view.backgroundColor = [UIColor whiteColor];
        //字符串转变为数组1
        NSMutableString * str=[[NSMutableString alloc]initWithFormat:@"%@",self.introduction];
        //字符串转变为数组2
        NSMutableArray * ImageArr = [NSMutableArray arrayWithArray:[str   componentsSeparatedByString:@"<img src="]];
        [ImageArr removeObjectAtIndex:0];
    contentString = self.introduction;
    for (int i = 0; i<ImageArr.count; i++) {
        NSRange startRange = [contentString rangeOfString:@"upload"];
        NSRange endRange = [contentString rangeOfString:@".jpg"];
        NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
        NSString *result = [contentString substringWithRange:range];
        NSString * imgString = [NSString stringWithFormat:@"upload%@.jpg",result];
        [self.imgArray addObject:imgString];
        contentString = [contentString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"upload%@.jpg",result] withString:@""];
    }
    GZGLog(@"%@",self.imgArray);
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize]-self.tabBarController.tabBar.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, [GZGApplicationTool control_height:200]*self.imgArray.count);
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self ImgViewInterface];
//    [self webview];
}
#pragma mark --- 图片
-(void)ImgViewInterface
{
    for (int i = 0; i<self.imgArray.count; i++) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:200]*i, SCREENWIDTH, [GZGApplicationTool control_height:200])];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString * urlString = [NSString stringWithFormat:@"http://192.168.0.110:8080/%@",self.imgArray[i]];
            [imgView setHeader:urlString];
        });
        [self.scrollView addSubview:imgView];
    }
}
-(UIWebView*)webview
{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,[GZGApplicationTool navBarAndStatusBarSize],SCREENWIDTH,SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
        [_webView loadHTMLString:self.introduction baseURL:nil];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:@"rewrite();"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
