//
//  GZGYEvaluationTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYEvaluationTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView * iconView;//头像
@property(nonatomic, strong)UILabel * nameLabel;//名字
@property(nonatomic, strong)UILabel * addressLabel;//地点
@property(nonatomic, strong)UILabel * dateLabel;//日期
@property(nonatomic, strong)UILabel * timeLabel;//时间
@property(nonatomic, strong)UILabel * lineLabel;//分割线
@property(nonatomic, strong)UIImageView * starView;//评价
@property(nonatomic, strong)UILabel * contentLabel;//内容
@property(nonatomic, strong)UIButton * praiseBtn;//赞
@property(nonatomic, strong)UILabel * numberLabel;//点赞数
@property(nonatomic, strong)UIButton * commentsBtn;//评论
@property(nonatomic, strong)UILabel * comnumberLabel;//评论数
@end
