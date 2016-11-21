//
//  GZGYLimitTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYSettimeView.h"
#import "GZGYStrikeThroughLabel.h"
#import "GZGYLimitModel.h"
@interface GZGYLimitTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * imgView;//商品图片
@property(nonatomic, strong)UIView * backView;//背景view
@property(nonatomic, strong)UILabel * givingLabel;//赠送
@property(nonatomic, strong)UILabel * integralLabel;//赠送
@property(nonatomic, strong)UILabel * monthLabel;//月销量
@property(nonatomic, strong)UILabel * salesLabel;//月销量
@property(nonatomic, strong)UIView * whiteView;
@property(nonatomic, strong)UILabel * reasonLabel;//推荐理由
@property(nonatomic, strong)UILabel * nameLabel;//商品名
@property(nonatomic, strong)UILabel * priceLabel;//价格
@property(nonatomic, strong)GZGYStrikeThroughLabel * marketPrice;//市场价
@property(nonatomic, strong)UIButton * berserkBtn;//马上疯抢
@property (nonatomic, strong)GZGYLimitModel * model;
@end
