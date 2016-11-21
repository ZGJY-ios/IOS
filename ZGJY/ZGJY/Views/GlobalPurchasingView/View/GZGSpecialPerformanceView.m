//
//  GZGSpecialPerformanceView.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpecialPerformanceView.h"

@interface GZGSpecialPerformanceView () {
    NSArray *widthArray;
    NSInteger _allButtonW;
    UIView *_divideView;
    UIView *_divideLineView;
}

@end

@implementation GZGSpecialPerformanceView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-0.5)];
        _scrollView.clipsToBounds = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        _divideLineView = [[UIView alloc] init];
        _divideLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_scrollView addSubview:_divideLineView];
        
        _divideView  = [[UIView alloc] init];
        _divideView.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:_divideView];
        
        UIImageView *divideImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 0.5)];
        divideImageView.image = [UIImage imageNamed:@"home_schedule_divider"];
        [self addSubview:divideImageView];
        
    }
    
    return self;
}

-(UIFont*)textFont{
    return _textFont?:[UIFont systemFontOfSize:16];
}


- (void)updateChannels:(NSArray*)array{
    
    NSMutableArray *widthMutableArray = [NSMutableArray array];
    NSInteger totalW = 0;
    for (int i = 0; i < array.count; i++) {
        
        NSString *string = [array objectAtIndex:i];
        CGFloat buttonW = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.textFont} context:nil].size.width + 20;
        [widthMutableArray addObject:@(buttonW)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(totalW, 0, buttonW, self.bounds.size.height)];
        button.tag = 1000 + i;
        [button.titleLabel setFont:self.textFont];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setTitle:string forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSegmentButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        totalW += buttonW;
        
        if (i == 0) {
            [button setSelected:YES];
            _divideView.frame = CGRectMake(0, _scrollView.bounds.size.height-2, buttonW, 2);
            _selectedIndex = 0;
        }
        
    }
    
    _allButtonW = totalW;
    _scrollView.contentSize = CGSizeMake(totalW,0);
    widthArray = [widthMutableArray copy];
    _divideLineView.frame = CGRectMake(0, _scrollView.frame.size.height-2, totalW, 2);
}

- (void)clickSegmentButton:(UIButton*)selectedButton{
    
    UIButton *oldSelectButton = (UIButton*)[_scrollView viewWithTag:(1000 + _selectedIndex)];
    [oldSelectButton setSelected:NO];
    
    [selectedButton setSelected:YES];
    _selectedIndex = selectedButton.tag - 1000;
    NSInteger totalW = 0;
    for (int i=0; i<_selectedIndex; i++) {
        totalW += [[widthArray objectAtIndex:i] integerValue];
    }
    
    //处理边界
    CGFloat selectW = [[widthArray objectAtIndex:_selectedIndex] integerValue];
    CGFloat offset = totalW + (selectW - self.bounds.size.width) *0.5 ;
    offset = MIN(_allButtonW - self.bounds.size.width, MAX(0, offset));
    
    [_scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    if ([_delegate respondsToSelector:@selector(segment:didSelectIndex:)]) {
        [_delegate segment:self didSelectIndex:_selectedIndex];
    }
    
    //滑块
    [UIView animateWithDuration:0.1 animations:^{
        _divideView.frame = CGRectMake(totalW, _divideView.frame.origin.y, selectW, _divideView.frame.size.height);
    }];
    
}

- (void)didChengeToIndex:(NSInteger)index{
    
    UIButton *selectedButton = [_scrollView viewWithTag:(1000 + index)];
    [self clickSegmentButton:selectedButton];
    
}

@end


@interface GZGPageView () <UIScrollViewDelegate> {
    
}

@end

@implementation GZGPageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    
    _scrollview = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollview.delegate = self;
    _scrollview.pagingEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollview];
    
}

- (void)reloadData{
    
    if (nil != _datasource) {
        _numberOfItems = [_datasource numberOfItemInJXPageView:self];
        _scrollview.contentSize = CGSizeMake(_numberOfItems * self.frame.size.width,self.frame.size.height);
    }
    
}

- (void)changeToItemAtIndex:(NSInteger)index{
    
    if ([self.itemsArray objectAtIndex:index] == [NSNull null]) {
        [self loadViewAtIndex:index];
    }
    [_scrollview setContentOffset:CGPointMake(index * self.bounds.size.width, 0) animated:_scrollAnimation];
    [self preLoadViewWithIndex:index];
    _currentIndex = index;
    
}

- (NSMutableArray*)itemsArray{
    
    if (_itemsArray == nil) {
        NSInteger total = [_datasource numberOfItemInJXPageView:self];
        _itemsArray = [NSMutableArray arrayWithCapacity:total];
        for (int i = 0; i < total; i++) {
            [_itemsArray addObject:[NSNull null]];
        }
    }
    return _itemsArray;
    
}

- (void)loadViewAtIndex:(NSInteger)index{
    if (_datasource != nil && [_datasource respondsToSelector:@selector(pageView:viewAtIndex:)]) {
        UIView *view = [_datasource pageView:self viewAtIndex:index];
        view.frame = CGRectMake(self.bounds.size.width*index, 0, self.bounds.size.width, self.bounds.size.height);
        [_scrollview addSubview:view];
        [self.itemsArray replaceObjectAtIndex:index withObject:view];
    }
}

- (void)preLoadViewWithIndex:(NSInteger)index{
    
    if (index > 0 && [self.itemsArray objectAtIndex:(index-1)] == [NSNull null]) {
        [self loadViewAtIndex:(index-1)];
    }
    if (index < (_numberOfItems-1) && [self.itemsArray objectAtIndex:(index+1)] == [NSNull null]) {
        [self loadViewAtIndex:(index+1)];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / self.bounds.size.width;
    if ([self.itemsArray objectAtIndex:index] == [NSNull null]) {
        [self loadViewAtIndex:index];
    }
    [self preLoadViewWithIndex:index];
    
    if (index != _currentIndex) {
        if ([_delegate respondsToSelector:@selector(didScrollToIndex:)]) {
            [_delegate didScrollToIndex:index];
            _currentIndex = index;
        }
    }
    
}


@end
