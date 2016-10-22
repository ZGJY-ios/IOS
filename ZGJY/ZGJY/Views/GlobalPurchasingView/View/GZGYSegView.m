//
//  GZGYSegView.m
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSegView.h"

@implementation GZGYSegView

@synthesize HeaderScroller,LineView,SegBtn;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray *)NameArray
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, KScreenHeight/15)];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(KScreenWigth/2 * NameArray.count, HeaderScroller.frame.size.height)];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(KScreenWigth/2 * i, 0, KScreenWigth/2, HeaderScroller.frame.size.height)];
            [SegBtn setTitle:NameArray[i] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            SegBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(SegBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
        }
        
        LineView = [[UIView alloc]initWithFrame:CGRectMake(0, HeaderScroller.frame.size.height - 2, KScreenWigth/2, 2)];
        [LineView setBackgroundColor:[UIColor redColor]];
        [HeaderScroller addSubview:LineView];
        [self addSubview:HeaderScroller];
    }
    return self;
}
-(void)SegBtn:(UIButton *)SegBtn
{
    [self.delegate SegBtnDelegate:SegBtn.tag];
}


@end
