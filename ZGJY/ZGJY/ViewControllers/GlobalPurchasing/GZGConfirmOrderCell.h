//
//  GZGConfirmOrderCell.h
//  ZGJY
//
//  Created by HX on 16/10/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  确认订单

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

-(UIColor*)mostColor;

@end

// 收货信息
@interface GZGReceivingInformationCell : UITableViewCell

@property (nonatomic, strong) UILabel * userNameLabel; // 用户名
@property (nonatomic, strong) UILabel * userAddressLabel; // 用户地址
@property (nonatomic, strong) UILabel * userPhoneLabel; // 用户手机
@property (nonatomic, strong) UILabel * userCertificationLabel; // 用户认证
@property (nonatomic, strong) UILabel * userIdCardLabel; // 用户身份证

@end

// 发货订单
@interface GZGDeliveryOrderCell : UITableViewCell

@property (nonatomic, strong) UIImageView * commodityImageView; // 商品图片
@property (nonatomic, strong) UILabel * commodityNameLabel; // 商品名字
@property (nonatomic, strong) UILabel * commodityPriceLabel; // 商品价格
@property (nonatomic, strong) UILabel * commodityNumberLabel; // 商品数量
@property (nonatomic, strong) UILabel * commodityRateLabel; // 商品税率
@property (nonatomic, strong) NSMutableArray * commodityLabels; // 商品标签

- (void)setModel;

@end

// 商品合计
@interface GZGCommodityTogetherCell : UITableViewCell

@property (nonatomic, strong) UILabel * commodityTogetherLabel; // 商品合计
@property (nonatomic, strong) UILabel * commodityTotalPriceLabel; // 商品总价
@property (nonatomic, strong) UILabel * preferentialActivitiesLabel; // 活动优惠
@property (nonatomic, strong) UILabel * freightLabel; // 运费
@property (nonatomic, strong) UILabel * taxesAndFeesLabel; // 税费
@property (nonatomic, strong) UILabel * totalPriceLabel; // 总价

@property (nonatomic, strong) UILabel * commodityTogetherNumber; // 商品合计
@property (nonatomic, strong) UILabel * commodityTotalPriceNumber; // 商品总价
@property (nonatomic, strong) UILabel * preferentialActivitiesNumber; // 活动优惠
@property (nonatomic, strong) UILabel * freightNumber; // 运费
@property (nonatomic, strong) UILabel * taxesAndFeesNumber; // 税费
@property (nonatomic, strong) UILabel * totalPriceNumber; // 总金额

@property (nonatomic, strong) UIButton * submitOrdersItem; // 提交订单

- (void)setModel;

@property (nonatomic, copy) void(^submitOrderBlock)(NSString * amount);

@end
