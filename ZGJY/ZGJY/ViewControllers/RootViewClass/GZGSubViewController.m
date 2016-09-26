//
//  GZGSubViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"

@interface GZGSubViewController ()

@end

@implementation GZGSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [GZGColorClass gzgBackClolor];
    [self initUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)initUI{
    self.navigationController.navigationBar.hidden = YES;
    
    self.navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREENWIDTH, [GZGApplicationTool navBarAndStatusBarSize])];
    self.navBarView.backgroundColor = [GZGColorClass gzgNavBarBackColor];
    [self.view addSubview:self.navBarView];
    
    self.titles = [[UILabel alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool statusBarSize], SCREENWIDTH,  [GZGApplicationTool navigationBarSize])];
    self.titles.textColor = [UIColor whiteColor];
    self.titles.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:36]];
    self.titles.textAlignment = NSTextAlignmentCenter;
    [self.navBarView addSubview:self.titles];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake([GZGApplicationTool control_wide:25],([GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:34])/2, [GZGApplicationTool control_wide:33], [GZGApplicationTool control_height:34]);
//    [self.leftBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Search"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(returnBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.navBarView addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(SCREENWIDTH - [GZGApplicationTool control_wide:40 + 25],([GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:34])/2, [GZGApplicationTool control_wide:33], [GZGApplicationTool control_height:34]);
    [self.rightBtn addTarget:self action:@selector(rightBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.navBarView addSubview:self.rightBtn];
    
    
}

- (void)returnBtnDown{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnDown{
    
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
