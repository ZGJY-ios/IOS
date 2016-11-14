//
//  GZGYSpellSegView.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SpellsegDelegeteClickProtocol<NSObject>
-(void)SpellsegBtnDelegate:(NSInteger)sender;
@end
@interface GZGYSpellSegView : UIView
@property(nonatomic,strong)UIScrollView*HeaderScroller;
@property(nonatomic,strong)UIView*LineView;
@property(nonatomic,strong)UIButton*SegBtn;
@property(nonatomic,retain)id<SpellsegDelegeteClickProtocol>delegate;
-(instancetype)initWithFrame:(CGRect)frame NameArray:(NSArray*)NameArray;
@end
