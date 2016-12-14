//
//  GZGYEmailsViewController.m
//  ZGJY
//
//  Created by YYS on 2016/11/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYEmailsViewController.h"
#import "GZGYEmailsView.h"
@interface GZGYEmailsViewController ()<EmailsDelegeteClickProtocol,UITextFieldDelegate>
{
    GZGYEmailsView * emails;
}
@end

@implementation GZGYEmailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    emails = [[GZGYEmailsView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], SCREENWIDTH, [GZGApplicationTool control_height:920])];
    emails.delegate = self;
    emails.phoneField.delegate = self;
    emails.codeField.delegate = self;
    emails.passField.delegate = self;
    emails.onceField.delegate = self;
    [self.view addSubview:emails];
    // Do any additional setup after loading the view.
}
#pragma mark --- 输入结束
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([textField isEqual:emails.phoneField]) {
        if (emails.phoneField.text.length != 0) {
            NSDictionary * dict = @{@"username":emails.phoneField.text};
            [[GZGYAPIHelper shareAPIHelper]UserNameDict:dict Finsh:^(NSString * string,NSString * contentString){
                if ([contentString isEqualToString:@"error"]) {
                    emails.lineLable.text = string;
                }else{
                    emails.lineLable.text = @"此用户名可以使用";
                }
            }];
        }
    }else if ([textField isEqual:emails.onceField]){
        if (emails.onceField.text.length != 0) {
            NSDictionary * dict = @{@"email":emails.onceField.text};
            [[GZGYAPIHelper shareAPIHelper]EmailsDict:dict Finsh:^(NSString * string,NSString * contentString){
                if ([contentString isEqualToString:@"error"]) {
                    emails.promptLabel.text = string;
                    NSLog(@"邮箱%@",string);
                }else{
                    emails.promptLabel.text = @"此邮箱可以使用";
                }
            }];
        }
    }
    return YES;
}
#pragma mark --- 点击空白处收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark --- 返回按钮
-(void)BackDelegeteClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --- 注册
-(void)EmailsDelegeteClick:(id)sender
{
    [self.view endEditing:YES];
    if (emails.phoneField.text == nil||[emails.phoneField.text isEqual:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
    }else if (emails.codeField.text == nil||[emails.codeField.text isEqual:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
    }else if (emails.passField.text == nil||[emails.passField.text isEqual:@""]){
        [SVProgressHUD showErrorWithStatus:@"请再次输入密码"];
    }else if (emails.codeField.text !=emails.passField.text){
        [SVProgressHUD showErrorWithStatus:@"两次输入密码不一致"];
    }else if (emails.onceField.text == nil||[emails.onceField.text isEqual:@""]){
        [SVProgressHUD showErrorWithStatus:@"请输入邮箱密码"];
    }else{
        NSDictionary * dict = @{@"email":emails.onceField.text,@"username":emails.phoneField.text,@"password":emails.passField.text};
        [[GZGYAPIHelper shareAPIHelper]EmailsRegisterDict:dict Finsh:^(NSString * idString,NSString * typeString,NSString * content){
            if ([typeString isEqualToString:@"error"]) {
                [SVProgressHUD showErrorWithStatus:content];
            }else{
                [[NSUserDefaults standardUserDefaults]setObject:idString forKey:@"USERID"];
                [self dismissViewControllerAnimated:YES completion:nil];
                GZGLog(@"注册成功");
            }
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
