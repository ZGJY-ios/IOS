//
//  ZGNetWork.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/11.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "ZGNetWork.h"
#import "ZGNetDealImage.h"
static ZGNetWork *_newWork = nil;
static NSInteger const _timeDelay                   = 30;
@interface ZGNetWork ()
@end

@implementation ZGNetWork
+ (NSString *)mobileAPIBaseURL{

    NSString * baseURL= nil;
#ifdef DEBUG
    baseURL = @"http://192.168.0.110:8080/";
#else
    baseURL = @"http://www.maizanmao.com/";//上线接口
#endif
    return baseURL;
}

+ (AFHTTPSessionManager *)setRequestManger{
    
//    @"text/plain",
//    @"text/html",
//    @"application/x-www-form-urlencoded",
//    @"application/json",
//    @"text/json",
//    @"text/javascript",
//    @"image/png",
//    @"image/jpeg",
//    @"application/rtf",
//    @"image/gif",
//    @"application/zip",
//    @"audio/x-wav",
//    @"image/tiff",
//    @"application/vnd.ms-powerpoint",
//    @"video/mpeg",@"video/quicktime",
//    @"application/x-javascript",
//    @"application/x-gzip",
//    @"application/x-gtar",
//    @"application/msword",
//    @"text/css",
//    @"video/x-msvideo",
//    @"text/xml"
    
    
    AFHTTPSessionManager  *requestManager = [AFHTTPSessionManager manager];
    requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                                @"application/json",
                                                                @"text/json",
                                                                @"text/javascript",
                                                                @"text/html", nil];
//    requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
    requestManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    ((AFJSONResponseSerializer *)requestManager.responseSerializer).removesKeysWithNullValues = YES;
    requestManager.requestSerializer.timeoutInterval = _timeDelay;
    
    return requestManager;
}




/**
 *  转Json数据
 *
 *  @param responseObject ResponseObject
 *
 *  @return NSDictionary
 */
//+ (NSDictionary *)dataTransformationJson:(id  _Nullable)responseObject{
////    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
////                                                        options:NSJSONReadingMutableLeaves
////                                                          error:nil];
//    
//    NSLog(@"%@",responseObject);
//    
//    
//    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    return dic;
//}

/**
 *  返回状态
 *
 *  @param response NSURLResponse
 *
 *  @return NSInteger
 */

+ (NSInteger)urlResponseErrorCode:(NSURLResponse *)response{
    
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    switch (responseStatusCode) {
        case ZGSerVerState_success:{
//            NSLog(@"请求成功");
            return ZGSerVerState_success;
           break;
        }
        case ZGSerVerState_create:{
//            NSLog(@"请求创建成功");
            return ZGSerVerState_create;
            break;
        }
        case ZGSerVerState_error:{
//            NSLog(@"请求错误");
            return ZGSerVerState_error;
            break;
        }
        case ZGSerVerState_unauthorized:{
//            NSLog(@"未授权");
            return ZGSerVerState_unauthorized;
            break;
        }
        case SerVerState_serverBan:{
//            NSLog(@"服务器禁止请求");
            return SerVerState_serverBan;
            break;
        }
        case SerVerState_urlError:{
//            NSLog(@"服务器网址错误");
            return SerVerState_urlError;
            break;
        }
        case SerVerState_collapse:{
//            NSLog(@"服务器挂掉了");
            return SerVerState_collapse;
            break;
        }
        default:
            break;
    }
    return 0;
}
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
                    failure:(void(^)(NSError *failure,NSInteger  task))errors{
    NSString *gzgUrl = [NSString stringWithFormat:@"%@%@",[self mobileAPIBaseURL],url];
    AFHTTPSessionManager *manger = [self setRequestManger];
    [manger GET:gzgUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",responseObject);
        
        success(responseObject,[self urlResponseErrorCode:task.response]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errors(error,[self urlResponseErrorCode:task.response]);
    }];
}
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
                     failure:(void(^)(NSError *failure,NSInteger  task))errors{
    
    NSString *gzgUrl = [NSString stringWithFormat:@"%@%@",[self mobileAPIBaseURL],url];
//    NSString *gzgUrl = [NSString stringWithFormat:@"http://192.168.0.110:8080/%@",url];

    AFHTTPSessionManager *manger = [self setRequestManger];
    [manger POST:gzgUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,[self urlResponseErrorCode:task.response]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errors(error,[self urlResponseErrorCode:task.response]);
    }];
}
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
                       failure:(void(^)(NSError *failure,NSInteger  task))errors{
    NSString *gzgUrl = [NSString stringWithFormat:@"%@%@",[self mobileAPIBaseURL],url];
    AFHTTPSessionManager *manger = [self setRequestManger];
    [manger DELETE:gzgUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,[self urlResponseErrorCode:task.response]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errors(error,[self urlResponseErrorCode:task.response]);
    }];
}
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
                    failure:(void(^)(NSError *failure,NSInteger  task))errors{
    AFHTTPSessionManager *manger = [self setRequestManger];
    NSString *gzgUrl = [NSString stringWithFormat:@"%@%@",[self mobileAPIBaseURL],url];
    [manger PUT:gzgUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,[self urlResponseErrorCode:task.response]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errors(error,[self urlResponseErrorCode:task.response]);
    }];
}
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
            failure:(void(^)(NSError *failure,NSInteger  task))errors{
    NSString *gzgUrl = [NSString stringWithFormat:@"%@%@",[self mobileAPIBaseURL],url];
    [ZGNetDealImage conversionImage:image data:^(NSData *imgData) {
        AFHTTPSessionManager *manger = [self setRequestManger];
        [manger POST:gzgUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:imgData name:@"file" fileName:@"test" mimeType:@"image/png"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject,[self urlResponseErrorCode:task.response]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            errors(error,[self urlResponseErrorCode:task.response]);
        }];
    }];
    
}
@end

