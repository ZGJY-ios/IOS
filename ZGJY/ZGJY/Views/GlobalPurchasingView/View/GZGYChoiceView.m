//
//  GZGYChoiceView.m
//  ZGJY
//
//  Created by YYS on 16/10/22.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYChoiceView.h"
@implementation GZGYChoiceView
@synthesize alphaiView,choiceView,imgView,cancelBtn,priceLabel,categoryBtn,reduceBtn,addBtn,countField,collectionBtn,receiptBtn;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //半透明视图
        alphaiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        alphaiView.backgroundColor = [UIColor blackColor];
        alphaiView.alpha = 0.2;
        [self addSubview:alphaiView];
        //装载商品信息的视图
        choiceView = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:500], self.frame.size.width, self.frame.size.height-[GZGApplicationTool control_height:500])];
        choiceView.backgroundColor = [UIColor whiteColor];
        [self addSubview:choiceView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [choiceView addGestureRecognizer:tap];
        
        //商品图片
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:50], -[GZGApplicationTool control_height:50], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:150])];
        imgView.image = [UIImage imageNamed:@"sy_hlpic1.jpg"];
        imgView.backgroundColor = [UIColor yellowColor];
        imgView.layer.cornerRadius = 4;
        imgView.layer.borderColor = [UIColor whiteColor].CGColor;
        imgView.layer.borderWidth = 1;
        [imgView.layer setMasksToBounds:YES];
        [choiceView addSubview:imgView];
        
        cancelBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(choiceView.frame.size.width-[GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20],[GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:0];
        [choiceView addSubview:cancelBtn];
    }
    return self;
}

@end
