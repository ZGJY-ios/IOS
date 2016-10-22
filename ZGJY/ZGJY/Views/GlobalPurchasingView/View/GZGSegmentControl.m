//
//  GZGSegmentControl.m
//  ZGJY
//
//  Created by HX on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSegmentControl.h"

@interface NSString (Size2)

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end

@implementation NSString (Size2)

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero))
    {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        
        textSize = [self sizeWithAttributes:attributes];
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:size
                                         options:option
                                      attributes:attributes
                                         context:nil];
        
        textSize = rect.size;
    }
    return textSize;
}

@end


@interface GZGTableViewCell2 : UITableViewCell

@property(nonatomic,readonly) UILabel *cellTextLabel;
@property(nonatomic,strong) UIImageView *cellAccessoryView;

-(void)setCellText:(NSString *)text align:(NSString*)align;

@end

@implementation GZGTableViewCell2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _cellTextLabel = [[UILabel alloc] init];
        _cellTextLabel.textAlignment = NSTextAlignmentCenter;
        _cellTextLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20.0f]];
        [self addSubview:_cellTextLabel];
    }
    return self;
}

-(void)setCellText:(NSString *)text align:(NSString*)align{
    
    _cellTextLabel.text = text;
    // 只取宽度
    CGSize textSize = [text textSizeWithFont:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]] constrainedToSize:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_wide:20]) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat marginX = 20;
    
    if (![@"left" isEqualToString:align]) {
        marginX = (self.frame.size.width-textSize.width)/2;
    }
    
    _cellTextLabel.frame = CGRectMake(marginX, 0, textSize.width, self.frame.size.height);
    NSLog(@"textSize.width = %f",textSize.width);
    if(_cellAccessoryView){
        _cellAccessoryView.frame = CGRectMake(_cellTextLabel.frame.origin.x+_cellTextLabel.frame.size.width+10, (self.frame.size.height-12)/2, 16, 12);
    }
}

-(void)setCellAccessoryView:(UIImageView *)accessoryView{
    
    if (_cellAccessoryView) {
        [_cellAccessoryView removeFromSuperview];
    }
    
    _cellAccessoryView = accessoryView;
    
    _cellAccessoryView.frame = CGRectMake(_cellTextLabel.frame.origin.x+_cellTextLabel.frame.size.width+10, (self.frame.size.height-12)/2, 16, 12);
    
    [self addSubview:_cellAccessoryView];
}

@end

@implementation GZGSegmentControlItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.label];
        [self addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame  = CGRectInset(self.bounds, 10, 8);
    self.line.frame   = CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y + self.label.frame.size.height + 6, self.label.frame.size.width, 1);
}

#pragma mark - getters and setters
- (UILabel *)label {
    if (_label == nil) {
        _label               = [[UILabel alloc] init];
        _label.font          = [_label.font fontWithSize:[GZGApplicationTool control_wide:30.0]];
        _label.minimumScaleFactor = 12.0 / _label.font.pointSize;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor     = [UIColor blackColor];
    }
    return _label;
}

- (UILabel *)line {
    if (_line == nil) {
        _line = [[UILabel alloc] init];
    }
    return _line;
}
@end

@interface GZGSegmentControl () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UILabel *scrolLine;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic) BOOL show;
@end
@implementation GZGSegmentControl
- (void)layoutSubviews {
    [super layoutSubviews];
    GZGSegmentControlItem *item = self.items[self.selectedIndex];
    CGRect location = [item.line convertRect:item.line.bounds toView:self];
    self.scrolLine.frame = location;

}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //tableView init
        _origin = self.frame.origin;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, 0, 0) style:UITableViewStyleGrouped];
        _tableView.rowHeight = [GZGApplicationTool control_height:70];
        _tableView.separatorColor = [UIColor colorWithRed:220.f/255.0f green:220.f/255.0f blue:220.f/255.0f alpha:1.0];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        
        //background init and tapped
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, [GZGApplicationTool screenWide] , [GZGApplicationTool screenHeight])];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _backGroundView.opaque = NO;
        UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
        [_backGroundView addGestureRecognizer:gesture];
    }
    return self;
}
#pragma mark - private methods
- (void)segmentSelected:(GZGSegmentControlItem *)sender {
    
    self.selectedIndex = sender.tag;
}

#pragma mark - getters and setters
- (UILabel *)scrolLine {
    if (_scrolLine == nil) {
        _scrolLine = [[UILabel alloc] init];
        _scrolLine.backgroundColor = [UIColor colorWithRed:187/255.0 green:53/255.0 blue:53/255.0 alpha:1.0];
    }
    return _scrolLine;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    SegmentType type = SegmentTypeComprehensive;
    
    if (self.hasLine && ![self.subviews containsObject:self.scrolLine]) {
        [self addSubview:self.scrolLine];
    }
    
    for (int i = 0; i < self.titles.count; i++) {
        GZGSegmentControlItem *item = self.items[i];
        id indicator = self.indicators[i];
        if (selectedIndex != i) {
            item.label.textColor = [UIColor blackColor];
            if ([item.label.text isEqualToString:@"综合"] || [item.label.text isEqualToString:@"新品"]) {
                ((CAShapeLayer *)indicator).fillColor = [UIColor blackColor].CGColor;
            } else if ([item.label.text isEqualToString:@"价格"]) {
                CAShapeLayer * upIndicator = ((NSDictionary *)indicator)[@"up"];
                CAShapeLayer * downIndicator = ((NSDictionary *)indicator)[@"down"];
                upIndicator.fillColor = [UIColor blackColor].CGColor;
                downIndicator.fillColor = [UIColor blackColor].CGColor;
            }
        } else {
            item.label.textColor = [GZGColorClass subjectSearchListSelectedTextColor];
            if ([item.label.text isEqualToString:@"综合"] || [item.label.text isEqualToString:@"新品"]) {
                type = SegmentTypeComprehensive;
                _indicator = (CAShapeLayer *)indicator;
                if (CGColorEqualToColor(((CAShapeLayer *)_indicator).fillColor, [UIColor blackColor].CGColor)) {
                    ((CAShapeLayer *)_indicator).fillColor = [GZGColorClass subjectSearchListSelectedTextColor ].CGColor;
                } else {
                    [self animateIdicator:(CAShapeLayer *)_indicator background:_backGroundView tableView:_tableView forward:!_show complecte:^{
                        _show = !_show;
                    }];
                }
            } else if ([item.label.text isEqualToString:@"价格"]) {
                CAShapeLayer * upIndicator = ((NSDictionary *)indicator)[@"up"];
                CAShapeLayer * downIndicator = ((NSDictionary *)indicator)[@"down"];
                if (CGColorEqualToColor(upIndicator.fillColor, [UIColor blackColor].CGColor)) {
                    upIndicator.fillColor = [GZGColorClass subjectSearchListSelectedTextColor ].CGColor;
                    downIndicator.fillColor = [UIColor blackColor].CGColor;
                    type = SegmentTypePriceHigh;
                } else if (CGColorEqualToColor(downIndicator.fillColor, [UIColor blackColor].CGColor) && CGColorEqualToColor(upIndicator.fillColor, [GZGColorClass subjectSearchListSelectedTextColor ].CGColor)) {
                    upIndicator.fillColor = [UIColor blackColor].CGColor;
                    downIndicator.fillColor = [GZGColorClass subjectSearchListSelectedTextColor ].CGColor;
                    type = SegmentTypePriceLow;
                }
                _show = NO;
            } else if ([item.label.text isEqualToString:@"销量"]) {
                type = SegmentTypeSales;
                _show = NO;
            } else if ([item.label.text isEqualToString:@"评价"]) {
                type = SegmentTypeEvaluation;
                _show = NO;
            }
            
            if (!_show) {
                if (_indicator) {
                    [self animateIdicator:(CAShapeLayer *)_indicator background:_backGroundView tableView:_tableView forward:_show complecte:^{
                        _show = NO;
                    }];
                    
                }
            }
            
            if (self.hasLine) {
                [UIView animateWithDuration:0.2 animations:^{
                    CGRect location = [item.line convertRect:item.line.bounds toView:self];
                    self.scrolLine.frame = location;
                }];
            }
            
            [_delegate segmentItemSelected:type];
        }
    }
}

- (void)setTitles:(NSArray *)titles {
    _show = NO;
    _titles = [titles copy];
    
    NSMutableArray *segmentArr = [[NSMutableArray alloc] init];
    NSMutableArray *tempIndicators = [[NSMutableArray alloc] init];
    NSInteger count = titles.count;
    CGFloat width = self.frame.size.width / count;
    self.backgroundColor = [UIColor clearColor];
    for (int i = 0; i < count; i++) {
        GZGSegmentControlItem *segmentItem = [[GZGSegmentControlItem alloc] init];
        segmentItem.frame        = CGRectMake(i * width, 0, width, self.frame.size.height);
        segmentItem.tag          = i;
        segmentItem.label.text   = _titles[i];
        
        if ([segmentItem.label.text isEqualToString:@"价格"]) {
            NSInteger rotio1,rotio2;
            if ([GZGApplicationTool screenHeight] == 568) {
                rotio1 = self.frame.size.height / 3 - 2,rotio2 = self.frame.size.height / 3 + 3;
            } else if ([GZGApplicationTool screenHeight] == 667) {
                rotio1 = self.frame.size.height / 2.5 - 4,rotio2 = self.frame.size.height / 2.5 + 1;
            } else if ([GZGApplicationTool screenHeight] == 736) {
                rotio1 = self.frame.size.height / 2.7 - 2,rotio2 = self.frame.size.height / 2.7 + 4;
            }
            CGSize size = [self calculateTitleSizeWithString:segmentItem.label.text];
            CAShapeLayer * upIndicator = [self createUpIndicatorWithColor:[UIColor blackColor] andPosition:CGPointMake((width + size.width - 10) / 2, rotio1)];
            [segmentItem.label.layer addSublayer:upIndicator];
            CAShapeLayer * downIndicator = [self createDownIndicatorWithColor:[UIColor blackColor] andPosition:CGPointMake((width + size.width - 10) / 2, rotio2)];
            [segmentItem.label.layer addSublayer:downIndicator];
            NSDictionary * dic = @{@"up":upIndicator,@"down":downIndicator};
            [tempIndicators addObject:dic];
        } else {
            NSInteger rotio;
            if ([GZGApplicationTool screenHeight] == 568) {
                rotio = self.frame.size.height / 3;
            } else if ([GZGApplicationTool screenHeight] == 667) {
                rotio = self.frame.size.height / 2.5 - 3;
            } else if ([GZGApplicationTool screenHeight] == 736) {
                rotio = self.frame.size.height / 2.7 + 2;
            }
            CGSize size = [self calculateTitleSizeWithString:segmentItem.label.text];
            UIColor * color = self.backgroundColor;
            if ([segmentItem.label.text isEqualToString:@"综合"] || [segmentItem.label.text isEqualToString:@"新品"]) {
                color = [UIColor blackColor];
            }
            CAShapeLayer *indicator = [self createDownIndicatorWithColor:color andPosition:CGPointMake((width + size.width - 10) / 2, rotio )];
            [segmentItem.label.layer addSublayer:indicator];
            [tempIndicators addObject:indicator];
        }
        [self addSubview:segmentItem];
        [segmentArr addObject:segmentItem];
        [segmentItem addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _indicators = [tempIndicators copy];
    _items = [segmentArr copy];
}
- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    CGFloat fontSize = [GZGApplicationTool control_wide:30];
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, [GZGApplicationTool control_wide:1.0]);
    CGContextSetStrokeColorWithColor(context, [GZGColorClass subjectGPSpellGroupDottedLineColor].CGColor);
    CGContextMoveToPoint(context, rect.origin.x , rect.origin.y );
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width ,rect.origin.y );
    CGContextStrokePath(context);
    
    CGContextRef context2 =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context2);
    CGContextSetLineWidth(context2, [GZGApplicationTool control_wide:1.0]);
    CGContextSetStrokeColorWithColor(context2, [GZGColorClass subjectGPSpellGroupDottedLineColor].CGColor);
    CGContextMoveToPoint(context2, rect.origin.x , rect.origin.y + rect.size.height );
    CGContextAddLineToPoint(context2, rect.origin.x + rect.size.width ,rect.origin.y + rect.size.height );
    CGContextStrokePath(context2);
}
- (CAShapeLayer *)createDownIndicatorWithColor:(UIColor *)color andPosition:(CGPoint)point {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake([GZGApplicationTool control_wide:8], 0)];
    [path addLineToPoint:CGPointMake([GZGApplicationTool control_wide:4], [GZGApplicationTool control_wide:5])];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = [GZGApplicationTool control_wide:1];
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    
    CGPathRelease(bound);
    
    layer.position = point;
    
    return layer;
}

- (CAShapeLayer *)createUpIndicatorWithColor:(UIColor *)color andPosition:(CGPoint)point {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake([GZGApplicationTool control_wide:4], 0)];
    [path addLineToPoint:CGPointMake([GZGApplicationTool control_wide:0], [GZGApplicationTool control_wide:5])];
    [path addLineToPoint:CGPointMake([GZGApplicationTool control_wide:8], [GZGApplicationTool control_wide:5])];
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = [GZGApplicationTool control_wide:1];
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    
    CGPathRelease(bound);
    
    layer.position = point;
    
    return layer;
}
#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSource control:self numberOfRowsInColum:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"SegmentControlCell";
    GZGTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GZGTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setCellText:[_dataSource control:self titleForRowAtIndexPath:indexPath] align:@"left"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate || [_delegate respondsToSelector:@selector(control:didSelectRowAtIndexPath:)]) {
        [_delegate control:self didSelectRowAtIndexPath:indexPath];
        [self confiMenuWithSelectRow:indexPath.row];
    }
}
#pragma mark - 自己的方法
- (void)confiMenuWithSelectRow:(NSInteger)row{
    NSString *title = [_dataSource control:self titleForColumn:0];
    NSString * interTitle = [title substringWithRange:NSMakeRange(0, 2)];
    GZGSegmentControlItem * item = _items[0];
    item.label.text = interTitle;
    if (_show) {
        if (_indicator) {
            [self animateIdicator:(CAShapeLayer *)_indicator background:_backGroundView tableView:_tableView forward:!_show complecte:^{
                _show = NO;
            }];
        }
    }
}
- (void)backgroundTapped:(UITapGestureRecognizer *)paramSender
{
    [self animateIdicator:(CAShapeLayer *)_indicator background:_backGroundView tableView:_tableView forward:NO complecte:^{
        _show = NO;
    }];
}

#pragma mark - animation method
- (void)animateIndicator:(CAShapeLayer *)indicator Forward:(BOOL)forward complete:(void(^)())complete {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = forward ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    
    if (!anim.removedOnCompletion) {
        [indicator addAnimation:anim forKey:anim.keyPath];
    } else {
        [indicator addAnimation:anim forKey:anim.keyPath];
        [indicator setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    
    [CATransaction commit];
    
    complete();
}
- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(void(^)())complete {
    if (show) {
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
    complete();
}
- (void)animateIdicator:(CAShapeLayer *)indicator background:(UIView *)background tableView:(UITableView *)tableView forward:(BOOL)forward complecte:(void(^)())complete{
    
    [self animateIndicator:indicator Forward:forward complete:^{
        [self animateBackGroundView:background show:forward complete:^{
            [self animateTableView:tableView show:forward complete:^{
            }];
        }];
    }];
    
    complete();
}
/**
 *动画显示下拉菜单
 */
- (void)animateTableView:(UITableView *)tableView show:(BOOL)show complete:(void(^)())complete {
    
    CGFloat ratio = 1;
    
    if (show) {
        
        CGFloat tableViewHeight = 0;
        
        
        if (tableView) {
            
            tableView.frame = CGRectMake(_origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width*ratio, 0);
            [self.superview addSubview:tableView];
            
            tableViewHeight = ([tableView numberOfRowsInSection:0] > 5) ? (5 * tableView.rowHeight) : ([tableView numberOfRowsInSection:0] * tableView.rowHeight);
            
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            if (tableView) {
                tableView.frame = CGRectMake(_origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width*ratio, tableViewHeight);
            }
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            
            if (tableView) {
                tableView.frame = CGRectMake(_origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width*ratio, 0);
            }
            
        } completion:^(BOOL finished) {
            
            if (tableView) {
                [tableView removeFromSuperview];
            }
        }];
    }
    complete();
}
@end
