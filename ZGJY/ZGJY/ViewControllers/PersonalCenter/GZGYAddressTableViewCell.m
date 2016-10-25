//
//  GZGYAddressTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAddressTableViewCell.h"

@implementation GZGYAddressTableViewCell
@synthesize nameLabel,certImg,phoneLabel,choiceBtn,addressLabel,cardLabel,numberLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:35])];
        nameLabel.text = @"任海";
        [self addSubview:nameLabel];
        certImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:85], [GZGApplicationTool control_height:35])];
        certImg.image = [UIImage imageNamed:@"green-cyclo"];
        [self addSubview:certImg];
        phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:510], [GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:35])];
        phoneLabel.text = @"13838385438";
        [self addSubview:phoneLabel];
        choiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        choiceBtn.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:70], [GZGApplicationTool control_wide:35], [GZGApplicationTool control_height:35]);
        [choiceBtn setImage:[UIImage imageNamed:@"empty-hook"] forState:UIControlStateNormal];
        [choiceBtn setImage:[UIImage imageNamed:@"red-hook"] forState:UIControlStateSelected];
        [self addSubview:choiceBtn];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
