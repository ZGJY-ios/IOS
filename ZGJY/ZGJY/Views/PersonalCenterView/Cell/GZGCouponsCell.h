//
//  GZGCouponsCell.h
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  优惠券

#import <UIKit/UIKit.h>

@interface GZGCouponsCell : UITableViewCell
@property (nonatomic, strong) UIImageView * couponsImage;
@property (nonatomic, strong) UILabel * couponsLabel;
@property (nonatomic, strong) UILabel * couponsPriceLabel;
@property (nonatomic, strong) UILabel * couponsNameLabel;
@property (nonatomic, strong) UILabel * couponsPasswordLabel;
@property (nonatomic, strong) UILabel * couponsConditionsLabel; // 使用条件
@property (nonatomic, strong) UILabel * couponsTimeLabel;  // 时间
@property (nonatomic, strong) UILabel * couponsTimeLimitLabel; // 有效期
@end
