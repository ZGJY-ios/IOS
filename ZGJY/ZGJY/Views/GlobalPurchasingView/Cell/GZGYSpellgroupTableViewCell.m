//
//  GZGYSpellgroupTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellgroupTableViewCell.h"

@implementation GZGYSpellgroupTableViewCell
@synthesize imgView,blackView,functionLabel,backView,startLabel,countLabel,AbulkLabel,whiteView,AMOSLabel,nameLabel,placeLabel,originLabel,priceLabel,marketLabel,marketPrice,panicLable,stripView,flowLabel,proportion,berserkBtn;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], 0, [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:265])];
        imgView.image = [UIImage imageNamed:@"sy_xspic3.jpg"];
        [self addSubview:imgView];
        blackView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:220], [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:45])];
        blackView.backgroundColor = [UIColor blackColor];
        blackView.alpha = 0.8;
        [self addSubview:blackView];
        functionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:45])];
        functionLabel.text = @"适合所有发质  重塑头发健康";
        functionLabel.textColor = [UIColor whiteColor];
        functionLabel.textAlignment = NSTextAlignmentCenter;
        functionLabel.font = [UIFont systemFontOfSize:13];
        [blackView addSubview:functionLabel];
        
        backView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:365], [GZGApplicationTool control_height:100])];
        backView.backgroundColor = [UIColor colorWithRed:220/255.0 green:204/255.0 blue:158/255.0 alpha:1.0];
        [self addSubview:backView];
        startLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:145], [GZGApplicationTool control_height:40])];
        startLabel.text = @"已售220件";
        startLabel.textColor = [UIColor whiteColor];
        startLabel.font = [UIFont systemFontOfSize:13];
        startLabel.backgroundColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1.0];
        startLabel.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:startLabel];
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:190], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:40])];
        countLabel.textAlignment = NSTextAlignmentCenter;
        countLabel.text = @"剩余780件";
        countLabel.font = [UIFont systemFontOfSize:13];
        countLabel.backgroundColor = [UIColor colorWithRed:147/255.0 green:142/255.0 blue:130/255.0 alpha:1.0];
        countLabel.textColor = [UIColor whiteColor];
        [backView addSubview:countLabel];
        AbulkLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:0], [GZGApplicationTool control_height:55], [GZGApplicationTool control_wide:375], [GZGApplicationTool control_height:40])];
        AbulkLabel.text = @"20件起享受团购价";
        AbulkLabel.font = [UIFont boldSystemFontOfSize:20];
        AbulkLabel.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:AbulkLabel];
        whiteView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:385], 0, [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:265])];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        AMOSLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:180], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:165], [GZGApplicationTool control_height:30])];
        AMOSLabel.text = @"AMOS";
        AMOSLabel.font = [UIFont boldSystemFontOfSize:16];
        [whiteView addSubview:AMOSLabel];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:275], [GZGApplicationTool control_height:80])];
        nameLabel.numberOfLines = 2;
        nameLabel.text = @"韩国至纯去屑发膜韩国至纯去屑发膜";
        nameLabel.font = [UIFont boldSystemFontOfSize:16];
        nameLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        [whiteView addSubview:nameLabel];
        placeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:130], [GZGApplicationTool control_wide:180], [GZGApplicationTool control_height:35])];
        placeLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        placeLabel.text = @"原产国(地区):";
        placeLabel.font = [UIFont boldSystemFontOfSize:14];
        [whiteView addSubview:placeLabel];
        originLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:130], [GZGApplicationTool control_wide:95], [GZGApplicationTool control_height:35])];
        originLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        originLabel.text = @"韩国";
        originLabel.font = [UIFont boldSystemFontOfSize:15];
        [whiteView addSubview:originLabel];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:170], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:40])];
        priceLabel.text = @"¥118";
        priceLabel.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        priceLabel.font = [UIFont boldSystemFontOfSize:20];
        [whiteView addSubview:priceLabel];
        marketLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:175], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35])];
        marketLabel.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        marketLabel.font = [UIFont boldSystemFontOfSize:14];
        marketLabel.text = @"市场价:";
        [whiteView addSubview:marketLabel];
        marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:175], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35])];
        marketPrice.strikeThroughEnabled = YES;
        marketPrice.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        marketPrice.font = [UIFont boldSystemFontOfSize:15];
        marketPrice.text = @"¥240";
        [whiteView addSubview:marketPrice];
        panicLable = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:15], [GZGApplicationTool control_height:220], [GZGApplicationTool control_wide:80], [GZGApplicationTool control_height:30])];
        panicLable.textColor = [UIColor colorWithRed:103/255.0 green:95/255.0 blue:95/255.0 alpha:1.0];
        panicLable.text = @"已抢购";
        panicLable.font = [UIFont systemFontOfSize:12];
        [whiteView addSubview:panicLable];
        stripView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:20])];
        stripView.layer.borderColor = [UIColor colorWithRed:253/255.0 green:129/255.0 blue:154/255.0 alpha:1.0].CGColor;
        stripView.layer.borderWidth = 1;
        [stripView.layer setMasksToBounds:YES];
        [whiteView addSubview:stripView];
        flowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, stripView.frame.size.width*0.62, stripView.frame.size.height)];
        flowLabel.backgroundColor = [UIColor colorWithRed:253/255.0 green:129/255.0 blue:154/255.0 alpha:1.0];
        [stripView addSubview:flowLabel];
        proportion = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:295], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20])];
        proportion.text = @"62%";
        proportion.font = [UIFont systemFontOfSize:12];
        proportion.textColor = [UIColor colorWithRed:253/255.0 green:129/255.0 blue:154/255.0 alpha:1.0];
        [whiteView addSubview:proportion];
        berserkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        berserkBtn.frame = CGRectMake([GZGApplicationTool control_wide:385], [GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:345], [GZGApplicationTool control_height:100]);
        berserkBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
        [berserkBtn setTitle:@"马上进货 >" forState:UIControlStateNormal];
        [self addSubview:berserkBtn];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
