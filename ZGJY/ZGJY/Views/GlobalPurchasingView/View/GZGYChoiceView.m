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
        choiceView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-[GZGApplicationTool control_height:715], self.frame.size.width, [GZGApplicationTool control_height:715])];
        choiceView.backgroundColor = [UIColor whiteColor];
        [self addSubview:choiceView];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
//        [choiceView addGestureRecognizer:tap];
        
        
        //商品图片
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:50], -[GZGApplicationTool control_height:70], [GZGApplicationTool control_wide:190], [GZGApplicationTool control_height:190])];
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
        [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [choiceView addSubview:cancelBtn];
        
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:85], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35])];
        priceLabel.text = @"¥650.00";
        priceLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [choiceView addSubview:priceLabel];
        
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:135], self.frame.size.width, 1)];
        lineLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [choiceView addSubview:lineLabel];
        
        categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:35], [GZGApplicationTool control_height:175], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35])];
        categoryLabel.text = @"类别:";
        [choiceView addSubview:categoryLabel];
        NSArray * nameArr = @[@"15~30件",@"31~60件",@">61件"];
        for (int i = 0; i<2; i++) {
            for (int j = 0; j<2; j++) {
                if (i == 1&&j == 1) {
                    NSLog(@"创毛线呀");
                }else{
                    categoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    categoryBtn.frame = CGRectMake([GZGApplicationTool control_wide:35]+j*[GZGApplicationTool control_wide:295], [GZGApplicationTool control_height:235]+[GZGApplicationTool control_height:80]*i, [GZGApplicationTool control_wide:265], [GZGApplicationTool control_height:45]);
                    [categoryBtn setTitle:@"" forState:UIControlStateNormal];
                    categoryBtn.layer.borderColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0].CGColor;
                    categoryBtn.layer.borderWidth = 1;
                    [categoryBtn.layer setMasksToBounds:YES];
                    [categoryBtn setTitle:nameArr[i*2+j] forState:UIControlStateNormal];
                    [categoryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [choiceView addSubview:categoryBtn];
                }
            }
        }
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:35], [GZGApplicationTool control_height:400], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35])];
        countLabel.text = @"数量:";
        [choiceView addSubview:countLabel];
        
        reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        reduceBtn.frame = CGRectMake([GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        reduceBtn.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [reduceBtn setTitle:@"➖" forState:UIControlStateNormal];
        [choiceView addSubview:reduceBtn];
        countField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:600], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:50])];
        countField.text = @"15";
        countField.textAlignment = NSTextAlignmentCenter;
        [choiceView addSubview:countField];
        addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake([GZGApplicationTool control_wide:670], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        [addBtn setTitle:@"➕" forState:UIControlStateNormal];
        addBtn.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [choiceView addSubview:addBtn];
        
        collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectionBtn.frame = CGRectMake(0, [GZGApplicationTool control_height:620], KScreenWigth/2, [GZGApplicationTool control_height:95]);
        collectionBtn.backgroundColor = [UIColor colorWithRed:82/255.0 green:181/255.0 blue:128/255.0 alpha:1.0];
        [collectionBtn setTitle:@"加入收藏" forState:UIControlStateNormal];
        [choiceView addSubview:collectionBtn];
        
        receiptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        receiptBtn.frame = CGRectMake(KScreenWigth/2, [GZGApplicationTool control_height:620], KScreenWigth/2, [GZGApplicationTool control_height:95]);
        receiptBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [receiptBtn setTitle:@"加入进货单" forState:UIControlStateNormal];
        [choiceView addSubview:receiptBtn];
    }
    return self;
}
#pragma mark --- 叉号按钮事件监听
-(void)cancel:(UIButton*)sender
{
    [self.delegate ChoiceBtnDelegate:sender.tag];
}
@end
