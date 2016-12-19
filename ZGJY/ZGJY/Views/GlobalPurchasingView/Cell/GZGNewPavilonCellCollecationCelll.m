//
//  GZGNewPavilonCellCollecationCelll.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/12/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGNewPavilonCellCollecationCelll.h"

@implementation GZGNewPavilonCellCollecationCelll


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{

    self.cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:214.0f], [GZGApplicationTool control_height:176.0f])];
    
    [self addSubview:self.cellImageView];
    
    self.cellPrict = [[UILabel alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:160.0f], [GZGApplicationTool control_wide:200.0f]/2, [GZGApplicationTool control_height:100.0f])];
    self.cellPrict.textColor = [UIColor redColor];
    self.cellPrict.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    self.cellPrict.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.cellPrict];
    
    
    
    self.cellMark_Prict = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:224.0f]/2, [GZGApplicationTool control_height:160.0f], [GZGApplicationTool control_wide:214.0f]/2, [GZGApplicationTool control_height:100.0f])];
    self.cellMark_Prict.textColor = [UIColor blackColor];
    self.cellMark_Prict.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    self.cellMark_Prict.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.cellMark_Prict];

    
    
    self.cellName = [[UILabel alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:200.0f], [GZGApplicationTool control_wide:214.0f], [GZGApplicationTool control_height:100.0f])];
    self.cellName.textColor = [UIColor blackColor];
    self.cellName.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    self.cellName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.cellName];
    

}


@end
