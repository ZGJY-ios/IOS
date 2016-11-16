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
//母婴用品接口
- (void)MaternalandChildURL:(NSString *)url Dict:(NSDictionary *)dict Finsh:(void (^)())result;
//母婴用品接口
- (void)specialPerformanceURL:(NSString *)url dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed;
@end
