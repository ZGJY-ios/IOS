//
//  GZGSpecialPerformanceView.h
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  专场

#import <UIKit/UIKit.h>
@class GZGSpecialPerformanceView;
@protocol SpecialPerformanceDelegeteClickProtocol<NSObject>
- (void)segment:(GZGSpecialPerformanceView*)segment didSelectIndex:(NSInteger)index;
@end
@interface GZGSpecialPerformanceView : UIControl
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIFont *textFont;
@property (nonatomic,assign) NSInteger selectedIndex;
@property (nonatomic,weak) id<SpecialPerformanceDelegeteClickProtocol> delegate;

- (void)updateChannels:(NSArray*)array;
- (void)didChengeToIndex:(NSInteger)index;
@end

@class GZGPageView;

@protocol GZGPageViewDataSource <NSObject>

- (NSInteger)numberOfItemInJXPageView:(GZGPageView*)pageView;
- (UIView*)pageView:(GZGPageView*)pageView viewAtIndex:(NSInteger)index;

@end

@protocol GZGPageViewDelegate <NSObject>

- (void)didScrollToIndex:(NSInteger)index;

@end

@interface GZGPageView : UIView
@property(nonatomic,strong) UIScrollView *scrollview;
@property(nonatomic,assign) NSInteger numberOfItems;
@property(nonatomic,assign) BOOL scrollAnimation;
@property(nonatomic,weak) id<GZGPageViewDataSource> datasource;
@property(nonatomic,weak) id<GZGPageViewDelegate> delegate;

- (void)reloadData;
- (void)changeToItemAtIndex:(NSInteger)index;
@end
