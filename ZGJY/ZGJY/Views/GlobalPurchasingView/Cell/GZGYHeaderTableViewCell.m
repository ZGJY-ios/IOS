//
//  GZGYHeaderTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYHeaderTableViewCell.h"

@implementation GZGYHeaderTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.imgView];
    }
    return self;
}
-(UIImageView *)imgView
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:120])];
    _imgView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
    return _imgView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
