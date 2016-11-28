//
//  GZGYSalaCollectionViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYCountdown.h"
#import "GZGYStrikeThroughLabel.h"
#import "GZGYRootLimitModel.h"
@interface GZGYSalaCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)UIImageView * imgView;//商品图片

@property(nonatomic, strong)UILabel * priceLabel;//商品价格

@property(nonatomic, strong)GZGYStrikeThroughLabel * originalLabel;//原价

@property(nonatomic, strong)UILabel * nameLabel;//商品名字

@property (nonatomic, strong)GZGYRootLimitModel * model;

@end
