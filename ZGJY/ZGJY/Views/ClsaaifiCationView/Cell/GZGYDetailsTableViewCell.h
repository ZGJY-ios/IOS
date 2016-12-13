//
//  GZGYDetailsTableViewCell.h
//  ZGJY
//
//  Created by YYS on 2016/12/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYImgScrollView.h"
#import "GZGYStrikeThroughLabel.h"
#import "GZGYDetailsModel.h"
@interface GZGYDetailsTableViewCell : UITableViewCell<UIScrollViewDelegate,ImgDelegeteClickProtocol>
@property(nonatomic, strong)GZGYImgScrollView * goodsImgScro;
@property(nonatomic, strong)UIView * backView;
@property(nonatomic, strong)UIView * findView;
@property(nonatomic, strong)UILabel * priceLabel;
@property(nonatomic, strong)GZGYStrikeThroughLabel * marketPrice;
@property(nonatomic, strong)UILabel * soldLabel;//已售
@property(nonatomic, strong)UILabel * speciesLabel;//品牌
@property(nonatomic, strong)UILabel * nameLabel;
@property(nonatomic, strong)UILabel * lineLabel;
@property(nonatomic, strong)UILabel * inventoryLabel;//库存
@property(nonatomic, strong)UILabel * monthLabel;//月销量
@property(nonatomic, strong)UILabel * clickLabel;//点击数
@property(nonatomic, strong)UILabel * dividerLabel;
@property(nonatomic, strong)UILabel * givingLabel;//赠送
@property(nonatomic, strong)UILabel * integralLabel;//积分
@property(nonatomic, strong)UILabel * lineSecond;
@property(nonatomic, strong)GZGYDetailsModel * model;
@end
