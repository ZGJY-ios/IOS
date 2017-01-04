//
//  GZGYOrderTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYOrderTableViewCell.h"

@implementation GZGYOrderTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.orderLabel];
        [self addSubview:self.numberLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.orderImg];
        [self addSubview:self.nameLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.stateLabel];
        [self addSubview:self.dividerLabel];
        [self addSubview:self.deleteBtn];
        [self addSubview:self.additionalBtn];
        [self addSubview:self.againBtn];
    }
    return self;
}
-(UILabel *)orderLabel
{
    _orderLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
    _orderLabel.text = @"订单号:";
    return _orderLabel;
}
-(UILabel *)numberLabel
{
    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:35])];
    _numberLabel.text = @"12323123123";
    return _numberLabel;
}
-(UILabel *)dateLabel
{
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-[GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
    _dateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
    _dateLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    _dateLabel.text = @"2016-10-11";
    return _dateLabel;
}
-(UILabel *)lineLabel
{
    _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:90], SCREENWIDTH, 1)];
    _lineLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    return _lineLabel;
}
-(UIImageView *)orderImg
{
    _orderImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:125])];
    _orderImg.image = [UIImage imageNamed:@"sy_kjpic1.jpg"];
    _orderImg.layer.cornerRadius = 4;
    _orderImg.layer.borderColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
    _orderImg.layer.borderWidth = 1;
    [_orderImg.layer setMasksToBounds:YES];
    return _orderImg;
}
-(UILabel *)nameLabel
{
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:560], [GZGApplicationTool control_height:35])];
    _nameLabel.text = @"澳洲进口 体内平衡益生菌";
    return _nameLabel;
}
-(UILabel *)priceLabel
{
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:35])];
    _priceLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
    _priceLabel.text = @"¥120.00";
    return _priceLabel;
}
-(UILabel *)countLabel
{
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:315], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:35])];
    _countLabel.text = @"×1";
    return _countLabel;
}
-(UILabel *)stateLabel
{
    _stateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35])];
    _stateLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
    _stateLabel.text = @"交易已完成";
    return _stateLabel;
}
-(UILabel *)dividerLabel
{
    _dividerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:295], SCREENWIDTH, 1)];
    _dividerLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    return _dividerLabel;
}
-(UIButton *)deleteBtn
{
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake([GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
    _deleteBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
    [_deleteBtn setTitle:@"删除订单" forState:UIControlStateNormal];
    _deleteBtn.layer.cornerRadius = 5;
    _deleteBtn.layer.borderColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0].CGColor;
    _deleteBtn.layer.borderWidth = 1;
    [_deleteBtn.layer setMasksToBounds:YES];
    return _deleteBtn;
}
-(UIButton *)additionalBtn
{
    _additionalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _additionalBtn.frame = CGRectMake([GZGApplicationTool control_wide:275], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
    _additionalBtn.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [_additionalBtn setTitle:@"追加评价" forState:UIControlStateNormal];
    [_additionalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _additionalBtn.layer.cornerRadius = 5;
    _additionalBtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
    _additionalBtn.layer.borderWidth = 1;
    [_additionalBtn.layer setMasksToBounds:YES];
    return _additionalBtn;
}
-(UIButton *)againBtn
{
    _againBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _againBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
    _againBtn.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [_againBtn setTitle:@"再次购买" forState:UIControlStateNormal];
    [_againBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _againBtn.layer.cornerRadius = 5;
    _againBtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
    _againBtn.layer.borderWidth = 1;
    [_againBtn.layer setMasksToBounds:YES];
    return _againBtn;
}
-(void)setModel:(GZGYOrderModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.thumbnail stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        
        [_orderImg setHeader:urlString];
    });
    _numberLabel.text = [NSString stringWithFormat:@"%@",_model.sn];
    _dateLabel.text = [NSString stringWithFormat:@"%@",_model.creation_date];
    _nameLabel.text = [NSString stringWithFormat:@"%@",_model.name];
    _priceLabel.text = [NSString stringWithFormat:@"%@",_model.price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
