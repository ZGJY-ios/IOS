//
//  GZGYLoginView.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLoginView.h"

@implementation GZGYLoginView
@synthesize backBtn,titleLabel,backView,lineLabel,phoneImg,phoneField,passView,passLabel,passageImg,passageField,regBtn,forgetBtn,loginBtn;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake([GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:[GZGApplicationTool control_wide:50]], [GZGApplicationTool control_height:40]);
        [backBtn setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(Back:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:175], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:40])];
        titleLabel.text = @"欢迎登录中港";  
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:40]];
        [self addSubview:titleLabel];
        
        backView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:85])];
        backView.layer.cornerRadius = 0;
        backView.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        backView.layer.borderWidth = 1;
        [backView.layer setMasksToBounds:YES];
        backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:backView];
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85], 0, 1, [GZGApplicationTool control_height:85])];
        lineLabel.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        [backView addSubview:lineLabel];
        UIView * imgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:85], [GZGApplicationTool control_height:85])];
        imgview.backgroundColor = [UIColor colorWithRed:236/255.0 green:237/255.0 blue:238/255.0 alpha:1.0];
        [backView addSubview:imgview];
        phoneImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:12.5], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:65])];
        phoneImg.image = [UIImage imageNamed:@"user-name"];
        [backView addSubview:phoneImg];
        phoneField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:105], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:445], [GZGApplicationTool control_height:85])];
        phoneField.placeholder = @"请输入邮箱";
        phoneField.backgroundColor = [UIColor whiteColor];
        [backView addSubview:phoneField];
        
        passView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:365], [GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:85])];
        passView.layer.cornerRadius = 0;
        passView.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        passView.layer.borderWidth = 1;
        [passView.layer setMasksToBounds:YES];
        passView.backgroundColor = [UIColor whiteColor];
        [self addSubview:passView];
        UIView * imgview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:85], [GZGApplicationTool control_height:85])];
        imgview1.backgroundColor = [UIColor colorWithRed:236/255.0 green:237/255.0 blue:238/255.0 alpha:1.0];
        [passView addSubview:imgview1];
        passageImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:12.5], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:65])];
        passageImg.image = [UIImage imageNamed:@"user-password"];
        [passView addSubview:passageImg];
        passLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85], 0, 1, [GZGApplicationTool control_height:85])];
        passLabel.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        [passView addSubview:passLabel];
        passageField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:105], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:445], [GZGApplicationTool control_height:85])];
        passageField.placeholder = @"密码";
        passageField.backgroundColor = [UIColor whiteColor];
        [passView addSubview:passageField];
        regBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        regBtn.frame = CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:475], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35]);
        [regBtn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:UIControlStateNormal];
        [regBtn setTitle:@"邮箱快速注册" forState:UIControlStateNormal];
        regBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        regBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [regBtn addTarget:self action:@selector(Registered:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:regBtn];
        forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        forgetBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:475], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35]);
        [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [forgetBtn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:UIControlStateNormal];
        forgetBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        forgetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [forgetBtn addTarget:self action:@selector(Forget:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:forgetBtn];
        loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.frame = CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:535], [GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:85]);
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        loginBtn.backgroundColor = [UIColor colorWithRed:180/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [loginBtn addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginBtn];
    }
    return self;
}
#pragma mark --- 返回按钮
-(void)Back:(id)sender
{
    [self.delegete BackDelegeteClick:sender];
}
#pragma mark --- 注册
-(void)Registered:(id)sender
{
    [self.delegete RegDelegeteClick:sender];
}
#pragma mark --- 忘记密码
-(void)Forget:(id)sender
{
    [self.delegete ForgetDelegeteClick:sender];
}
#pragma mark --- 登录
-(void)Login:(id)sender
{
    [self.delegete LoginDelegeteClick:sender];
}
@end
