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
//    emails.phoneField.delegate = self;
//    emails.onceField.delegate = self;
    [self.view addSubview:emails];
    // Do any additional setup after loading the view.
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([textField isEqual:emails.phoneField]) {
        NSDictionary * dict = @{@"username":emails.phoneField.text};
        [[GZGYAPIHelper shareAPIHelper]UserNameURL:@"http://192.168.0.110:8080/appRegister/checkUsername" Dict:dict Finsh:^(NSString * string){
        }];
    }else{
        NSDictionary * dict = @{@"email":emails.onceField.text};
        [[GZGYAPIHelper shareAPIHelper]EmailsURL:@"http://192.168.0.110:8080/appRegister/checkEmail" Dict:dict Finsh:^(NSString * string){
        }];
    }
    return YES;
}
#pragma mark --- 返回按钮
-(void)BackDelegeteClick:(id)sender
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
