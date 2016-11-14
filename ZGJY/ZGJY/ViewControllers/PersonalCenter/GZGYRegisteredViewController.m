//
//  GZGYRegisteredViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/11.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYRegisteredViewController.h"
#import "GZGYRegisteredView.h"
@interface GZGYRegisteredViewController ()<RegisteredDelegeteClickProtocol>

@end

@implementation GZGYRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    GZGYRegisteredView * registered = [[GZGYRegisteredView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], SCREENWIDTH, [GZGApplicationTool control_height:920])];
    registered.delegate = self;
    [self.view addSubview:registered];
    // Do any additional setup after loading the view.
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

@end
