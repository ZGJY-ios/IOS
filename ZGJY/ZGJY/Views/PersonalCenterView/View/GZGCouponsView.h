//
//  GZGCouponsView.h
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GZGCouponsDelegeteClickProtocol<NSObject>
-(void)couponsBtnDelegate:(NSInteger)sender;
@end

@interface GZGCouponsView : UIView
@property(nonatomic,strong)UIScrollView*HeaderScroller;
@property(nonatomic,strong)UIView*LineView;
@property(nonatomic,strong)UIButton*SegBtn;
@property(nonatomic,retain)id<GZGCouponsDelegeteClickProtocol>delegate;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray;
@end
