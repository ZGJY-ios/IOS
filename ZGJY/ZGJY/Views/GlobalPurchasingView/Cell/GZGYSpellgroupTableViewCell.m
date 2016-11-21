//
//  GZGYSpellgroupTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellgroupTableViewCell.h"

@implementation GZGYSpellgroupTableViewCell
@synthesize imgView,backView,reasonLabel,whiteView,nameLabel,priceLabel,pricenumber,marketLabel,marketPrice,berserkBtn;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], 0, [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:265])];
        imgView.image = [UIImage imageNamed:@"sy_xspic3.jpg"];
        [self addSubview:imgView];
        backView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:100])];
        backView.backgroundColor = [UIColor colorWithRed:220/255.0 green:204/255.0 blue:158/255.0 alpha:1.0];
        [self addSubview:backView];
        reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:325], [GZGApplicationTool control_height:80])];
        reasonLabel.text = @"[推荐理由]美国B.toys儿童帐篷，宝宝玩躲猫猫最佳玩具";
        reasonLabel.font = [UIFont systemFontOfSize:14];
        reasonLabel.numberOfLines = 0;
        reasonLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        [backView addSubview:reasonLabel];
        whiteView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:385], 0, [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:265])];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:305], [GZGApplicationTool control_height:80])];
        nameLabel.numberOfLines = 2;
        nameLabel.text = @"印第安儿童帐篷宝宝室内户外过家家玩具出游出行游戏屋";
        nameLabel.font = [UIFont boldSystemFontOfSize:16];
        nameLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        [whiteView addSubview:nameLabel];
        
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:130], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
        priceLabel.text = @"拼团价:";
        priceLabel.textColor = [UIColor colorWithRed:252/255.0 green:14/255.0 blue:59/255.0 alpha:1.0];
        priceLabel.font = [UIFont systemFontOfSize:20];
        [whiteView addSubview:priceLabel];
        pricenumber = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:130], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
        pricenumber.text = @"¥768.00";
        pricenumber.textColor = [UIColor colorWithRed:252/255.0 green:14/255.0 blue:59/255.0 alpha:1.0];
        pricenumber.font = [UIFont systemFontOfSize:20];
        [whiteView addSubview:pricenumber];
        marketLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:190], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
        marketLabel.text = @"市场价:";
        marketLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        marketLabel.font = [UIFont systemFontOfSize:15];
        [whiteView addSubview:marketLabel];
        marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:190], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
        marketPrice.text = @"¥123.00";
        marketPrice.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        marketPrice.font = [UIFont systemFontOfSize:15];
        [whiteView addSubview:marketPrice];
        
        berserkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        berserkBtn.frame = CGRectMake([GZGApplicationTool control_wide:385], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:100]);
        berserkBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        [berserkBtn setTitle:@"马上疯抢 >" forState:UIControlStateNormal];
        [self addSubview:berserkBtn];
    }
    return self;
}
-(void)setModel:(GZGYSpellModel *)model
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
