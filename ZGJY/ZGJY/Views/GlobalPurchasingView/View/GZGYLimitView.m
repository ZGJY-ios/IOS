//
//  GZGYLimitView.m
//  ZGJY
//
//  Created by YYS on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLimitView.h"

@implementation GZGYLimitView
@synthesize HeaderScroller,LineView,SegBtn,timeLabel,stateLabel;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray *)NameArray
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:105])];
        HeaderScroller.pagingEnabled = YES;
        HeaderScroller.bounces = NO;
        [HeaderScroller setContentSize:CGSizeMake(SCREENWIDTH/4 * NameArray.count, HeaderScroller.frame.size.height)];
        [self addSubview:HeaderScroller];
        for (int i = 0; i<NameArray.count; i++) {
            SegBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [SegBtn setFrame:CGRectMake(SCREENWIDTH/4 * i, 0, SCREENWIDTH/4, HeaderScroller.frame.size.height)];
            SegBtn.tag = i;
            [SegBtn addTarget:self action:@selector(LimitBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HeaderScroller addSubview:SegBtn];
            timeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:35])];
            if (i == 0) {
                timeLabel.textColor = [UIColor colorWithRed:178/255.0 green:54/255.0 blue:51/255.0 alpha:1.0];
                timeLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:38]];
            }
            timeLabel.textAlignment = NSTextAlignmentCenter;
            timeLabel.text = NameArray[i];
            [self.timeArray addObject:timeLabel];
            [SegBtn addSubview:timeLabel];
            stateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:60], [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:30])];
            stateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            if (i == 0) {
                stateLabel.textColor = [UIColor colorWithRed:178/255.0 green:54/255.0 blue:51/255.0 alpha:1.0];
                stateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:32]];
            }
            stateLabel.textAlignment = NSTextAlignmentCenter;
            if (i == 0) {
                stateLabel.text = @"正在疯抢";
            }else{
                stateLabel.text = @"即将开始";
            }
            [self.stateArray addObject:stateLabel];
            [SegBtn addSubview:stateLabel];
        }
    }
    return self;
}
-(void)LimitBtn:(UIButton *)LimitBtn
{
    for (int i = 0; i<self.timeArray.count; i++) {
        UILabel * time = self.timeArray[i];
        UILabel * stateL = self.stateArray[i];
        if (i == LimitBtn.tag) {
            time.textColor = [UIColor colorWithRed:178/255.0 green:54/255.0 blue:51/255.0 alpha:1.0];
            time.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:38]];
            stateL.textColor = [UIColor colorWithRed:178/255.0 green:54/255.0 blue:51/255.0 alpha:1.0];
            stateL.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:32]];
        }else{
            time.textColor = [UIColor blackColor];
            time.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            stateL.textColor = [UIColor blackColor];
            stateL.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        }
    }
    [self.delegate LimitBtnDelegate:LimitBtn.tag];
}
-(NSMutableArray *)timeArray
{
    if (_timeArray == nil) {
        _timeArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _timeArray;
}
-(NSMutableArray *)stateArray
{
    if (_stateArray == nil) {
        _stateArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _stateArray;
}
@end
