//
//  GZGSearchListCell.h
//  ZGJY
//
//  Created by HX on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  搜索列表 Cell

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

-(UIColor*)mostColor;

@end

@interface GZGSearchListCell : UITableViewCell

@property (nonatomic, strong) UIImageView * commodityHotImageView; // 商品热门
@property (nonatomic, strong) UIImageView * commodityImageView; // 商品视图
@property (nonatomic, strong) UILabel * commodityNameLabel;  // 商品名称
@property (nonatomic, strong) UILabel * commodityIntroductionLabel; // 商品介绍
@property (nonatomic, strong) UILabel * commodityPriceLabel; // 商品价格
@property (nonatomic, strong) UILabel * commodityPreferentialLabel; // 商品优惠
@property (nonatomic, strong) NSMutableArray * commodityLabels; // 商品标签
@property (nonatomic, strong) UILabel * commodityReferencePriceLabel; // 商品参考价

- (void)setModel;

@end
