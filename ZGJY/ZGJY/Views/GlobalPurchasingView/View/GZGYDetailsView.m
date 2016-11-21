//
//  GZGYDetailsView.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsView.h"

@implementation GZGYDetailsView
@synthesize goodsImgScro,shopName,priceLabel,shopPrice,wholeLabel,countLabel,reduceButton,addButton,countField,startLabel,serialLabel,numberLabel,givingLabel,integralLabel;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr
{
    self = [super initWithFrame:frame];
    if (self) {
        goodsImgScro = [[GZGYImgScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:750]) andImageArr:imageArr];
        goodsImgScro.delegete = self;
        [self addSubview:goodsImgScro];
        shopName = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:790], [GZGApplicationTool control_wide:640], [GZGApplicationTool control_height:90])];
        shopName.text = @"爱茉莉太平洋旗下的沙龙美发品牌至纯去屑发膜原装进口 保税区发货";
        shopName.numberOfLines = 2;
        [self addSubview:shopName];
        serialLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:900], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:45])];
        serialLabel.text = @"编   号:";
        serialLabel.font = [UIFont systemFontOfSize:15];
        serialLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:serialLabel];
        numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:900], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:45])];
        numberLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        numberLabel.text = @"234234234234";
        numberLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:numberLabel];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:970], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:45])];
        priceLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        priceLabel.text = @"销售价:";
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:priceLabel];
        shopPrice = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:970], [GZGApplicationTool control_wide:200],[GZGApplicationTool control_height:45])];
        shopPrice.text = @"¥650";
        shopPrice.textColor = [UIColor colorWithRed:170/255.0 green:50/255.0 blue:55/255.0 alpha:1.0];
        [self addSubview:shopPrice];
        startLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1035], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:45])];
        startLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        startLabel.text = @"起批量:";
        startLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:startLabel];
        wholeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:1035], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:45])];
        wholeLabel.text = @"15件起批";
        wholeLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        wholeLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:wholeLabel];
        givingLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1100], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:45])];
        givingLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        givingLabel.text = @"赠积分:";
        givingLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:givingLabel];
        integralLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:1100], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:45])];
        integralLabel.textColor = [UIColor colorWithRed:244/255.0 green:130/255.0 blue:62/255.0 alpha:1.0];
        integralLabel.text = @"998";
        integralLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:integralLabel];
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1165], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:45])];
        countLabel.text = @"数  量:";
        countLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        countLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:countLabel];
        UIView * countView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:1165], [GZGApplicationTool control_wide:180], [GZGApplicationTool control_height:55])];
        countView.layer.masksToBounds = YES;
        countView.layer.borderWidth = 1.0;
        countView.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0] CGColor];
        [self addSubview:countView];
        reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        reduceButton.frame = CGRectMake(0, 0, [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55]);
        reduceButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [reduceButton setTitle:@"➖" forState:UIControlStateNormal];
        [countView addSubview:reduceButton];
        countField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:55], 0, [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:55])];
        countField.text = @"1";
        countField.textAlignment = NSTextAlignmentCenter;
        [countView addSubview:countField];
        addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake([GZGApplicationTool control_wide:125], 0, [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55]);
        [addButton setTitle:@"➕" forState:UIControlStateNormal];
        addButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [countView addSubview:addButton];
    }
    return self;
}
-(void)setModel:(GZGYDetailsModel *)model
{
    _model = model;
    shopName.text = self.model.full_name;
    numberLabel.text = self.model.sn;
    shopPrice.text = self.model.price;
    integralLabel.text = self.model.point;
}
-(void)ImgDelegeteClick:(id)sender
{
    NSLog(@"%@",sender);
}
@end
