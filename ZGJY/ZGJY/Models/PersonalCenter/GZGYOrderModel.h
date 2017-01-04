//
//  GZGYOrderModel.h
//  ZGJY
//
//  Created by YYS on 2016/12/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZGYOrderModel : NSObject
@property(nonatomic, strong)NSString * sn;//订单号
@property(nonatomic, strong)NSString * creation_date;//日期
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * price;
@property(nonatomic, strong)NSString * ID;
@property(nonatomic, strong)NSString * thumbnail;//图片
@end
