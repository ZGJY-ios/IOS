//
//  GZGYChoiceView.m
//  ZGJY
//
//  Created by YYS on 16/10/22.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYChoiceView.h"
@implementation GZGYChoiceView
@synthesize imgView,cancelBtn,priceLabel,snLabel,categoryBtn,reduceBtn,addBtn,countField,collectionBtn,receiptBtn;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //商品图片
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:50], -[GZGApplicationTool control_height:70], [GZGApplicationTool control_wide:190], [GZGApplicationTool control_height:190])];
        imgView.image = [UIImage imageNamed:@"sy_hlpic1.jpg"];
        imgView.backgroundColor = [UIColor yellowColor];
        imgView.layer.cornerRadius = 4;
        imgView.layer.borderColor = [UIColor whiteColor].CGColor;
        imgView.layer.borderWidth = 1;
        [imgView.layer setMasksToBounds:YES];
        [self addSubview:imgView];
        
        cancelBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(self.frame.size.width-[GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20],[GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:0];
        [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
        
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35])];
        priceLabel.text = @"¥650.00";
        priceLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [self addSubview:priceLabel];
        
        snLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:80], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:30])];
        snLabel.text = @"编号: 234567";
        snLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:snLabel];
        
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:135], self.frame.size.width, 1)];
        lineLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [self addSubview:lineLabel];
        
        categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:35], [GZGApplicationTool control_height:175], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35])];
        categoryLabel.text = @"区间:";
        [self addSubview:categoryLabel];
        NSArray * nameArr = @[@"15~30件",@"31~60件",@">61件"];
        //        NSInteger  count;
        //        if (nameArr.count == 1) {
        //            count = 1;
        //        }else if (nameArr.count%2 == 1) {
        //            count = nameArr.count/1;
        //        }else{
        //            count = nameArr.count/2;
        //        }
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
                    [self addSubview:categoryBtn];
                }
            }
        }
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:35], [GZGApplicationTool control_height:400], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:35])];
        countLabel.text = @"数量:";
        [self addSubview:countLabel];
        
        reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        reduceBtn.frame = CGRectMake([GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        reduceBtn.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [reduceBtn setTitle:@"➖" forState:UIControlStateNormal];
        [reduceBtn addTarget:self action:@selector(Reduct:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:reduceBtn];
        countField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:600], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:50])];
        countField.text = @"1";
        countField.textAlignment = NSTextAlignmentCenter;
        [self addSubview:countField];
        addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake([GZGApplicationTool control_wide:670], [GZGApplicationTool control_height:395], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:50]);
        [addBtn setTitle:@"➕" forState:UIControlStateNormal];
        addBtn.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [addBtn addTarget:self action:@selector(Add:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addBtn];
        
        collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectionBtn.frame = CGRectMake(0, [GZGApplicationTool control_height:620], SCREENWIDTH/2, [GZGApplicationTool control_height:95]);
        collectionBtn.backgroundColor = [UIColor colorWithRed:82/255.0 green:181/255.0 blue:128/255.0 alpha:1.0];
        [collectionBtn setTitle:@"加入收藏" forState:UIControlStateNormal];
        [collectionBtn addTarget:self action:@selector(Collection:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:collectionBtn];
        
        receiptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        receiptBtn.frame = CGRectMake(SCREENWIDTH/2, [GZGApplicationTool control_height:620], SCREENWIDTH/2, [GZGApplicationTool control_height:95]);
        receiptBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [receiptBtn setTitle:@"加入进货单" forState:UIControlStateNormal];
        [receiptBtn addTarget:self action:@selector(Receipt:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:receiptBtn];
    }
    return self;
}
-(void)setModel:(GZGYDetailsModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        [imgView setHeader:urlString];
    });
    NSLog(@"%@",_model.full_name);
    priceLabel.text = [NSString stringWithFormat:@"¥%@",_model.price];
    snLabel.text = [NSString stringWithFormat:@"编号: %@",_model.sn];
    //    //字符串转变为数组1
    //    NSMutableString * countString =[[NSMutableString alloc]initWithFormat:@"%@",_model.qsum];
    //    //字符串转变为数组2
    //    NSMutableArray * imageArr = [NSMutableArray arrayWithArray:[countString  componentsSeparatedByString:@"丨"]];
    //    for (int i = 0; i<self.btnArray.count; i++) {
    //        NSString * btnString = [NSString stringWithFormat:@"%@~%@件",imageArr[i],imageArr[i+1]];
    //        UIButton * btn = self.btnArray[i];
    //        [btn setTitle:btnString forState:UIControlStateNormal];
    //    }
}
#pragma mark --- 叉号按钮事件监听
-(void)cancel:(UIButton *)sender
{
    [self.delegate ChoiceBtnDelegate:sender.tag];
}
#pragma mark --- 减少事件
-(void)Reduct:(UIButton *)sender
{
    [self.delegate ReductBtnDelegate:sender.tag];
}
#pragma mark --- 增加事件
-(void)Add:(UIButton *)sender
{
    [self.delegate AddBtnDelegate:sender.tag];
}
#pragma mark --- 加入收藏
-(void)Collection:(UIButton *)sender
{
    [self.delegate CollectionBtnDelegate:sender.tag];
}
#pragma mark --- 加入进货单
-(void)Receipt:(UIButton *)sender
{
    [self.delegate ReceiptBtnDelegate:sender.tag];
}

@end
