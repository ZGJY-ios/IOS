//
//  GZGYCollectionTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYCollectionTableViewCell.h"

@implementation GZGYCollectionTableViewCell
@synthesize imgView,nameLabel,iconLabel,priceLabel,shopcarBtn;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:120])];
        imgView.layer.cornerRadius = 1;
        imgView.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
        imgView.layer.borderWidth = 1;
        [imgView.layer setMasksToBounds:YES];
        imgView.image = [UIImage imageNamed:@"sy_mypic6.jpg"];
        [self addSubview:imgView];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:85])];
        nameLabel.numberOfLines = 2;
        nameLabel.text = @"BABY专享尊贵体内平衡益生菌胶囊益生菌";
        [self addSubview:nameLabel];
        for (int i = 0; i<3; i++) {
            iconLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170]+[GZGApplicationTool control_wide:75]*i, [GZGApplicationTool control_height:140], [GZGApplicationTool control_wide:65], [GZGApplicationTool control_height:30])];
            iconLabel.textAlignment = NSTextAlignmentCenter;
            iconLabel.backgroundColor = [UIColor orangeColor];
            iconLabel.text = @"热卖";
            iconLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:24]];
            [self addSubview:iconLabel];
        }
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:590], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:35])];
        priceLabel.text = @"¥120.00";
        priceLabel.textColor = [UIColor colorWithRed:178/255.0 green:54/255.0 blue:51/255.0 alpha:1.0];
        [self addSubview:priceLabel];
        shopcarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shopcarBtn.frame = CGRectMake([GZGApplicationTool control_wide:620], [GZGApplicationTool control_height:120], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        [shopcarBtn setImage:[UIImage imageNamed:@"my-car"] forState:UIControlStateNormal];
        [self addSubview:shopcarBtn];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
