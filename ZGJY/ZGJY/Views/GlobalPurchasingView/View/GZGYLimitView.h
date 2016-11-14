//
//  GZGYLimitView.h
//  ZGJY
//
//  Created by YYS on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LimitDelegeteClickProtocol<NSObject>

-(void)LimitBtnDelegate:(NSInteger)sender;
@end

@interface GZGYLimitView : UIView
@property(nonatomic, strong)UIScrollView * HeaderScroller;
@property(nonatomic, strong)UIView * LineView;
@property(nonatomic, strong)UIButton * SegBtn;
@property(nonatomic, strong)UILabel * timeLabel;
@property(nonatomic, strong)UILabel * stateLabel;
@property(nonatomic, strong)NSMutableArray * timeArray;
@property(nonatomic, strong)NSMutableArray * stateArray;
@property(nonatomic,retain)id<LimitDelegeteClickProtocol>delegate;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray;
@end
