//
//  GZGYAddressTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYAddressTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel * nameLabel;//名字
@property(nonatomic, strong)UIImageView * certImg;//认证图标
@property(nonatomic, strong)UILabel * phoneLabel;//手机号
@property(nonatomic, strong)UIButton * choiceBtn;//选中
@property(nonatomic, strong)UILabel * addressLabel;//详细地址
@property(nonatomic, strong)UILabel * cardLabel;//身份证
@property(nonatomic, strong)UILabel * numberLabel;//身份证号
@end
