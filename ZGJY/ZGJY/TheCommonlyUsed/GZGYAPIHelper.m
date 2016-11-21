//
//  GZGYAPIHelper.m
//  ZGJY
//
//  Created by YYS on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAPIHelper.h"

@implementation GZGYAPIHelper
+ (instancetype)shareAPIHelper{
    static GZGYAPIHelper *help = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        help = [[GZGYAPIHelper alloc]init];
    });
    return help;
}
- (void)MaternalandChildURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)())result
{
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        NSLog(@"任海你大爷%@",responseObject);
        result();
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD dismiss];
        NSLog(@"%@",failure);
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
@end
