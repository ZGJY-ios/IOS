//
//  GZGYSpellTableViewCell.h
//  ZGJY
//
//  Created by YYS on 2016/11/17.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYStrikeThroughLabel.h"
#import "GZGYRootSpellModel.h"
@interface GZGYSpellTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * imgView;//商品图片
@property(nonatomic, strong)UILabel * nameLabel;//商品名字
@property(nonatomic, strong)UILabel * reasonLabel;//推荐理由
@property(nonatomic, strong)UILabel * priceLabel;//价格
@property(nonatomic, strong)UILabel * pricenumber;//价格
@property(nonatomic, strong)UILabel * marketLabel;//市场价
@property(nonatomic, strong)GZGYStrikeThroughLabel * marketPrice;//市场价
@property(nonatomic, strong)UIButton * replenishBtn;//进货
@property(nonatomic, strong)UILabel * lineLabel;//分割线
@property (nonatomic, strong)GZGYRootSpellModel * model;
@end
