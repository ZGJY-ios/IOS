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
@interface GZGYSalaCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UILabel*TimeLabel;//剩余时间

@property(nonatomic, strong)GZGYCountdown*countdown;//倒计时

@property(nonatomic, strong)UIImageView*imgView;//商品图片

@property(nonatomic, strong)UILabel*priceLabel;//商品价格

@property(nonatomic, strong)GZGYStrikeThroughLabel*originalLabel;//原价

@property(nonatomic, strong)UILabel*amqcLabel;//AMQC

@property(nonatomic, strong)UILabel*brandLabel;//品牌

@end
