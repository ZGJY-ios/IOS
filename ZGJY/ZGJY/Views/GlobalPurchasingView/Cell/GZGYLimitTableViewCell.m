//
//  GZGYLimitTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLimitTableViewCell.h"

@implementation GZGYLimitTableViewCell
@synthesize imgView,backView,givingLabel,integralLabel,monthLabel,salesLabel,whiteView,reasonLabel,nameLabel,priceLabel,marketPrice,berserkBtn;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], 0, [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:365])];
//        imgView.image = [UIImage imageNamed:@"sy_xspic3.jpg"];
        [self addSubview:imgView];
        backView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:100])];
        backView.alpha = 0.7;
        backView.backgroundColor = [UIColor colorWithRed:220/255.0 green:204/255.0 blue:158/255.0 alpha:1.0];
        [self addSubview:backView];
        reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:325], [GZGApplicationTool control_height:80])];
        reasonLabel.text = @"[推荐理由]美国B.toys儿童帐篷，宝宝玩躲猫猫最佳玩具";
        reasonLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        reasonLabel.numberOfLines = 0;
        reasonLabel.textColor = [UIColor blackColor];
        [backView addSubview:reasonLabel];
        whiteView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:385], 0, [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:265])];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:305], [GZGApplicationTool control_height:80])];
        nameLabel.numberOfLines = 2;
        nameLabel.text = @"印第安儿童帐篷宝宝室内户外过家家玩具出游出行游戏屋";
        nameLabel.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:32]];
        nameLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        [whiteView addSubview:nameLabel];
        
        givingLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:110], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:30])];
        givingLabel.text = @"赠送积分:";
        givingLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        givingLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
        [whiteView addSubview:givingLabel];
        integralLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:135], [GZGApplicationTool control_height:110], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
        integralLabel.text = @"768";
        integralLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        integralLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
        [whiteView addSubview:integralLabel];
        monthLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:150], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30])];
        monthLabel.text = @"月销量:";
        monthLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        monthLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
        [whiteView addSubview:monthLabel];
        salesLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:150], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
        salesLabel.text = @"123";
        salesLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        salesLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
        [whiteView addSubview:salesLabel];
        
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:200], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:40])];
        priceLabel.text = @"¥1180.00";
        priceLabel.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        priceLabel.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:40]];
        [whiteView addSubview:priceLabel];
        marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:205], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
        marketPrice.strikeThroughEnabled = YES;
        marketPrice.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        marketPrice.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:30]];
        marketPrice.text = @"¥240";
        [whiteView addSubview:marketPrice];
        berserkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        berserkBtn.frame = CGRectMake([GZGApplicationTool control_wide:385], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:100]);
        berserkBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        [berserkBtn setTitle:@"马上疯抢 >" forState:UIControlStateNormal];
        [self addSubview:berserkBtn];
    }
    return self;
}
-(void)setModel:(GZGYLimitModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        [imgView setHeader:urlString];
    });
    nameLabel.text = [NSString stringWithFormat:@"%@",self.model.name];
    integralLabel.text = [NSString stringWithFormat:@"%@",self.model.point];
    salesLabel.text = [NSString stringWithFormat:@"%@",self.model.month_sales];
    priceLabel.text = [NSString stringWithFormat:@"%.2f",self.model.price];
    marketPrice.text = [NSString stringWithFormat:@"%.2f",self.model.market_price];
//    reasonLabel.text = [NSString stringWithFormat:@"%@",self.model.last_updated_by];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
