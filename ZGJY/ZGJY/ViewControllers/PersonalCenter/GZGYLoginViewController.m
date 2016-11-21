//
//  GZGYLoginViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLoginViewController.h"
#import "GZGYLoginView.h"
#import "GZGYRegisteredViewController.h"
#import "GZGYEmailsViewController.h"
@interface GZGYLoginViewController ()<LoginDelegeteClickProtocol>
{
    GZGYLoginView * loginView;
}
@end

@implementation GZGYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    loginView = [[GZGYLoginView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], SCREENWIDTH, [GZGApplicationTool control_height:620])];
    loginView.delegete = self;
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view.
}
#pragma mark --- 返回事件
-(void)BackDelegeteClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --- 注册事件
-(void)RegDelegeteClick:(id)sender
{
//    GZGYRegisteredViewController * regisred = [[GZGYRegisteredViewController alloc]init];
//    [self presentViewController:regisred animated:YES completion:nil];
    GZGYEmailsViewController * emails = [[GZGYEmailsViewController alloc]init];
    [self presentViewController:emails animated:YES completion:nil];
}
#pragma mark --- 忘记密码
-(void)ForgetDelegeteClick:(id)sender
{
    
}
#pragma mark --- 登录
-(void)LoginDelegeteClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
