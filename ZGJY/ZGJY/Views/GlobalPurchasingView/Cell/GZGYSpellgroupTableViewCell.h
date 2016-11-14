//
//  GZGYSpellgroupTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYStrikeThroughLabel.h"
@interface GZGYSpellgroupTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * imgView;//商品图片
@property(nonatomic, strong)UIView * blackView;//黑色view
@property(nonatomic, strong)UILabel * functionLabel;//功能
@property(nonatomic, strong)UIView * backView;//背景view
@property(nonatomic, strong)UILabel * startLabel;//已售
@property(nonatomic, strong)UILabel * countLabel;//剩余
@property(nonatomic, strong)UILabel * AbulkLabel;//团购价
@property(nonatomic, strong)UIView * whiteView;//背景View
@property(nonatomic, strong)UILabel * AMOSLabel;//品牌
@property(nonatomic, strong)UILabel * nameLabel;//商品名
@property(nonatomic, strong)UILabel * placeLabel;//产地
@property(nonatomic, strong)UILabel * originLabel;//产地
@property(nonatomic, strong)UILabel * priceLabel;//价格
@property(nonatomic, strong)UILabel * marketLabel;//市场价
@property(nonatomic, strong)GZGYStrikeThroughLabel * marketPrice;//市场价
@property(nonatomic, strong)UILabel * panicLable;//已抢购
@property(nonatomic, strong)UIView * stripView;//背景
@property(nonatomic, strong)UILabel * flowLabel;//已抢购
@property(nonatomic, strong)UILabel * proportion;//比例
@property(nonatomic, strong)UIButton * berserkBtn;//马上进货
@end
