//
//  GZGYAPIHelper.m
//  ZGJY
//
//  Created by YYS on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAPIHelper.h"
#import "GZGYDetailsModel.h"
@implementation GZGYAPIHelper
+ (instancetype)shareAPIHelper{
    static GZGYAPIHelper *help = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        help = [[GZGYAPIHelper alloc]init];
    });
    return help;
}
#pragma mark ---限时特卖
- (void)LimitedTimeSaleURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"限时特卖%@",responseObject);
        NSArray * limitArray = responseObject[@"page"][@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
//        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
#pragma mark --- 火力拼团
-(void)SpellGroupURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"火力拼团%@",responseObject);
        NSArray * limitArray = responseObject[@"page"][@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
//母婴用品接口
- (void)specialPerformanceURL:(NSString *)url dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed {
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        NSDictionary * dict = [NSDictionary dictionaryWithDictionary:responseObject[@"page"]];
        NSArray * array = dict[@"list"];
        result(array);
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
    }];
}
//国家馆接口
- (void)pavilionURL:(NSString *)url dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed {
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        NSDictionary * dict = [NSDictionary dictionaryWithDictionary:responseObject[@"page"]];
        NSArray * array = dict[@"list"];
        result(array);
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
    }];
}
#pragma mark --- 商品详情接口
- (void)DetailssTimeSaleURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"商品详情%@",responseObject);
        NSArray * limitArray = responseObject[@"page"][@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --- 检查用户名接口
-(void)UserNameURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSString * string))result
{
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"检查用户名%@",responseObject);
        NSString * str;
        result(str);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --- 检查邮箱接口
-(void)EmailsURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSString * string))result
{
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"检查邮箱%@",responseObject);
        NSString * str;
        result(str);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
        
@end
