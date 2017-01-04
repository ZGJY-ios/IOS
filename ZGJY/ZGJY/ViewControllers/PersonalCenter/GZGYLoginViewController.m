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
@interface GZGYLoginViewController ()<LoginDelegeteClickProtocol,UITextFieldDelegate>
{
    GZGYLoginView * loginView;
}
@end

@implementation GZGYLoginViewController
@synthesize TbabarLogin;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    loginView = [[GZGYLoginView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], SCREENWIDTH, [GZGApplicationTool control_height:620])];
    loginView.delegete = self;
    loginView.phoneField.delegate = self;
    loginView.passageField.delegate = self;
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view.
}
#pragma mark --- 点击空白处收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark --- 返回事件
-(void)BackDelegeteClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([_backid isEqualToString:@"1"]) {
        TbabarLogin(@"1");
    }
}
#pragma mark --- 注册事件
-(void)RegDelegeteClick:(id)sender
{
    GZGYEmailsViewController * emails = [[GZGYEmailsViewController alloc]init];
    [self.navigationController pushViewController:emails animated:YES];
}
#pragma mark --- 忘记密码
-(void)ForgetDelegeteClick:(id)sender
{
    
}
#pragma mark --- 登录
-(void)LoginDelegeteClick:(id)sender
{
    [self.view endEditing:YES];
    if (loginView.phoneField.text == nil||[loginView.phoneField.text isEqual:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号或邮箱"];
    }else if (loginView.passageField.text == nil||[loginView.passageField.text isEqual:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入正确的密码"];
    }else{
        NSDictionary * dict = @{@"username":loginView.phoneField.text,@"password":loginView.passageField.text};
        [[GZGYAPIHelper shareAPIHelper]LoginDict:dict Between:@"1" Finsh:^(NSString * string,NSString * typeString,NSString * content,NSString * username,NSString * password){
            if ([typeString isEqualToString:@"error"]) {
                [SVProgressHUD showErrorWithStatus:content];
            }else{
                [SVProgressHUD dismiss];
                [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"USERID"];
                [[NSUserDefaults standardUserDefaults]setObject:username forKey:@"USERNAME"];
                [[NSUserDefaults standardUserDefaults]setObject:password forKey:@"PASSWORD"];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    }
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
