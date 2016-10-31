//
//  GZGYProgressTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYProgressTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel * orderLabel;//服务号
@property(nonatomic, strong)UILabel * numberLabel;//服务号
@property(nonatomic, strong)UILabel * dateLabel;//状态
@property(nonatomic, strong)UILabel * lineLabel;//分割线
@property(nonatomic, strong)UILabel * promptLabel;//提示
@property(nonatomic, strong)UILabel * dividerLabel;//分割线
@property(nonatomic, strong)UIImageView * orderImg;//商品图片
@property(nonatomic, strong)UILabel * nameLabel;//商品名字
@property(nonatomic, strong)UILabel * priceLabel;//商品价格
@property(nonatomic, strong)UILabel * countLabel;//商品数量
@property(nonatomic, strong)UILabel * stateLabel;//申请时间
@property(nonatomic, strong)UILabel * timeLabel;//申请时间
@property(nonatomic, strong)UIButton * forgoodsBtn;//进度查询
@end
