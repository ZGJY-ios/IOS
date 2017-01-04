//
//  YDTopTitleRolling.m
//  Testxxfsfd
//
//  Created by 刘亚栋 on 2016/10/22.
//  Copyright © 2016年 刘亚栋. All rights reserved.
//

#import "YDTopTitleRolling.h"

static NSInteger const TopTitleLabTag = 9910;

@interface YDTopTitleRolling()<UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UILabel *titleLab;
@property(nonatomic, strong) UIView *topTitleLine;
@property(nonatomic, strong) NSArray *titleArray;
@property(nonatomic, strong) UIColor *selectColor;
@property(nonatomic, strong) UIColor *defauleColor;
@property(nonatomic, strong) UIFont *titlesFont;
@property(nonatomic, assign) CGFloat titleSpacing;
@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic,assign) NSInteger index;

@end
@implementation YDTopTitleRolling

- (instancetype)initWithFrame:(CGRect)frame
                topTitleArray:(NSArray *)topTitleArray
                  selectColor:(UIColor *)selectColor
                 defauleColor:(UIColor *)defaulrColor
                    titleFont:(UIFont *)titleFont
                 titleSpacing:(CGFloat)titleSpacing
                    lineWidth:(CGFloat)lineWidth{
    
    if (self = [super initWithFrame:frame]) {
        //默认颜色
        _titleArray = topTitleArray;
        _selectColor = selectColor;
        _defauleColor = defaulrColor;
        _titlesFont = titleFont;
        _titleSpacing = titleSpacing;
        _lineWidth = lineWidth;
        
        [self scrollTitleArr];
    }
    return self;
}

- (CGSize)textSize:(NSString *)text font:(UIFont *)font size:(CGFloat)size{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize questionSize = [text boundingRectWithSize:CGSizeMake(size, MAXFLOAT)  options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return questionSize;
}


- (void)scrollTitleArr{

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    [self addSubview:_scrollView];
    
    CGFloat labelY = 0;
    CGFloat labelH = self.frame.size.height - 2;
    CGFloat countIndex = 0;
    for (NSInteger i=0; i<_titleArray.count; i++) {
        
        CGSize titleSize = [self textSize:_titleArray[i] font:_titlesFont size:self.frame.size.width];
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(countIndex, labelY, titleSize.width, labelH)];
        titleLab.text = _titleArray[i];
        titleLab.highlightedTextColor = _selectColor;
        titleLab.textColor = _defauleColor;
        titleLab.font = _titlesFont;
        titleLab.userInteractionEnabled = YES;
        titleLab.tag = i + TopTitleLabTag;
        countIndex += titleSize.width + _titleSpacing;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollTitleClick:)];
        [titleLab addGestureRecognizer:tap];
        
        if (i == 0) {
            titleLab.textColor = _selectColor;
        }
         [_scrollView addSubview:titleLab];
    }
    _index = countIndex;
    UILabel *firstLab = _scrollView.subviews.firstObject;
    CGFloat hh = _scrollView.frame.size.height + _scrollView.frame.origin.y, ww = [self textSize:firstLab.text font:[UIFont systemFontOfSize:[GZGApplicationTool control_height:26]] size:self.frame.size.width].width;
    _topTitleLine = [[UIView alloc] init];
    _topTitleLine.backgroundColor = _selectColor;
    _topTitleLine.frame = CGRectMake(0, hh - [GZGApplicationTool control_height:25], ww, _lineWidth);
    [_scrollView addSubview:_topTitleLine];

    _scrollView.contentSize = CGSizeMake(countIndex, self.frame.size.height);
    
}
/**
 点击事件

 @param tap 传入的Lab
 */
- (void)scrollTitleClick:(UITapGestureRecognizer *)tap{
    UILabel *labelTitle = (UILabel *)tap.view;
    [self changeTitleColor:labelTitle];
    [self scrollTitleLabelSelectededCenter:labelTitle];
    [self.delegate titleRollingIndex:labelTitle.tag - TopTitleLabTag];
}

/**
 文字颜色改变

 @param label 传入的Lab
 */
- (void)changeTitleColor:(UILabel *)label{
    [self titleColorChange:label];

    CGFloat hh = _scrollView.frame.size.height + _scrollView.frame.origin.y;
    // 改变指示器位置
    [UIView animateWithDuration:0.20 animations:^{
        _topTitleLine.frame = CGRectMake(label.frame.origin.x, hh - [GZGApplicationTool control_height:25], label.frame.size.width, _lineWidth);
    }];
}
/**
 设置文字位置滚动

 @param centerLabel 传入的Lab
 */
- (void)scrollTitleLabelSelectededCenter:(UILabel *)centerLabel {
    
    [self topTitleLab:centerLabel];
}

- (void)titleColorChange:(UILabel *)lab{
    for (NSInteger i=0; i<_titleArray.count; i++) {
        UILabel *selectLabColor = (UILabel *)[self viewWithTag:i + TopTitleLabTag];
        selectLabColor.textColor = _defauleColor;
        selectLabColor.highlighted = NO;
    }
    UILabel *selectLabColor = (UILabel *)[self viewWithTag:lab.tag];
    selectLabColor.textColor = _selectColor;
}

- (void)scrollViewCenterlabel:(UILabel *)lab{
    [self topTitleLab:lab];
    CGFloat hh = _scrollView.frame.size.height + _scrollView.frame.origin.y;
    // 改变指示器位置
    [UIView animateWithDuration:0.20 animations:^{
        _topTitleLine.frame = CGRectMake(lab.frame.origin.x, hh - [GZGApplicationTool control_height:25], lab.frame.size.width, _lineWidth);
    }];
    [self titleColorChange:lab];

}

- (void)topTitleLab:(UILabel *)lab{
    if (_index <= self.frame.size.width) {
        return;
    }
    CGFloat ww = [UIScreen mainScreen].bounds.size.width;
    CGFloat offsetX = lab.center.x - ww * 0.5;
    if (offsetX < 0) offsetX = 0;
    CGFloat maxOffsetX = _scrollView.contentSize.width - ww;
    if (offsetX > maxOffsetX){
        offsetX = maxOffsetX;
    }
    [_scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

