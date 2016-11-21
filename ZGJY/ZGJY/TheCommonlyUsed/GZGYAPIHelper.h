//
//  GZGYAPIHelper.h
//  ZGJY
//
//  Created by YYS on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZGYAPIHelper : NSObject
+ (instancetype)shareAPIHelper;
//限时特卖接口
- (void)LimitedTimeSaleURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//火力拼团接口
-(void)SpellGroupURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//母婴用品接口
- (void)specialPerformanceURL:(NSString *)url dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed;
//商品详情接口
- (void)DetailssTimeSaleURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//检查用户名接口
-(void)UserNameURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSString * string))result;
//检查邮箱接口
-(void)EmailsURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)(NSString * string))result;
@end
