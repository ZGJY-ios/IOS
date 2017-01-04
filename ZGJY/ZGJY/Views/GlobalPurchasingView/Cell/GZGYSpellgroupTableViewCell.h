//
//  GZGYSpellgroupTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYStrikeThroughLabel.h"
#import "GZGYSpellModel.h"
@interface GZGYSpellgroupTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * imgView;//商品图片
@property(nonatomic, strong)UIView * backView;//背景view
@property(nonatomic, strong)UILabel * reasonLabel;//推荐理由
@property(nonatomic, strong)UIView * whiteView;//背景View
@property(nonatomic, strong)UILabel * nameLabel;//商品名
@property(nonatomic, strong)UILabel * priceLabel;//价格
@property(nonatomic, strong)UILabel * pricenumber;//价格
@property(nonatomic, strong)UILabel * marketLabel;//市场价
@property(nonatomic, strong)GZGYStrikeThroughLabel * marketPrice;//市场价
@property(nonatomic, strong)UIButton * berserkBtn;//马上进货
@property (nonatomic, strong)GZGYSpellModel * model;
@end
