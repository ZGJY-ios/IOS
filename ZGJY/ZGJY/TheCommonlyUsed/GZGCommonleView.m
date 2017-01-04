//
//  GZGCommonleView.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCommonleView.h"

@implementation UIView (GZGCommonleView)

/**
 国家馆颜色渐变

 @param frame CGRect Frame

 @return UIView
 */
+ (UIView *)countriesGradiengColor:(CGRect)frame oneColor:(UIColor *)oneColor towColor:(UIColor *)towColor{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view.layer addSublayer:[GZGColorClass doubleGradientColor:CGRectMake(0, 0, frame.size.width, frame.size.height) colorOne:oneColor colorTow:towColor]];
    
    return view;
}
//[@"dd3149" hexStringToColor]
//[@"ec4c60" hexStringToColor]
@end
