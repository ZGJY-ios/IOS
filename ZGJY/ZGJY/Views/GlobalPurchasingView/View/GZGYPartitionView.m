//
//  GZGYPartitionView.m
//  ZGJY
//
//  Created by YYS on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYPartitionView.h"

@implementation GZGYPartitionView

@synthesize HeaderScroller,LineView,SegBtn;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray *)NameArray NumArray:(NSArray *)NumArray
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:90])];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(SCREENWIDTH * NameArray.count, HeaderScroller.frame.size.height)];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(SCREENWIDTH * i, 0, SCREENWIDTH, HeaderScroller.frame.size.height)];
            [SegBtn setTitle:NameArray[i] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            SegBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(PartitionBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
        }
        
        LineView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:50], SCREENWIDTH/2, [GZGApplicationTool control_height:35])];
        
        [HeaderScroller addSubview:LineView];
        [self addSubview:HeaderScroller];
    }
    return self;
}
-(void)PartitionBtn:(UIButton *)PartitionBtn
{
    [self.delegate PartitionBtnDelegate:PartitionBtn.tag];
}


@end
