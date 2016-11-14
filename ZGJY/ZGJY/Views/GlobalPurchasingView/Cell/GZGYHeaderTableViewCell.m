//
//  GZGYHeaderTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/11/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYHeaderTableViewCell.h"

@implementation GZGYHeaderTableViewCell
@synthesize imgView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:120])];
        imgView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
        [self addSubview:imgView];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
