//
//  GZGCountriesCollectionViewCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/10/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesCollectionViewCell.h"

@implementation GZGCountriesCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    
    return self;
}

- (void)buildUI{
    CGFloat w = self.frame.size.width;
    self.cellGoodsImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,[GZGApplicationTool control_height:30 ], w, [GZGApplicationTool control_height:243])];
    [self addSubview:self.cellGoodsImage];
    
    
    self.cellGoodsName = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  self.cellGoodsImage.onTheOffset+[GZGApplicationTool control_height:15],
                                                                  w,
                                                                  [GZGApplicationTool control_height:30])];
    self.cellGoodsName.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    self.cellGoodsName.textColor = [GZGColorClass subjectCountriesPacilionGoodsTitleColor];
    self.cellGoodsName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.cellGoodsName];
    
    self.cellGoodsprice = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:10],
                                                                    self.cellGoodsName.onTheOffset + [GZGApplicationTool control_height:20],
                                                                    w,
                                                                    [GZGApplicationTool control_height:20])];
    self.cellGoodsprice.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
   
    [self addSubview:self.cellGoodsprice];
    
    

    
    
    self.cellAddshopping = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cellAddshopping.frame = CGRectMake(w - [GZGApplicationTool control_wide:25 + 10],
                            self.cellGoodsName.onTheOffset + [GZGApplicationTool control_height:20],
                            [GZGApplicationTool control_wide:25],
                            [GZGApplicationTool control_height:23]);
    
    [self addSubview:self.cellAddshopping];
    
    
    
}



@end
