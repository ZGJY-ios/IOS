//
//  GZGYSalaCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSalaCollectionViewCell.h"

@implementation GZGYSalaCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [UIImageView new];
        _imgView.frame = CGRectMake(0,[GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:240], [GZGApplicationTool control_height:198]);
        _imgView.image = [UIImage imageNamed:@"sy_hgpic1"];
        [self addSubview:_imgView];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:168], [GZGApplicationTool control_wide:240], [GZGApplicationTool control_height:30])];
        _nameLabel.alpha = 0.5;
        _nameLabel.backgroundColor = [UIColor blackColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [_imgView addSubview:_nameLabel];
        _priceLabel = [UILabel new];
        _priceLabel.frame = CGRectMake([GZGApplicationTool control_wide:5],[GZGApplicationTool control_height:220], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30]);
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.text = @"¥118";
        _priceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_priceLabel];
        _originalLabel = [[GZGYStrikeThroughLabel alloc] initWithFrame:CGRectZero];
        _originalLabel.frame = CGRectMake([GZGApplicationTool control_wide:92],[GZGApplicationTool control_height:230], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:20]);
        _originalLabel.strikeThroughEnabled = YES;
        _originalLabel.font = [UIFont systemFontOfSize:8];
        _originalLabel.text = @"¥150";
        [self addSubview:_originalLabel];
        _salesLabel = [UILabel new];
        _salesLabel.frame = CGRectMake([GZGApplicationTool control_wide:120],[GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:115], [GZGApplicationTool control_height:30]);
//        _salesLabel.backgroundColor = [UIColor blackColor];
        _salesLabel.text = @"月销售100";
        _salesLabel.font = [UIFont systemFontOfSize:10];
        _salesLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_salesLabel];
    }
    return self;
}
-(void)setModel:(GZGYRootLimitModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        
        [_imgView setHeader:urlString];
    });
    _salesLabel.text = [NSString stringWithFormat:@"月销售%@",self.model.month_sales];
    _priceLabel.text = [NSString stringWithFormat:@"%.2f",self.model.price];
    _originalLabel.text = [NSString stringWithFormat:@"%.2f",self.model.market_price];
    _nameLabel.text = [NSString stringWithFormat:@"%@",self.model.full_name];
}

@end
