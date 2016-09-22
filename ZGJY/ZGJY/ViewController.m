//
//  ViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "ViewController.h"
#import "ZGNetWorking/ZGNetWork.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@",  NSLocalizedString(@"qaz", nil));
    //啦啦啦LYD 1111111 222 444fffffff
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    [ZGNetWork GETRequestMethodUrl:@"http://192.168.2.105:8080/web-ssm/user/test" parameters:nil success:^(id  _Nullable responseObject, NSInteger task) {
////        NSLog(@"%@",[[responseObject objectForKey:@"weatherinfo"] objectForKey:@"city"]);
//        NSLog(@"%@",responseObject);
//    } failure:^(NSError *failure, NSInteger task) {
//        NSLog(@"%ld  %@",task,failure);
//    }];

    
    [ZGNetWork POSTRequestMethodUrl:@"https://192.168.0.106:8443/user/book" parameters:nil success:^(id responseObject, NSInteger task) {
        NSLog(@"%ld  %@",task,responseObject);
    } failure:^(NSError *failure, NSInteger task) {
        NSLog(@"%ld  %@",task,failure);
    }];
    
//    NSDictionary *dic = @{@"authToken":@"12ffcd76-1891-45d4-897c-37dd2cfe808b",@"consumerId":@"ff4c1624-b77e-4604-be31-11e4c1265407"};
//    
//    [ZGNetWork uploadUrl:@"http://123.56.127.139/warman/user/header" parameters:dic Image:[UIImage imageNamed:@"123456"] success:^(id responseObject, NSInteger task){
//        NSLog(@"%ld",task);
//    } failure:^(NSError *failure, NSInteger task) {
//        NSLog(@"%ld  %@",task,failure);
//    }];
    
    
    
//    int i=1;
//    while (i!=0) {
//        
//        NSLog(@"11");
//        
//        i++;
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
