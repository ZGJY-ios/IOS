//
//  GZGYSpellTableViewCell.m
//  ZGJY
//
//  Created by YYS on 2016/11/17.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellTableViewCell.h"

@implementation GZGYSpellTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.imgView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.reasonLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.pricenumber];
        [self addSubview:self.marketLabel];
        [self addSubview:self.marketPrice];
        [self addSubview:self.replenishBtn];
        [self addSubview:self.lineLabel];
    }
    return self;
}
-(UIImageView *)imgView{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:220])];
    //    _imgView.image = [UIImage imageNamed:@"gzg_gg3"];
    return _imgView;
}
-(UILabel *)nameLabel
{
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:25], SCREENWIDTH - [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:25])];
    //    _nameLabel.text = @"美国Skip Hop儿童动物卡通书包";
    _nameLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    return _nameLabel;
}
-(UILabel *)reasonLabel
{
    _reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:70], SCREENWIDTH - [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:60])];
    _reasonLabel.text = @"[推荐理由]Skip Hop儿童动物书包----送给孩子好的礼物";
    _reasonLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    _reasonLabel.font = [UIFont systemFontOfSize:12];
    _reasonLabel.numberOfLines = 0;
    return _reasonLabel;
}
-(UILabel *)priceLabel
{
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:145], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
    _priceLabel.text = @"拼团价:";
    _priceLabel.font = [UIFont systemFontOfSize:14];
    _priceLabel.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
    return _priceLabel;
}
//-(UILabel *)pricenumber
//{
//    _pricenumber = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:380], [GZGApplicationTool control_height:145], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
//    //    _pricenumber.text = @"¥249.00";
//    _pricenumber.font = [UIFont systemFontOfSize:14];
//    _pricenumber.textColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
//    return _priceLabel;
//}
-(UILabel *)marketLabel
{
    _marketLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:195], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30])];
    _marketLabel.text = @"市场价:";
    _marketLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    _marketLabel.font = [UIFont systemFontOfSize:12];
    return _marketLabel;
}
-(GZGYStrikeThroughLabel *)marketPrice
{
    _marketPrice = [[GZGYStrikeThroughLabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:380], [GZGApplicationTool control_height:195], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
        _marketPrice.text = @"¥223.00";
    _marketPrice.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    _marketPrice.font = [UIFont systemFontOfSize:12];
    return _marketPrice;
}
-(UIButton *)replenishBtn
{
    _replenishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _replenishBtn.frame = CGRectMake(SCREENWIDTH - [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:190], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:40]);
    _replenishBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:16/255.0 blue:59/255.0 alpha:1.0];
    _replenishBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_replenishBtn setTitle:@"马上进货>" forState:UIControlStateNormal];
    return _replenishBtn;
}
-(UILabel *)lineLabel
{
    _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:258], SCREENWIDTH-[GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:2])];
    _lineLabel.backgroundColor = [UIColor whiteColor];
    return _lineLabel;
}
-(void)setModel:(GZGYRootSpellModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];

        [_imgView setHeader:urlString];
    });
    _nameLabel.text = [NSString stringWithFormat:@"%@",self.model.name];
    _priceLabel.text = [NSString stringWithFormat:@"%.2f",self.model.price];
    _marketPrice.text = [NSString stringWithFormat:@"%.2f",self.model.market_price];

    //    reasonLabel.text = [NSString stringWithFormat:@"%@",self.model.last_updated_by];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
