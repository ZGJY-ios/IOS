//
//  GZGYSpellView.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellView.h"

@implementation GZGYSpellView
@synthesize imgView,iconView,nameLabel,introduceLabel;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:300])];
        imgView.image = [UIImage imageNamed:@"未标题-1.png"];
        [self addSubview:imgView];
        NSArray * imgArray = @[@"quanqiu",@"shengxin",@"yuetuan",@"jisu"];
        NSArray * nameArray = @[@"全球正品",@"省心优惠",@"越团越惠",@"极速发货"];
        NSArray * interArray = @[@"全国原产地直采",@"优惠价格 省心购买",@"团购越多 价格越低",@"极速清关 闪电发货"];
        for (int i = 0; i<2; i++) {
            for (int j = 0; j<2; j++) {
                iconView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:70]+[GZGApplicationTool control_wide:330]*j, [GZGApplicationTool control_height:350]+[GZGApplicationTool control_height:135]*i, [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:100])];
                iconView.image = [UIImage imageNamed:imgArray[i*2+j]];
                [self addSubview:iconView];
                nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:190]+[GZGApplicationTool control_wide:330]*j, [GZGApplicationTool control_height:365]+[GZGApplicationTool control_height:135]*i, [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
                nameLabel.text = nameArray[i*2+j];
                nameLabel.font = [UIFont boldSystemFontOfSize:18];
                [self addSubview:nameLabel];
                introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:190]+[GZGApplicationTool control_wide:330]*j, [GZGApplicationTool control_height:405]+[GZGApplicationTool control_height:135]*i, [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:30])];
                introduceLabel.text = interArray[i*2+j];
                introduceLabel.font = [UIFont systemFontOfSize:12];
                [self addSubview:introduceLabel];
            }
        }
        
    }
    return self;
}

@end
