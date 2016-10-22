//
//  GZGCountriesPavilionView.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/10/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesPavilionView.h"

@implementation GZGCountriesPavilionView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image price:(NSString *)price title:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        [self buildUIImage:image price:price title:title];
    }
    return self;
}

- (void)buildUIImage:(UIImage *)image price:(NSString *)price title:(NSString *)title{
    
    CGFloat w = self.frame.size.width;
    
    
    UIImageView *imageViews = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, w, [GZGApplicationTool control_height:243])];
    imageViews.image = image;
    [self addSubview:imageViews];
    
    
    CGSize titleSize = [GZGApplicationTool textSize:title font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]] size:w];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, imageViews.onTheOffset+[GZGApplicationTool control_height:10], titleSize.width, titleSize.height)];
    titleLab.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
    titleLab.textColor = [GZGColorClass subjectCountriesPacilionGoodsTitleColor];
    titleLab.text = title;
    [self addSubview:titleLab];
    
    CGSize priceSize = [GZGApplicationTool textSize:price font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:36]] size:w];
    UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:10], titleLab.onTheOffset+[GZGApplicationTool control_height:10], priceSize.width, priceSize.height)];
    priceLab.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:36]];
//    priceLab.textColor = [UIColor blackColor]
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
