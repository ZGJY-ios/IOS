//
//  GZGYPaymentTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYPaymentTableViewCell.h"

@implementation GZGYPaymentTableViewCell
@synthesize orderLabel,numberLabel,dateLabel,lineLabel,orderImg,nameLabel,priceLabel,countLabel,stateLabel,promptLabel,dividerLabel,cancleBtn,paymentBtn;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        orderLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
        orderLabel.text = @"订单号:";
        [self addSubview:orderLabel];
        numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:35])];
        numberLabel.text = @"12323123123";
        [self addSubview:numberLabel];
        dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-[GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
        dateLabel.font = [UIFont systemFontOfSize:13];
        dateLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        dateLabel.text = @"2016-10-11";
        [self addSubview:dateLabel];
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:90], SCREENWIDTH, 1)];
        lineLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self addSubview:lineLabel];
        orderImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:125])];
        orderImg.image = [UIImage imageNamed:@"sy_kjpic1.jpg"];
        orderImg.layer.cornerRadius = 4;
        orderImg.layer.borderColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
        orderImg.layer.borderWidth = 1;
        [orderImg.layer setMasksToBounds:YES];
        [self addSubview:orderImg];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:560], [GZGApplicationTool control_height:35])];
        nameLabel.text = @"澳洲进口 体内平衡益生菌";
        [self addSubview:nameLabel];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:35])];
        priceLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        priceLabel.text = @"¥120.00";
        [self addSubview:priceLabel];
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:315], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:35])];
        countLabel.text = @"×1";
        [self addSubview:countLabel];
        stateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
        stateLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        stateLabel.text = @"未付款";
        [self addSubview:stateLabel];
        promptLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:380], [GZGApplicationTool control_height:35])];
        promptLabel.font = [UIFont systemFontOfSize:14];
        promptLabel.text = @"(订单将在60分钟内取消)";
        [self addSubview:promptLabel];
        dividerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:295], SCREENWIDTH, 1)];
        dividerLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self addSubview:dividerLabel];
        cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake([GZGApplicationTool control_wide:275], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
        cancleBtn.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [cancleBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cancleBtn.layer.cornerRadius = 5;
        cancleBtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
        cancleBtn.layer.borderWidth = 1;
        [cancleBtn.layer setMasksToBounds:YES];
        [self addSubview:cancleBtn];
        paymentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        paymentBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
        paymentBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [paymentBtn setTitle:@"去付款" forState:UIControlStateNormal];
        [paymentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        paymentBtn.layer.cornerRadius = 5;
        paymentBtn.layer.borderColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0].CGColor;
        paymentBtn.layer.borderWidth = 1;
        [paymentBtn.layer setMasksToBounds:YES];
        [self addSubview:paymentBtn];
    }
    return self;
}
-(void)setModel:(GZGYOrderModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.thumbnail stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        
        [orderImg setHeader:urlString];
    });
    numberLabel.text = [NSString stringWithFormat:@"%@",_model.sn];
    dateLabel.text = [NSString stringWithFormat:@"%@",_model.creation_date];
    nameLabel.text = [NSString stringWithFormat:@"%@",_model.name];
    priceLabel.text = [NSString stringWithFormat:@"%@",_model.price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
