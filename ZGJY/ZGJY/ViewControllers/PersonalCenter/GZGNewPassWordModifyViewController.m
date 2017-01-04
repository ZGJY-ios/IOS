//
//  GZGNewPassWordModifyViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/12/29.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGNewPassWordModifyViewController.h"
//#import "GZGYAPIHelper.h"
@interface GZGNewPassWordModifyViewController ()<UITextFieldDelegate>
@property(nonatomic,assign) BOOL is_passWord;
@property(nonatomic,strong) UIButton *submit;
@property(nonatomic,strong) UILabel *validationPassWord;
@end



static const NSInteger TEXTFILEDTAG = 1000;


@implementation GZGNewPassWordModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _is_passWord = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titles.text = @"修改密码";
    [self buildUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark 方法
- (void)buildUI{
    
    NSArray *textArr = @[NSLocalizedString(@"GZGNewPassWordModify_CurrentPassword", nil),
                         NSLocalizedString(@"GZGNewPassWordModify_NewPassword", nil),
                         NSLocalizedString(@"GZGNewPassWordModify_ConfirmPassWord", nil)];
    
    
    
    for (NSInteger i=0; i<textArr.count; i++) {
        UILabel *labStr = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool navBarAndStatusBarSize] +[GZGApplicationTool control_height:20] + i *[GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:40])];
        labStr.text = textArr[i];
        labStr.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        [self.view addSubview:labStr];
    }
    
    
    
    for (NSInteger i=0; i<textArr.count; i++) {
        UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:140], [GZGApplicationTool navBarAndStatusBarSize] +[GZGApplicationTool control_height:20]+ i *[GZGApplicationTool control_height:60], SCREENWIDTH - [GZGApplicationTool control_wide:330], [GZGApplicationTool control_height:40])];
        textFiled.placeholder = textArr[i];
        if (i!=0) {
            textFiled.placeholder = NSLocalizedString(@"GZGNewPassWordModify_passWrodLenther", nil);
        }
        textFiled.delegate = self;
        textFiled.tag = TEXTFILEDTAG + i;
        textFiled.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        textFiled.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textFiled];
    }
    
    UITextField *textFileds = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG + 0];
    
    _validationPassWord = [[UILabel alloc] initWithFrame:CGRectMake(textFileds.edgnSideOffset + [GZGApplicationTool control_wide:10], [GZGApplicationTool navBarAndStatusBarSize] +[GZGApplicationTool control_height:20], SCREENWIDTH - (SCREENWIDTH - [GZGApplicationTool control_wide:340]), [GZGApplicationTool control_height:40])];
    _validationPassWord.textColor = [UIColor redColor];
    _validationPassWord.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    [self.view addSubview:_validationPassWord];
    
    
    
    _submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _submit.frame = CGRectMake(0, SCREENHEIGHT - [GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:100]);
    [_submit setTitle:@"提交" forState:UIControlStateNormal];
    [_submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _submit.backgroundColor = [UIColor lightGrayColor];
    [_submit addTarget:self action:@selector(currentPassWord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submit];
    
    
    
}

#pragma mark 系统代理
-(void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case TEXTFILEDTAG + 0: {
            
            NSLog(@"0");
            [self checkNewPassword];
            
            break;
        }
        case TEXTFILEDTAG + 1: {
            
            NSLog(@"1");
            break;
        }
        case TEXTFILEDTAG + 2: {
            
            NSLog(@"2");
            break;
        }
        default:
            break;
    }
}

#pragma mark 自己的代理

#pragma mark 自己的方法

- (void)checkNewPassword{
    
    static NSString *success = @"success";
    static NSString *error = @"error";
    
    
    UITextField *currendText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:currendText.text,@"currentPassword", nil];
    [[GZGYAPIHelper shareAPIHelper] checkPassWord:dic result:^(NSDictionary *dic) {
        
        
        
        NSString *type = [dic objectForKey:@"type"];
        
        if ([type isEqualToString:success]) {
            _is_passWord = YES;
            _submit.backgroundColor = [UIColor redColor];
            _validationPassWord.text = @"验证通过";
        }else if ([type isEqualToString:error]){
            _is_passWord = NO;
            _submit.backgroundColor = [UIColor lightGrayColor];
            _validationPassWord.text = @"当前密码不对";
        }
        
    }];
}

- (void)currentPassWord{
    
    
    if (_is_passWord == NO) {
        
    }else{
        UITextField *currendText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG];
        UITextField *newText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG + 1];
        UITextField *newTextOK = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG + 2];
        if (newText.text.length == 0 || newText.text.length <= 6) {
            [kAPPDELEGATE AutoDisplayAlertView:@"提示" :@"请输入新密码或者新密码长度不对"];
            return;
        }
        if (newTextOK.text.length == 0) {
            [kAPPDELEGATE AutoDisplayAlertView:@"提示" :@"请输入验证密码或者新密码长度不对"];
            return;
        }
        
        
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:currendText.text,@"currentPassword",newText.text,@"password", nil];
        
        [[GZGYAPIHelper shareAPIHelper] changePassWorldClassCurrentPassword:dic Finsh:^(NSArray *listArray) {
            [kAPPDELEGATE AutoDisplayAlertView:@"提示" :@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
            
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








