//
//  GZGYOrderTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYOrderTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel * orderLabel;//订单号
@property(nonatomic, strong)UILabel * numberLabel;//订单号
@property(nonatomic, strong)UILabel * dateLabel;//日期
@property(nonatomic, strong)UILabel * lineLabel;//分割线
@property(nonatomic, strong)UIImageView * orderImg;//商品图片
@property(nonatomic, strong)UILabel * nameLabel;//商品名字
@property(nonatomic, strong)UILabel * priceLabel;//商品价格
@property(nonatomic, strong)UILabel * countLabel;//商品数量
@property(nonatomic, strong)UILabel * stateLabel;//交易状态
@property(nonatomic, strong)UILabel * dividerLabel;//分割线
@property(nonatomic, strong)UIButton * deleteBtn;//删除订单
@property(nonatomic, strong)UIButton * additionalBtn;//追加评价
@property(nonatomic, strong)UIButton * againBtn;//再次购买
@end
