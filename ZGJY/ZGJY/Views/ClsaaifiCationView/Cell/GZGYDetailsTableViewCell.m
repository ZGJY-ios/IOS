//
//  GZGYDetailsTableViewCell.m
//  ZGJY
//
//  Created by YYS on 2016/12/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsTableViewCell.h"

@implementation GZGYDetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.backView];
        [self addSubview:self.findView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.inventoryLabel];
        [self addSubview:self.monthLabel];
        [self addSubview:self.clickLabel];
        [self addSubview:self.dividerLabel];
        [self addSubview:self.givingLabel];
        [self addSubview:self.integralLabel];
        [self addSubview:self.lineSecond];
    }
    return self;
}
-(UIView *)backView
{
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:100])];
    _backView.backgroundColor = [UIColor colorWithRed:246/255.0 green:78/255.0 blue:81/255.0 alpha:1.0];
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:40])];
    _priceLabel.text = @"¥2380";
    _priceLabel.textColor = [UIColor whiteColor];
    _priceLabel.font = [UIFont systemFontOfSize:25];
    [_backView addSubview:_priceLabel];
    _marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:30])];
    _marketPrice.text = @"市场价¥3999";
    _marketPrice.textColor = [UIColor whiteColor];
    _marketPrice.font = [UIFont systemFontOfSize:14];
    [_backView addSubview:_marketPrice];
    _soldLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:30])];
    _soldLabel.text = @"已售2345";
    _soldLabel.textColor = [UIColor whiteColor];
    _soldLabel.font = [UIFont systemFontOfSize:14];
    [_backView addSubview:_soldLabel];
    return _backView;
}
-(UIView *)findView
{
    _findView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:100])];
    _findView.backgroundColor = [UIColor colorWithRed:220/255.0 green:204/255.0 blue:158/255.0 alpha:1.0];
    _speciesLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:210], [GZGApplicationTool control_height:40])];
    _speciesLabel.textColor = [UIColor colorWithRed:246/255.0 green:78/255.0 blue:81/255.0 alpha:1.0];
    _speciesLabel.textAlignment = NSTextAlignmentCenter;
    _speciesLabel.text = @"限时特卖";
    [_findView addSubview:_speciesLabel];
    return _findView;
}
-(UILabel *)nameLabel
{
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:120], [GZGApplicationTool control_wide:710], [GZGApplicationTool control_height:80])];
    _nameLabel.text = @"啊实打实的发顺丰的暗室逢灯阿发发发发阿发阿发发水电费水电费是双方都是";
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.numberOfLines = 0;
    return _nameLabel;
}
-(UILabel *)lineLabel
{
    _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:220], [GZGApplicationTool control_wide:710], [GZGApplicationTool control_height:1])];
    _lineLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    return _lineLabel;
}
-(UILabel *)inventoryLabel
{
    _inventoryLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:230], [GZGApplicationTool control_wide:210], [GZGApplicationTool control_height:30])];
    _inventoryLabel.text = @"库存 2345";
    _inventoryLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    _inventoryLabel.font = [UIFont systemFontOfSize:14];
    return _inventoryLabel;
}
-(UILabel *)monthLabel
{
    _monthLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:270], [GZGApplicationTool control_height:230], [GZGApplicationTool control_wide:210], [GZGApplicationTool control_height:30])];
    _monthLabel.text = @"月销量 1234";
    _monthLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    _monthLabel.textAlignment = NSTextAlignmentCenter;
    _monthLabel.font = [UIFont systemFontOfSize:14];
    return _monthLabel;
}
-(UILabel *)clickLabel
{
    _clickLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:520], [GZGApplicationTool control_height:230], [GZGApplicationTool control_wide:210], [GZGApplicationTool control_height:30])];
    _clickLabel.text = @"点击数 1234";
    _clickLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    _clickLabel.textAlignment = NSTextAlignmentRight;
    _clickLabel.font = [UIFont systemFontOfSize:14];
    return _clickLabel;
}
-(UILabel *)dividerLabel
{
    _dividerLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:0], [GZGApplicationTool control_height:270], [GZGApplicationTool control_wide:750], [GZGApplicationTool control_height:1])];
    _dividerLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    return _dividerLabel;
}
-(UILabel *)givingLabel
{
    _givingLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:290], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:30])];
    _givingLabel.text = @"赠积分";
    _givingLabel.font = [UIFont systemFontOfSize:15];
    return _givingLabel;
}
-(UILabel *)integralLabel
{
    _integralLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:290], [GZGApplicationTool control_wide:230], [GZGApplicationTool control_height:30])];
    _integralLabel.text = @"1231积分";
    _integralLabel.font = [UIFont systemFontOfSize:15];
    _integralLabel.textAlignment = NSTextAlignmentRight;
    return _integralLabel;
}
-(UILabel *)lineSecond
{
    _lineSecond = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:350], [GZGApplicationTool control_wide:710], [GZGApplicationTool control_height:1])];
    _lineSecond.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    return _lineSecond;
}
-(void)setModel:(GZGYDetailsModel *)model
{
    _model = model;
    NSLog(@"%@",self.model.price);
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",self.model.price];
    _marketPrice.text = [NSString stringWithFormat:@"市场价 ¥%@",self.model.market_price];
    _soldLabel.text = [NSString stringWithFormat:@"已售 %@",self.model.sales];
    _nameLabel.text = [NSString stringWithFormat:@"%@",self.model.full_name];
    _inventoryLabel.text = [NSString stringWithFormat:@"库存 %@",self.model.stock];
    _monthLabel.text = [NSString stringWithFormat:@"月销量%@",self.model.month_sales];
    _clickLabel.text = [NSString stringWithFormat:@"点击数%@",self.model.hits];
    _integralLabel.text = [NSString stringWithFormat:@"%@积分",self.model.point];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
