//
//  GZGYListModel.h
//  ZGJY
//
//  Created by YYS on 2016/12/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZGYListModel : NSObject
@property(nonatomic, strong)NSString * image;//商品图片
//@property(nonatomic, strong)NSString * last_updated_by;//推荐理由
@property(nonatomic, strong)NSString * name;//商品名字
@property(nonatomic, strong)NSString * full_name;//商品名字
@property(nonatomic, assign)float  price;//销售价
@property(nonatomic, assign)float  market_price;//市场价
@property(nonatomic, strong)NSString * ID;//商品ID
@property(nonatomic, strong)NSString * logo;
@end
