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
    
    self.cellName = [[UILabel alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:176.0f], [GZGApplicationTool control_wide:214.0f], [GZGApplicationTool control_height:100.0f])];
    self.cellName.textColor = [UIColor blackColor];
    self.cellName.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
    self.cellName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.cellName];
    

}


@end
