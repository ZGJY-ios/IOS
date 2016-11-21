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
@property(nonatomic, strong)NSString * point;//赠送积分
@end
