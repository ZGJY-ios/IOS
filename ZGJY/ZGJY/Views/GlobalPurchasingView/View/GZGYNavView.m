//
//  GZGYNavView.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYNavView.h"

@implementation GZGYNavView

@synthesize HeaderScroller,LineView,SegBtn;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray *)NameArray
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/2, [GZGApplicationTool control_height:85])];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(SCREENWIDTH/6 * NameArray.count, HeaderScroller.frame.size.height)];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(SCREENWIDTH/6 * i, 0, SCREENWIDTH/6, HeaderScroller.frame.size.height)];
            [SegBtn setTitle:NameArray[i] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            SegBtn.titleLabel.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:28]];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(SegBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
        }
        
        LineView = [[UIView alloc]initWithFrame:CGRectMake(0, HeaderScroller.frame.size.height -2, SCREENWIDTH/6, 2)];
        [LineView setBackgroundColor:[UIColor whiteColor]];
        [HeaderScroller addSubview:LineView];
        [self addSubview:HeaderScroller];
    }
    return self;
}
-(void)SegBtn:(UIButton *)SegBtn
{
    [self.delegate NavBtnDelegate:SegBtn.tag];
}


@end
