//
//  GZGAuthenticateViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAuthenticateViewController.h"
#import "GZGChangePasswordViewController.h"

@interface GZGAuthenticateViewController ()
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UITextField * phoneTextField; // 手机号
@property (nonatomic, strong) UITextField * verificationCodeTextField; // 验证码
@property (nonatomic, strong) UIButton * verificationCodeBtn;
@end

@implementation GZGAuthenticateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"修改密码", nil);
    self.view.userInteractionEnabled = YES;
    
    [self buildUI];
}
#pragma mark - 自己的方法
- (void)buildUI {
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]);
    _scrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHidden:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];
    
    
    UIImageView * oneImageView = [[UIImageView alloc] init];
    oneImageView.image = [UIImage imageNamed:@"PersonalCenterAuthen1Sel"];
    oneImageView.frame = CGRectMake([GZGApplicationTool control_wide:128], [GZGApplicationTool control_height:35], [GZGApplicationTool control_height:85], [GZGApplicationTool control_height:85]);
    [self.scrollView addSubview:oneImageView];
    
    UILabel * authenticateLabel = [[UILabel alloc] init];
    authenticateLabel.frame = CGRectMake([GZGApplicationTool control_wide:128] - [GZGApplicationTool control_height:25], [GZGApplicationTool control_height:133], [GZGApplicationTool control_height:85 + 50], [GZGApplicationTool control_height:32]);
    authenticateLabel.textColor = [UIColor blackColor];
    authenticateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:22]];
    authenticateLabel.textAlignment = NSTextAlignmentCenter;
    authenticateLabel.text = NSLocalizedString(@"验证号码", nil);
    [self.scrollView addSubview:authenticateLabel];
    
    UIImageView * twoImageView = [[UIImageView alloc] init];
    twoImageView.image = [UIImage imageNamed:@"PersonalCenterAuthen2Nor"];
    twoImageView.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:128] - [GZGApplicationTool control_height:85], [GZGApplicationTool control_height:35], [GZGApplicationTool control_height:85], [GZGApplicationTool control_height:85]);
    [self.scrollView addSubview:twoImageView];
    
    UILabel * changePasswordLabel = [[UILabel alloc] init];
    changePasswordLabel.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:128] - [GZGApplicationTool control_height:85 + 25], [GZGApplicationTool control_height:133], [GZGApplicationTool control_height:85 + 50], [GZGApplicationTool control_height:32]);
    changePasswordLabel.textColor = [UIColor blackColor];
    changePasswordLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:22]];
    changePasswordLabel.textAlignment = NSTextAlignmentCenter;
    changePasswordLabel.text = NSLocalizedString(@"修改登录密码", nil);
    [self.scrollView addSubview:changePasswordLabel];
    
    UIImageView * oneLineImageView = [[UIImageView alloc] init];
    oneLineImageView.image = [UIImage imageNamed:@"PersonalCenterAuthenARectangle"];
    oneLineImageView.frame = CGRectMake(oneImageView.frame.origin.x + oneImageView.frame.size.width, oneImageView.frame.origin.y + oneImageView.frame.size.height / 2 - [GZGApplicationTool control_height:5], [GZGApplicationTool screenWide] / 2 - [GZGApplicationTool control_wide:213], [GZGApplicationTool control_height:10]);
    [self.scrollView addSubview:oneLineImageView];
    
    UIImageView * twoLineImageView = [[UIImageView alloc] init];
    twoLineImageView.image = [UIImage imageNamed:@"PersonalCenterAuthenARectangleNor"];
    twoLineImageView.frame = CGRectMake([GZGApplicationTool screenWide] / 2, oneImageView.frame.origin.y + oneImageView.frame.size.height / 2 - [GZGApplicationTool control_height:5], [GZGApplicationTool screenWide] / 2 - [GZGApplicationTool control_wide:213], [GZGApplicationTool control_height:10]);
    [self.scrollView addSubview:twoLineImageView];
    
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:212], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:100]);
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.backgroundColor = [UIColor whiteColor];
    _phoneTextField.placeholder = NSLocalizedString(@"请输入注册手机号", nil);
    _phoneTextField.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:36]];
    [self.scrollView addSubview:self.phoneTextField];
    
    _verificationCodeTextField = [[UITextField alloc] init];
    _verificationCodeTextField.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:364], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:100]);
    _verificationCodeTextField.backgroundColor = [UIColor whiteColor];
    _verificationCodeTextField.placeholder = NSLocalizedString(@"请输入短信验证码", nil);
    _verificationCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    _verificationCodeTextField.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:36]];
    [self.scrollView addSubview:self.verificationCodeTextField];
    
    _verificationCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _verificationCodeBtn.frame = CGRectMake([GZGApplicationTool control_wide:464], [GZGApplicationTool control_height:364], [GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:100]);
    [_verificationCodeBtn setBackgroundImage:[UIImage imageNamed:@"PersonalCenterAuthenRectangular"] forState:UIControlStateNormal];
    [_verificationCodeBtn setTitle:NSLocalizedString(@"获取验证码", nil) forState:UIControlStateNormal];
    _verificationCodeBtn.tag = 101;
    [_verificationCodeBtn.titleLabel setFont:[UIFont systemFontOfSize:[GZGApplicationTool control_height:30]]];
    [_verificationCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_verificationCodeBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.verificationCodeBtn];
    
    UIButton * nextStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextStepBtn.frame = CGRectMake([GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:610], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:80], [GZGApplicationTool control_height:95]);
    nextStepBtn.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
    [nextStepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextStepBtn setTitle:NSLocalizedString(@"下一步", nil) forState:UIControlStateNormal];
    nextStepBtn.tag = 102;
    [nextStepBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:nextStepBtn];
}
- (void)buttonClick:(UIButton *)btn {
    
    switch (btn.tag) {
        case 101: {
            NSLog(@"获取验证码");
        }
            break;
        case 102: {
            NSLog(@"下一步");
            GZGChangePasswordViewController * changePasswordVC = [[GZGChangePasswordViewController alloc] init];
            [self.navigationController pushViewController:changePasswordVC animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)keyboardHidden:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES];
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
