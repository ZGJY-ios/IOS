//
//  GZGShoppingCartCell.h
//  ZGJY
//
//  Created by HX on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  购物车 Cell

#import <UIKit/UIKit.h>

@interface GZGShoppingCartCell : UITableViewCell

@property (nonatomic, strong) UIButton * cartRedio; // 商品选中状态
@property (nonatomic, strong) UIImageView * cartImage; // 图片
@property (nonatomic, strong) UILabel * cartPrice; // 价格
@property (nonatomic, strong) UILabel * cartTitle; // 商品名称
@property (nonatomic, strong) UIButton * cartAdd; // 商品个数添加
@property (nonatomic, strong) UITextField * cartNumber; // 商品数量
@property (nonatomic, strong) UIButton * cartSub; // 商品个数减少
@property (nonatomic, strong) UIImageView * cartPhone; // 手机
@property (nonatomic, strong) UIImageView * cartExclusive; // 专享

@property (nonatomic, copy) void(^buttonClick)(UIButton * button);

@end
