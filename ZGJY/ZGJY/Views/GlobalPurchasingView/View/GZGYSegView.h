//
//  GZGYSegView.h
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SegDelegeteClickProtocol<NSObject>
-(void)SegBtnDelegate:(NSInteger)sender;
@end
@interface GZGYSegView : UIView
@property(nonatomic,strong)UIScrollView*HeaderScroller;
@property(nonatomic,strong)UIView*LineView;
@property(nonatomic,strong)UIButton*SegBtn;
@property(nonatomic,retain)id<SegDelegeteClickProtocol>delegate;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray;
@end
