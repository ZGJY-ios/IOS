//
//  GZGShoppingCartSettlementView.h
//  ZGJY
//
//  Created by HX on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  结算视图

#import <UIKit/UIKit.h>

@interface GZGShoppingCartSettlementView : UIView

@property (nonatomic, strong) UILabel * futureGenerationsTitle; // 全选
@property (nonatomic, strong) UIButton * futureGenerationsItem; // 全选
@property (nonatomic, strong) UILabel * combinedTitle; // 合计
@property (nonatomic, strong) UILabel * combinedPriceTitle; // 合计价格
@property (nonatomic, strong) UILabel * freightTitle; // 运费
@property (nonatomic, strong) UILabel * freightPriceTitle; // 运费价格
@property (nonatomic, strong) UIButton * settlementItem; // 结算

- (instancetype)initWithOriginY:(CGFloat)originY Height:(CGFloat)height;

@property (nonatomic, copy) void(^buttonClick)(UIButton * button);

@end
