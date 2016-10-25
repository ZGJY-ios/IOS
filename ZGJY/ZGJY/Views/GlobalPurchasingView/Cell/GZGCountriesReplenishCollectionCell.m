//
//  GZGCountriesReplenishCollectionCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesReplenishCollectionCell.h"

@implementation GZGCountriesReplenishCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    CGFloat ww = [GZGApplicationTool control_wide:195.0f],hh = [GZGApplicationTool control_height:261.0f];
    self.replenishImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ww, hh)];
    [self addSubview:self.replenishImage];
    
    
}
@end
