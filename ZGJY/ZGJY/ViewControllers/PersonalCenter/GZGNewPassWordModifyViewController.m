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

@end



static const NSInteger TEXTFILEDTAG = 1000;


@implementation GZGNewPassWordModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:140], [GZGApplicationTool navBarAndStatusBarSize] +[GZGApplicationTool control_height:20]+ i *[GZGApplicationTool control_height:60], SCREENWIDTH - [GZGApplicationTool control_wide:160], [GZGApplicationTool control_height:40])];
        textFiled.placeholder = textArr[i];
        textFiled.delegate = self;
        textFiled.tag = TEXTFILEDTAG + i;
        textFiled.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        textFiled.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textFiled];
    }
    
    
    
    
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submit.frame = CGRectMake(0, SCREENHEIGHT - [GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:100]);
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submit.backgroundColor = [UIColor redColor];
    [submit addTarget:self action:@selector(currentPassWord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    
    
    
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
    
    UITextField *currendText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:currendText.text,@"currentPassword", nil];
    [[GZGYAPIHelper shareAPIHelper] checkPassWord:dic result:^(NSArray *listArray) {
        
    }];
}

- (void)currentPassWord{
    
    UITextField *currendText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG];
    UITextField *newText = (UITextField *)[self.view viewWithTag:TEXTFILEDTAG + 1];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:currendText.text,@"currentPassword",newText.text,@"password", nil];
    
    [[GZGYAPIHelper shareAPIHelper] changePassWorldClassCurrentPassword:dic Finsh:^(NSArray *listArray) {
        NSLog(@"%@",listArray);
    }];
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
