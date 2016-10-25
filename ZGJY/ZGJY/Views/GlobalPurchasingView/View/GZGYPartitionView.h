//
//  GZGYPartitionView.h
//  ZGJY
//
//  Created by YYS on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PartitionDelegeteClickProtocol<NSObject>
-(void)PartitionBtnDelegate:(NSInteger)sender;
@end
@interface GZGYPartitionView : UIView
@property(nonatomic,strong)UIScrollView*HeaderScroller;
@property(nonatomic,strong)UIView*LineView;
@property(nonatomic,strong)UIButton*SegBtn;
@property(nonatomic,retain)id<PartitionDelegeteClickProtocol>delegate;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray NumArray:(NSArray *)NumArray;

@end
