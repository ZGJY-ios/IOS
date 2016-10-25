//
//  GZGCountriesHeadFaceCollectionCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesHeadFaceCollectionCell.h"

@implementation GZGCountriesHeadFaceCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
  
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:330.0f], [GZGApplicationTool control_height:420.0f])];
    backView.backgroundColor = [UIColor whiteColor];
    backView.alpha = 0.7;
    [self addSubview:backView];
    
    
    
    
    
    CGFloat hh = [GZGApplicationTool control_height:420.0f], yy = [GZGApplicationTool control_height:36], ww = [GZGApplicationTool control_wide:330.0f];
    self.cellHeadImage = [[UIImageView alloc] initWithFrame:CGRectMake((ww - [GZGApplicationTool control_wide:260.0f])/2, yy, [GZGApplicationTool control_wide:260.0f], [GZGApplicationTool control_height:198.0f])];
    [self addSubview:self.cellHeadImage];
    
    self.cellCountriesTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellHeadImage.onTheOffset + [GZGApplicationTool control_height:21], ww, [GZGApplicationTool control_height:20])];
    self.cellCountriesTitle.textColor = [GZGColorClass subjectCountriesCountImportTitleColor];
    self.cellCountriesTitle.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:16]];
    self.cellCountriesTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.cellCountriesTitle];
    
    self.cellTitleName = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellCountriesTitle.onTheOffset + [GZGApplicationTool control_height:10], ww, [GZGApplicationTool control_height:30])];
    self.cellTitleName.textColor = [GZGColorClass subjectCountriesCountNameTitleColor];
    self.cellTitleName.textAlignment = NSTextAlignmentCenter;
    self.cellTitleName.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:28]];
    [self addSubview:self.cellTitleName];
    
    self.cellTitleQuality = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellTitleName.onTheOffset + [GZGApplicationTool control_height:10], ww, [GZGApplicationTool control_height:22])];
    self.cellTitleQuality.textColor = [GZGColorClass subjectCountriesCountQualityTitleColor];
    self.cellTitleQuality.textAlignment = NSTextAlignmentCenter;
    self.cellTitleQuality.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:16]];
    [self addSubview:_cellTitleQuality];
    
    self.cellPriceLab = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:18], hh - [GZGApplicationTool control_height:34] - [GZGApplicationTool control_height:30], ww, [GZGApplicationTool control_height:34])];
    self.cellPriceLab.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
    self.cellPriceLab.textColor = [UIColor redColor];
    [self addSubview:self.cellPriceLab];
    
    self.cellShonpingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cellShonpingBtn.frame = CGRectMake(ww - [GZGApplicationTool control_wide:25] - [GZGApplicationTool control_wide:22],hh - [GZGApplicationTool control_height:30] - [GZGApplicationTool control_height:34], [GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:23]);

    [self addSubview:self.cellShonpingBtn];
    
}



@end
