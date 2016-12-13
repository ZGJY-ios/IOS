//
//  YDImageRoll.m
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/1.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "YDImageRoll.h"
#import "UIImageView+YDWebCache.h"
@interface YDImageRoll ()<UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat xx;
@property (nonatomic, assign) CGFloat yy;
@property (nonatomic, assign) CGFloat ww;
@property (nonatomic, assign) CGFloat hh;

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIImageView *currImageView;
@property (nonatomic, strong) UIImageView *behindImageView;

@property (nonatomic, assign) NSInteger currIndex;
@property (nonatomic, assign) NSInteger nextIndex;
@property (nonatomic, strong) NSTimer *timer;


@end
@implementation YDImageRoll

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _xx = 0,
        _yy = 0,
        _ww = self.frame.size.width,
        _hh = self.frame.size.height;
        
        [self buildUI];
        [self startTimer];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)buildUI{
    [self addSubview:self.scrollview];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollview.contentInset = UIEdgeInsetsZero;
    _scrollview.frame = self.bounds;
    [self setScrollViewContentSize];

}
#pragma mark -----------------  懒加载  -----------------

- (UIScrollView *)scrollview{
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollview.scrollsToTop = NO;
        _scrollview.pagingEnabled = YES;
        _scrollview.bounces = NO;
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.showsVerticalScrollIndicator = NO;
        _scrollview.delegate = self;
        //Image1
        _currImageView = [[UIImageView alloc] init];
        _currImageView.clipsToBounds = YES;
        _currImageView.contentMode =  UIViewContentModeScaleAspectFill;
        _currImageView.clipsToBounds = YES;
        [_scrollview addSubview:_currImageView];
        //Image2
        _behindImageView = [[UIImageView alloc] init];
        _behindImageView.clipsToBounds = YES;
        _behindImageView.contentMode =  UIViewContentModeScaleAspectFill;
        _behindImageView.clipsToBounds = YES;
        [_scrollview addSubview:_behindImageView];
        [_scrollview  addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)]];
    }
    return _scrollview;
}
- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl.userInteractionEnabled = NO;
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        _pageControl.currentPage = 0;
        _pageControl.enabled = NO;
        _pageControl.currentPageIndicatorTintColor = _pageCurrentColor;
        _pageControl.pageIndicatorTintColor = _pageTintColor;
        [_pageControl sizeToFit];
        _pageControl.center=CGPointMake(_ww/2, _hh - 6);
    }
    return _pageControl;
}

#pragma mark -----------------  conterSizeOrFrame  -----------------

- (void)setScrollViewContentSize{
    if (_imageUrlArray.count>1) {
        _scrollview.contentSize = CGSizeMake(_ww * 5, _hh);
        _scrollview.contentOffset = CGPointMake(_ww * 2, 0);
        _pageControl.numberOfPages = _imageUrlArray.count;
        _currImageView.frame = CGRectMake(_ww * 2, 0, _ww, _hh);
    }else{
        _scrollview.contentSize = CGSizeZero;
        _scrollview.contentOffset = CGPointZero;
        _currImageView.frame = CGRectMake(0, 0, _ww, _hh);
    }
}
#pragma mark -----------------  系统代理  -----------------

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (CGSizeEqualToSize(CGSizeZero, scrollView.contentSize)) {
        return;
    }
    CGFloat offsetX = scrollView.contentOffset.x;
    [self changePagePosition:offsetX];
    
    if (offsetX < _ww * 2) {
        _behindImageView.frame = CGRectMake(_ww, 0, _ww, _hh);
        _nextIndex = _currIndex - 1;
        if (_nextIndex < 0) {
            _nextIndex  = _imageUrlArray.count - 1;
        }
        [_behindImageView yd_downloadImageUrl:_imageUrlArray[_nextIndex] placeholderImage:[UIImage imageNamed:_defaultImage]];
        if (offsetX <= _ww) {
            [self changeImage];
        }
    }else if (offsetX > _ww * 2){
        _behindImageView.frame = CGRectMake(CGRectGetMaxX(_currImageView.frame), 0, _ww, _hh);
        _nextIndex = (_currIndex + 1) % _imageUrlArray.count;
        [_behindImageView yd_downloadImageUrl:_imageUrlArray[_nextIndex] placeholderImage:[UIImage imageNamed:_defaultImage]];
        if (offsetX >= _ww * 3) {
            [self changeImage];
        }
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;{
    [self stopTime];//停止定时器
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint pointInSelf = [_scrollview convertPoint:_behindImageView.frame.origin toView:self];
    if (ABS(pointInSelf.x) != _ww) {
        CGFloat offsetX = _scrollview.contentOffset.x + pointInSelf.x;
        [self.scrollview setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    [self startTimer];//重新开启
}
#pragma mark -----------------  改变Page的页码  -----------------
- (void)changePagePosition:(CGFloat)offset{
    if (offset < _ww * 1.5) {
        NSInteger index = _currIndex - 1;
        if (index < 0) {
            index = _imageUrlArray.count - 1;
        }
    }else if (offset > _ww * 2.5){
        _pageControl.currentPage = (_currIndex + 1) % _imageUrlArray.count;
    }else{
        _pageControl.currentPage = _currIndex;
    }
}
#pragma mark -----------------  切换图片  -----------------
- (void)changeImage{
    _currImageView.image = _behindImageView.image;
    _scrollview.contentOffset = CGPointMake(_ww * 2, 0);
    [_scrollview layoutSubviews];
    _currIndex = _nextIndex;
    _pageControl.currentPage = _currIndex;
}
- (void)automaticRoll{
    [_scrollview   setContentOffset:CGPointMake(_ww * 3, 0) animated:YES];
}
#pragma mark -----------------  重写Set方法  -----------------

- (void)setImageUrlArray:(NSArray *)imageUrlArray{
    _imageUrlArray = imageUrlArray;
    if (_currIndex >= _imageUrlArray.count) _currIndex = _imageUrlArray.count - 1;
    if (imageUrlArray.count==0) {
        return;
    }
    [_currImageView yd_downloadImageUrl:_imageUrlArray[_currIndex] placeholderImage:[UIImage imageNamed:_defaultImage]];

}
- (void)setTime:(NSTimeInterval)time{
    _time = time;
    [self startTimer];
}
- (void)setPageCurrentColor:(UIColor *)pageCurrentColor{
    _pageControl.currentPageIndicatorTintColor = pageCurrentColor;
}
- (void)setPageTintColor:(UIColor *)pageTintColor{
    _pageControl.pageIndicatorTintColor = pageTintColor;
}
- (void)setDefaultImage:(NSString *)defaultImage{
    _defaultImage = defaultImage;
}

#pragma mark -----------------  定时器  -----------------
- (void)startTimer{
    if (_imageUrlArray.count<=1) {
        return;
    }
    if (_timer){
        [self stopTime];
    }
    _timer = [NSTimer timerWithTimeInterval:_time target:self selector:@selector(automaticRoll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)stopTime{
    [_timer invalidate];
    _timer = nil;
}
- (void)imageClick{
    [_delegate imageClickIndex:_currIndex];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
