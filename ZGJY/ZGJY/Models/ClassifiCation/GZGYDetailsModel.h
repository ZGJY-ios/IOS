//
//  GZGYDetailsModel.h
//  ZGJY
//
//  Created by YYS on 2016/11/18.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZGYDetailsModel : NSObject
@property(nonatomic, strong)NSString * ID;
@property(nonatomic, strong)NSString * full_name;//商品名字
@property(nonatomic, strong)NSString * image;//图片
@property(nonatomic, strong)NSString * sn;//编号
@property(nonatomic, strong)NSString * price;//售价
@property(nonatomic, strong)NSString * market_price;//市场价
@property(nonatomic, strong)NSString * sales;//已售
@property(nonatomic, strong)NSString * point;//赠送积分
@property(nonatomic, strong)NSString * stock;//库存
@property(nonatomic, strong)NSString * month_sales;//月销量
@property(nonatomic, strong)NSString * hits;//点击数
@property(nonatomic, strong)NSString * qprice;//区间价格
@property(nonatomic, strong)NSString * qsum;//区间数量
@end
