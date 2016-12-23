//
//  ZGNetWork.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/11.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger,ZGSerVerState) {
    ZGSerVerState_success                   = 200,                                        //请求成功
    ZGSerVerState_create                    = 201,                                        //请求创建成功
    ZGSerVerState_error                     = 400,                                        //请求错误
    ZGSerVerState_unauthorized              = 401,                                        //未授权
    SerVerState_serverBan                   = 403,                                        //服务器禁止请求
    SerVerState_urlError                    = 404,                                        //服务器网址错误
    SerVerState_collapse                    = 500,                                        //服务器挂掉了
};


@interface ZGNetWork : NSObject
+ (NSString *)mobileAPIBaseURL;
+ (AFHTTPSessionManager *)setRequestManger;

/**
 *  GET请求
 *
 *  @param url        Url
 *  @param parameters Parameters
 *  @param success    Success
 *  @param errors     Error
 */
+ (void)GETRequestMethodUrl:(NSString*)url
                 parameters:(id)parameters
                    success:(void(^)(id responseObject,NSInteger task))success
                    failure:(void(^)(NSError *failure,NSInteger  task))errors;

/**
 *  POST请求
 *
 *  @param url        Url
 *  @param parameters Parameters
 *  @param success    Success
 *  @param errors     Error
 */
+ (void)POSTRequestMethodUrl:(NSString*)url
                  parameters:(id)parameters
                     success:(void(^)(id responseObject,NSInteger task))success
                     failure:(void(^)(NSError *failure,NSInteger  task))errors;

/**
 *  DELETE请求
 *
 *  @param url        Url
 *  @param parameters Parameters
 *  @param success    Success
 *  @param errors     Error
 */
+ (void)DELETERequestMethodUrl:(NSString *)url
                    parameters:(id)parameters
                       success:(void(^)(id responseObject,NSInteger task))success
                       failure:(void(^)(NSError *failure,NSInteger  task))errors;

/**
 *  PUT请求
 *
 *  @param url        Url
 *  @param parameters Parameters
 *  @param success    Success
 *  @param errors     Error
 */
+ (void)PUTRequestMethodUrl:(NSString *)url
                 parameters:(id)parameters
                    success:(void(^)(id responseObject,NSInteger task))success
                    failure:(void(^)(NSError *failure,NSInteger  task))errors;
/**
 *  上传图片
 *
 *  @param url        Url
 *  @param parameters Paramenters
 *  @param image      UIImage
 *  @param success    Success
 *  @param errors     Error
 */
+ (void)uploadUrl:(NSString *)url
       parameters:(id)parameters
            Image:(UIImage *)image
          success:(void(^)(id responseObject,NSInteger task))success
          failure:(void(^)(NSError *failure,NSInteger  task))errors;

@end
