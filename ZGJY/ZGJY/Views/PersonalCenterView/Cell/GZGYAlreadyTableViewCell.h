//
//  GZGYAlreadyTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYAlreadyTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * orderImg;//商品图片
@property(nonatomic, strong)UILabel * nameLabel;//商品名字
@property(nonatomic, strong)UILabel * priceLabel;//商品价格
@property(nonatomic, strong)UILabel * countLabel;//商品数量
@property(nonatomic, strong)UILabel * stateLabel;//交易状态
@property(nonatomic, strong)UIButton * evaluationBtn;//追加评论
@end
