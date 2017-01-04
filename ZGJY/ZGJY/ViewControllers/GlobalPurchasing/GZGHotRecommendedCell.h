//
//  GZGHotRecommendedCell.h
//  ZGJY
//
//  Created by HX on 16/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  热门推荐Cell

#import <UIKit/UIKit.h>

@interface GZGHotRecommendedCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView * imageView; // 图片
@property (nonatomic, strong) UILabel * commodityNameLabel; // 名称
@property (nonatomic, strong) UILabel * commodityNowPriceLabel; // 商品现价格
@property (nonatomic, strong) UILabel * commodityOriginalPriceLabel; // 商品原价格
@property (nonatomic, strong) UIButton * cartItem; // 购物车

@end
