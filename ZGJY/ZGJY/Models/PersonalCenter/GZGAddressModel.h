//
//  GZGAddressModel.h
//  ZGJY
//
//  Created by HX on 2016/12/5.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "JSONModel.h"

@interface GZGAddressModel : JSONModel
@property (nonatomic, copy) NSString * address; // 收货地址
@property (nonatomic, copy) NSString * consignee; // 姓名
@property (nonatomic, copy) NSString * creation_date; // 创建时间
@property (nonatomic, assign) NSInteger delete_flag;
@property (nonatomic, copy) NSString * ids;
@property (nonatomic, copy) NSString * is_default; // 是否默认
@property (nonatomic, copy) NSString * member_id; // 会员ID
@property (nonatomic, copy) NSString * phone; // 电话号码
@property (nonatomic, copy) NSString * zip_code; // 邮政编码
+ (instancetype)specialPerformanceWithDict:(NSDictionary *)dict;

@end
