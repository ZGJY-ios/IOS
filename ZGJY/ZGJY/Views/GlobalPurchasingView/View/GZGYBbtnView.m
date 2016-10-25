//
//  GZGYBbtnView.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYBbtnView.h"

@implementation GZGYBbtnView
@synthesize serviceBtn,focusBtn,cartBtn,addBtn;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel*label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, 1)];
        label.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self addSubview:label];
        serviceBtn = [[GZGYButton alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:110], self.frame.size.height) Head:@"客服" Message:nil];
        serviceBtn.jiantou.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        serviceBtn.jiantou.image = [UIImage imageNamed:@"service"];
        serviceBtn.headLabel.frame = CGRectMake([GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35]);
        serviceBtn.headLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:serviceBtn];
        
        
        focusBtn = [[GZGYButton alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:110], 0, [GZGApplicationTool control_wide:120], self.frame.size.height) Head:@"关注" Message:nil];
        focusBtn.jiantou.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        focusBtn.jiantou.image = [UIImage imageNamed:@"foucson"];
        focusBtn.headLabel.frame = CGRectMake([GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35]);
        focusBtn.headLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:focusBtn];
        
        cartBtn = [[GZGYButton alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:220], 0, [GZGApplicationTool control_wide:150], self.frame.size.height) Head:@"购物车" Message:nil];
        cartBtn.jiantou.frame = CGRectMake([GZGApplicationTool control_wide:45], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        cartBtn.jiantou.image = [UIImage imageNamed:@"shop-car"];
        cartBtn.headLabel.frame = CGRectMake([GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:35]);
        cartBtn.headLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:cartBtn];
        
        
        addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake([GZGApplicationTool control_wide:360], 0, KScreenWigth-[GZGApplicationTool control_wide:360], self.frame.size.height);
        [addBtn setTitle:@"加入进货单" forState:UIControlStateNormal];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        addBtn.backgroundColor = [UIColor colorWithRed:178/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [self addSubview:addBtn];
        
        
    }
    return self;
}
@end
