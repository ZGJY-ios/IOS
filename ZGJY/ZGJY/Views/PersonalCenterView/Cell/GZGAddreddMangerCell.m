//
//  GZGAddreddMangerCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAddreddMangerCell.h"

@implementation GZGAddreddMangerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    CGFloat xx = [GZGApplicationTool control_wide:90],yy = [GZGApplicationTool control_height:30.0f],ww = SCREENWIDTH;
    self.cellUserName = [[UILabel alloc] init];
    self.cellUserName.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]];
    [self addSubview:self.cellUserName];
    
    self.cellCertifiCation = [[UILabel alloc] initWithFrame:CGRectMake( [GZGApplicationTool control_wide:204], yy, [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:40])];
    self.cellCertifiCation.textColor = [UIColor redColor];
    self.cellCertifiCation.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
    [self addSubview:self.cellCertifiCation];
    
    self.cellTelNumber = [[UILabel alloc]  initWithFrame:CGRectMake(ww - [GZGApplicationTool control_wide:50] - [GZGApplicationTool control_wide:200], yy, [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35])];
    self.cellTelNumber.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:17]];
    [self addSubview:self.cellTelNumber];
    
    self.cellAddress = [[UILabel alloc] initWithFrame:CGRectMake(xx,[GZGApplicationTool control_height:75], [GZGApplicationTool control_wide:536], [GZGApplicationTool control_height:60])];
    self.cellAddress.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
    self.cellAddress.numberOfLines = 0;
    [self addSubview:self.cellAddress];
    
    self.cellIDCar = [[UILabel alloc] initWithFrame:CGRectMake(xx, self.cellAddress.onTheOffset + [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:480], [GZGApplicationTool control_height:30])];
    self.cellIDCar.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:27]];
    [self addSubview:self.cellIDCar];
    
    
    
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
