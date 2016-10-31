//
//  GZGADDAddressCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressCell.h"

@implementation GZGADDAddressCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    self.cellText = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:30],0, [GZGApplicationTool control_wide:215], [GZGApplicationTool control_height:128])];
    self.cellText.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
    [self addSubview:self.cellText];
    
    self.cellTextFiled = [[UITextField alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:245], 0, SCREENWIDTH - [GZGApplicationTool control_wide:245], [GZGApplicationTool control_height:128])];
    [self addSubview:self.cellTextFiled];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:127], SCREENWIDTH, [GZGApplicationTool control_height:1])];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
