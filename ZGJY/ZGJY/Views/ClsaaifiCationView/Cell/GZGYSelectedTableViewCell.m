//
//  GZGYSelectedTableViewCell.m
//  ZGJY
//
//  Created by YYS on 2016/12/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSelectedTableViewCell.h"

@implementation GZGYSelectedTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.selectedLabel];
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:30])];
        _countLabel.text = @"1个,增值保障";
        _countLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
        [self addSubview:self.countLabel];
        [self addSubview:self.arrowView];
    }
    return self;
}
-(UILabel *)selectedLabel
{
    _selectedLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30])];
    _selectedLabel.text = @"已选";
    _selectedLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
    return _selectedLabel;
}
//-(UILabel *)countLabel
//{
//    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:30])];
//    _countLabel.text = @"1个,增值保障";
//    _countLabel.font = [UIFont systemFontOfSize:15];
//    return _countLabel;
//}
-(UIImageView *)arrowView
{
    _arrowView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:15], [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:40])];
    _arrowView.image = [UIImage imageNamed:@"next2-arrow"];
    return _arrowView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
