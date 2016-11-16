//
//  GZGYOrders.h
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrdersDelegeteClickProtocol<NSObject>
-(void)OrdersBtnDelegate:(NSInteger)sender;
@end

@interface GZGYOrders : UIView
@property(nonatomic,strong)UIScrollView*HeaderScroller;
@property(nonatomic,strong)UIView*LineView;
@property(nonatomic,strong)UIButton*SegBtn;
@property(nonatomic,retain)id<OrdersDelegeteClickProtocol>delegate;
@property(nonatomic, strong)NSMutableArray * nameArray;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray;
@end
