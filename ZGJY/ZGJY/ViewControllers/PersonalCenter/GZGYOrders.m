//
//  GZGYOrders.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYOrders.h"

@implementation GZGYOrders

@synthesize HeaderScroller,LineView,SegBtn;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray *)NameArray
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, [GZGApplicationTool control_height:105])];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(KScreenWigth/5 * NameArray.count, HeaderScroller.frame.size.height)];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(KScreenWigth/5 * i, 0, KScreenWigth/5, HeaderScroller.frame.size.height)];
            [SegBtn setTitle:NameArray[i] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            SegBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(SegBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
        }
        
        LineView = [[UIView alloc]initWithFrame:CGRectMake(0, HeaderScroller.frame.size.height-2, KScreenWigth/5,2 )];
        [LineView setBackgroundColor:[UIColor redColor]];
        [HeaderScroller addSubview:LineView];
        [self addSubview:HeaderScroller];
    }
    return self;
}
-(void)SegBtn:(UIButton *)SegBtn
{
    [self.delegate OrdersBtnDelegate:SegBtn.tag];
}


@end
