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
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:105])];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(SCREENWIDTH/5 * NameArray.count, HeaderScroller.frame.size.height)];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(SCREENWIDTH/5 * i, 0, SCREENWIDTH/5, HeaderScroller.frame.size.height)];
            [SegBtn setTitle:NameArray[i] forState:UIControlStateNormal];
            [SegBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            if (i == 0) {
                [SegBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:43/255.0 blue:44/255.0 alpha:1.0] forState:UIControlStateNormal];
            }
            SegBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(SegBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
            [self.nameArray addObject:SegBtn];
        }
        
        LineView = [[UIView alloc]initWithFrame:CGRectMake(0, HeaderScroller.frame.size.height-2, SCREENWIDTH/5,2 )];
        [LineView setBackgroundColor:[UIColor redColor]];
        [HeaderScroller addSubview:LineView];
        [self addSubview:HeaderScroller];
    }
    return self;
}
-(void)SegBtn:(UIButton *)SegBtn
{
    for (int i = 0 ; i<self.nameArray.count; i++) {
        UIButton * btn = self.nameArray[i];
        NSLog(@"%ld,%d",SegBtn.tag,i);
        if (i == SegBtn.tag) {
            [btn setTitleColor:[UIColor colorWithRed:217/255.0 green:43/255.0 blue:44/255.0 alpha:1.0] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    [self.delegate OrdersBtnDelegate:SegBtn.tag];
}
-(NSMutableArray *)nameArray
{
    if (_nameArray == nil) {
        _nameArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _nameArray;
}

@end
