//
//  GZGADDAddressCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressCell.h"
@interface GZGADDAddressCell()<UITextFieldDelegate>
@end

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
    self.cellTextFiled.hidden = YES;
    self.cellTextFiled.delegate = self;
    [self addSubview:self.cellTextFiled];
    
    self.cellAfterText = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:245], 0, SCREENWIDTH - [GZGApplicationTool control_wide:245], [GZGApplicationTool control_height:128])];
    self.cellAfterText.hidden = YES;
    [self addSubview:self.cellAfterText];
    
    self.cellSWitch = [[UISwitch  alloc] initWithFrame:CGRectMake(SCREENWIDTH - [GZGApplicationTool control_wide:30] - [GZGApplicationTool control_wide:103], ([GZGApplicationTool control_height:128] - [GZGApplicationTool control_height:56])/2, [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:56])];
    self.cellSWitch.on = YES;
    self.cellSWitch.hidden = YES;
    [self addSubview:self.cellSWitch];
    
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:127], SCREENWIDTH, [GZGApplicationTool control_height:1])];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
