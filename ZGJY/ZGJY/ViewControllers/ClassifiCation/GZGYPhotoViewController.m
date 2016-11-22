//
//  GZGYPhotoViewController.m
//  ZGJY
//
//  Created by YYS on 2016/11/18.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYPhotoViewController.h"

@interface GZGYPhotoViewController ()<UIWebViewDelegate>
@property(nonatomic, strong)UIWebView * webView;
@end

@implementation GZGYPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.introduction);
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *string = self.introduction;
//    NSRange startRange = [string rangeOfString:@"http://192.168.0.110:8080/"];
//    NSRange endRange = [string rangeOfString:@".jpg"];
//    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
//    NSString *result = [string substringWithRange:range];
//    NSMutableArray * ImageArr = [NSMutableArray arrayWithArray:[result   componentsSeparatedByString:@""]];
//    GZGLog(@"%@",ImageArr);
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize])];
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:self.scrollView];
    [self webview];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
