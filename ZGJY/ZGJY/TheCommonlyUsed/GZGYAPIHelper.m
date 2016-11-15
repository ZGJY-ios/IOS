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
@end
