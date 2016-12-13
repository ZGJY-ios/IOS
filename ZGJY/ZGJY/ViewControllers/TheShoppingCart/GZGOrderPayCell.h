//
//  GZGOrderPayCell.h
//  ZGJY
//
//  Created by HX on 16/10/31.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
// 订单支付Cell

#import <UIKit/UIKit.h>

@interface GZGOrderPayCell : UITableViewCell

@property (nonatomic, strong) UIImageView * payIconImageView;
@property (nonatomic, strong) UILabel * payNameLabel;
@property (nonatomic, strong) UIButton * payCheckItem;
@property (nonatomic, copy) void(^returnPay)(UIButton * btn);

@end

@interface GZGOrderNumberCell : UITableViewCell

@property (nonatomic, strong) UIImageView * checkImageView;
@property (nonatomic, strong) UILabel * orderNumberLabel; // 订单号
@property (nonatomic, strong) UILabel * orderTimeLabel; // 订单时间
@property (nonatomic, strong) UILabel * payAmountLabel; // 支付金额
@property (nonatomic, strong) UILabel * payRemindersLabel; // 支付提示

/**
 *  给字体添加不同的颜色
 */
- (NSMutableAttributedString *)attributedStringWithStringColorWithString:(NSString *)string textColor:(UIColor *)textColor numberColor:(UIColor *)numberColor;

@end
