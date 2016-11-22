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
        [self addSubview:self.imgView];
        [self addSubview:self.priceLabel];
        [self addSubview:self.originalLabel];
        [self addSubview:self.salesLabel];
    }
    return self;
}
-(UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [UIImageView new];
        _imgView.frame = CGRectMake(0,[GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:240], [GZGApplicationTool control_height:240]);
        _imgView.image = [UIImage imageNamed:@"sy_hgpic1"];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:210], [GZGApplicationTool control_wide:240], [GZGApplicationTool control_height:30])];
        _nameLabel.alpha = 0.5;
        _nameLabel.backgroundColor = [UIColor blackColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [_imgView addSubview:self.nameLabel];
    }
    return _imgView;
}
-(UILabel *)priceLabel
{
    if (_priceLabel == nil) {
        _priceLabel = [UILabel new];
        _priceLabel.frame = CGRectMake([GZGApplicationTool control_wide:5],[GZGApplicationTool control_height:260], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30]);
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.text = @"¥118";
        _priceLabel.font = [UIFont systemFontOfSize:13];
    }
    return _priceLabel;
}
-(GZGYStrikeThroughLabel *)originalLabel
{
    if (_originalLabel == nil) {
        _originalLabel = [[GZGYStrikeThroughLabel alloc] initWithFrame:CGRectZero];
        _originalLabel.frame = CGRectMake([GZGApplicationTool control_wide:92],[GZGApplicationTool control_height:270], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:20]);
        _originalLabel.strikeThroughEnabled = YES;
        _originalLabel.font = [UIFont systemFontOfSize:8];
        _originalLabel.text = @"¥150";
    }
    return _originalLabel;
}
-(UILabel *)salesLabel
{
    if (_salesLabel == nil) {
        _salesLabel = [UILabel new];
        _salesLabel.frame = CGRectMake([GZGApplicationTool control_wide:120],[GZGApplicationTool control_height:265], [GZGApplicationTool control_wide:115], [GZGApplicationTool control_height:30]);
        _salesLabel.text = @"月销售100";
        _salesLabel.font = [UIFont systemFontOfSize:10];
        _salesLabel.textAlignment = NSTextAlignmentRight;

    }
    return _salesLabel;
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
