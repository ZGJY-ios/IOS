//
//  GZGYSpellTableViewCell.m
//  ZGJY
//
//  Created by YYS on 2016/11/17.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellTableViewCell.h"

@implementation GZGYSpellTableViewCell
@synthesize imgView,nameLabel,reasonLabel,priceLabel,pricenumber,marketPrice,marketLabel,replenishBtn,lineLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:220])];
        imgView.image = [UIImage imageNamed:@"gzg_gg3"];
        [self addSubview:imgView];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:25], SCREENWIDTH - [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:25])];
        nameLabel.text = @"美国Skip Hop儿童动物卡通书包";
        nameLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:nameLabel];
        reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:70], SCREENWIDTH - [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:60])];
        reasonLabel.text = @"[推荐理由]Skip Hop儿童动物书包----送给孩子好的礼物";
        reasonLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        reasonLabel.font = [UIFont systemFontOfSize:12];
        reasonLabel.numberOfLines = 0;
        [self addSubview:reasonLabel];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:145], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30])];
        priceLabel.text = @"拼团价:";
        priceLabel.font = [UIFont systemFontOfSize:14];
        priceLabel.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        [self addSubview:priceLabel];
        pricenumber = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:380], [GZGApplicationTool control_height:145], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
        pricenumber.text = @"¥249.00";
        pricenumber.font = [UIFont systemFontOfSize:14];
        pricenumber.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        [self addSubview:pricenumber];
        marketLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:195], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30])];
        marketLabel.text = @"市场价:";
        marketLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        marketLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:marketLabel];
        marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:380], [GZGApplicationTool control_height:195], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
        marketPrice.text = @"¥223.00";
        marketPrice.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
        marketPrice.font = [UIFont systemFontOfSize:12];
        [self addSubview:marketPrice];
        replenishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        replenishBtn.frame = CGRectMake(SCREENWIDTH - [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:190], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:40]);
        replenishBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        replenishBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [replenishBtn setTitle:@"马上进货>" forState:UIControlStateNormal];
        [self addSubview:replenishBtn];
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:258], SCREENWIDTH-[GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:2])];
        lineLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:lineLabel];
    }
    return self;
}
-(void)setModel:(GZGYRootSpellModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        [imgView setHeader:urlString];
    });
    nameLabel.text = [NSString stringWithFormat:@"%@",self.model.full_name];
    pricenumber.text = [NSString stringWithFormat:@"%.2f",self.model.price];
    marketPrice.text = [NSString stringWithFormat:@"%.2f",self.model.market_price];
    //    reasonLabel.text = [NSString stringWithFormat:@"%@",self.model.last_updated_by];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
