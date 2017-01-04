//
//  GZGADDAddressViewCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/31.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressViewCell.h"

@implementation GZGADDAddressViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    self.cellCityLab = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:50], 0, SCREENWIDTH, [GZGApplicationTool control_height:70])];
    self.cellCityLab.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
    self.cellCityLab.textColor = [UIColor blackColor];
    
    [self addSubview:self.cellCityLab];
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
