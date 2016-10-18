//
//  SpellGroupCell.m
//  ZGJY
//
//  Created by HX on 16/9/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpellGroupCell.h"

@interface GZGSpellGroupView : UIView

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * commodityNameLabel; // 商品
@property (nonatomic, strong) UILabel * commodityoriginLabel; // 产地
@property (nonatomic, strong) UILabel * limitLabel; // 限制
@property (nonatomic, strong) UILabel * soldLabel; // 已售
@property (nonatomic, strong) UILabel * remainingLabel; // 剩余
@property (nonatomic, strong) UILabel * nowPriceLabel; // 现价
@property (nonatomic, strong) UILabel * marketPriceLabel; // 市场价
@property (nonatomic, strong) UIButton * replenishOnrButton; // 进货
@property (nonatomic, strong) UIProgressView * progressView; // 进度条
@property (nonatomic, strong) UILabel * percentageLabel; // 百分比
@property (nonatomic, strong) NSMutableArray * commodityLabels;
@property (nonatomic, copy) void(^buttonClickBlock)(UIButton * button);
@end

@implementation GZGSpellGroupView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [GZGColorClass subjectGPSpellGroupDottedLineColor].CGColor);
    CGFloat lengths[] = {1,2};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:90], [GZGApplicationTool control_wide:70]);
    CGContextAddLineToPoint(context, [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:20] ,[GZGApplicationTool control_wide:70]);
    CGContextStrokePath(context);
}
- (void)buildUI {
    
    self.imageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:160]);
        imageView.backgroundColor = [UIColor yellowColor];
        imageView;
    });
    self.soldLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:90], [GZGApplicationTool control_wide:35], [GZGApplicationTool control_wide:82], [GZGApplicationTool control_height:20]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupSoldBackgroundColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:10]];
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"已售 ?? 件", nil) textColor:[GZGColorClass subjectGPSpellGroupSoldAndRemainingTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
        label;
    });
    self.remainingLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.soldLabel.frame.origin.x + self.soldLabel.frame.size.width, [GZGApplicationTool control_wide:35], [GZGApplicationTool control_wide:82], [GZGApplicationTool control_height:20]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupRemainingBackgroundColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:14]];
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"剩余 ?? 件", nil) textColor:[GZGColorClass subjectGPSpellGroupSoldAndRemainingTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
        label;
    });
    self.commodityNameLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:20] - [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:20]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:16]];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [GZGColorClass subjectGPSpellGroupGoodsTextColor];
        label.text = NSLocalizedString(@"商品详情", nil);
        label;
    });
    self.commodityoriginLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:20] - [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:84], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:20]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:12]];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [GZGColorClass subjectGPSpellGroupGoodsTextColor];
        label.text = NSLocalizedString(@"原产地(地区)：韩国", nil);
        label;
    });
    self.nowPriceLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:125], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:26]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [GZGColorClass subjectGPSpellGroupTitleColor];
        label.text = NSLocalizedString(@"￥118", nil);
        label;
    });
    self.marketPriceLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:180], [GZGApplicationTool control_height:125], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:26]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:12]];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [GZGColorClass subjectGPSpellGroupGoodsTextColor];
        label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"市场价:￥240", nil)];
        label;
    });
    self.limitLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:146], [GZGApplicationTool control_height:124], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:26]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupLimitBackgroundColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:12]];
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"?? 件起享受团购价", nil) textColor:[GZGColorClass subjectGPSpellGroupLimitTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
        label;
    });
    self.replenishOnrButton = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:151], [GZGApplicationTool control_height:150], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:35]);
        button.backgroundColor = [GZGColorClass subjectGPSpellGroupReplenishOnrNormalBackgroundColor];
        [button setTitle:NSLocalizedString(@"马上进货", nil) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    UILabel * alreadySnapUpLabel = ({
        UILabel * label = [[UILabel alloc]init];
        label.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:165], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20]);
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:14]];
        label.textColor = [GZGColorClass subjectGPSpellGroupGoodsTextColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = NSLocalizedString(@"已抢购", nil);
        label;
    });
    self.progressView = ({
        UIProgressView * progressView = [[UIProgressView alloc] init];
        progressView.frame = CGRectMake(alreadySnapUpLabel.frame.origin.x + alreadySnapUpLabel.frame.size.width, [GZGApplicationTool control_height:173], [GZGApplicationTool control_wide:140], [GZGApplicationTool control_height:20]);
        progressView.progressViewStyle = UIProgressViewStyleDefault;
        progressView.progressTintColor = [GZGColorClass subjectGPSpellGroupProgressTintColor];
        progressView.progress = 0;
        progressView;
    });
    self.percentageLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.progressView.frame.origin.x + self.progressView.frame.size.width + [GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:165], [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:20]);
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:14]];
        label.textColor = [GZGColorClass subjectGPSpellGroupPercentageTextColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = NSLocalizedString(@"0%", nil);
        label;
    });
    
    
    
    [self addSubview:self.imageView];
    [self addSubview:self.soldLabel];
    [self addSubview:self.remainingLabel];
    [self addSubview:self.commodityNameLabel];
    [self addSubview:self.commodityoriginLabel];
    [self addSubview:self.nowPriceLabel];
    [self addSubview:self.marketPriceLabel];
    [self addSubview:self.limitLabel];
    [self addSubview:alreadySnapUpLabel];
    [self addSubview:self.progressView];
    [self addSubview:self.replenishOnrButton];
    [self addSubview:self.percentageLabel];
}
- (void)setModel {
    self.imageView.image = [UIImage imageNamed:@""];
    self.soldLabel.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"已售 ?? 件", nil) textColor:[GZGColorClass subjectGPSpellGroupSoldAndRemainingTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
    self.remainingLabel.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"剩余 ?? 件", nil) textColor:[GZGColorClass subjectGPSpellGroupSoldAndRemainingTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
    self.commodityNameLabel.text = NSLocalizedString(@"商品详情", nil);
    self.commodityoriginLabel.text = NSLocalizedString(@"原产地(地区)：韩国", nil);
    self.nowPriceLabel.text = NSLocalizedString(@"￥118", nil);
    self.marketPriceLabel.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"市场价:￥240", nil)];
    self.limitLabel.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"?? 件起享受团购价", nil) textColor:[GZGColorClass subjectGPSpellGroupLimitTextColor] numberColor:[GZGColorClass subjectGPSpellGroupTitleColor]];
    self.progressView.progress = 2.0 / 3;
    self.percentageLabel.text = [NSString stringWithFormat:@"%.f",100 * self.progressView.progress];
    
    // 商品标签
    _commodityLabels = [NSMutableArray arrayWithArray:@[@"香味持久",@"滋润去屑",@"自然健康"]];
    for (NSInteger i = 0; i < _commodityLabels.count; i ++) {
        UILabel * commodityLabel = [[UILabel alloc] init];
        commodityLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + [GZGApplicationTool control_wide:93] + [GZGApplicationTool control_wide:54] * i, [GZGApplicationTool control_height:85], [GZGApplicationTool control_wide:44], [GZGApplicationTool control_height:16]);
        commodityLabel.text = NSLocalizedString(_commodityLabels[i], nil);
        commodityLabel.textColor = [GZGColorClass subjectGPSpellGroupGoodsLabelColor];
        commodityLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:9]];
        commodityLabel.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        commodityLabel.layer.borderWidth = 0.5;
        commodityLabel.layer.borderColor = [GZGColorClass subjectGPSpellGroupGoodsLabelColor].CGColor;
        commodityLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:commodityLabel];
    }
}
#pragma mark - 自己的方法
- (void)buttonClick:(UIButton *)button {
    if (self.buttonClickBlock) {
        self.buttonClickBlock(button);
    }
}
/**
 *  给字符串添加横线
 */
- (NSMutableAttributedString *)attributedStringHorzontalLineWithString:(NSString *)string {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}
/**
 *  给字体添加不同的颜色
 */
- (NSMutableAttributedString *)attributedStringWithStringColorWithString:(NSString *)string textColor:(UIColor *)textColor numberColor:(UIColor *)numberColor {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableArray * components = (NSMutableArray *)[string componentsSeparatedByString:@" "];
    for (NSInteger i = 0; i < components.count; i++) {
        NSString * tempString = components[i];
        if ([tempString isEqualToString:@"??"] || [self isDigital:tempString]) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:numberColor range:[string rangeOfString:tempString]];
        } else {
            [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:[string rangeOfString:tempString]];
        }
    }
    return attributedString;
}
// 判断是否为数字
- (BOOL)isDigital:(NSString *)string {
    if( ![self isPureInt:string] || ![self isPureFloat:string]) {
        return NO;
    }
    return YES;
}
// 判断是否为整形
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

- (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

@end

@interface GZGSpellGroupCell ()

@property (nonatomic, strong) GZGSpellGroupView * spellGroupView;

@end

@implementation GZGSpellGroupCell

+ (instancetype)dequeueReusableCellWithIdentifier:(NSString *)reuseIdentifier withTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    GZGSpellGroupCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModel {
    [_spellGroupView setModel];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildUI];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,[GZGApplicationTool screenWide], [GZGApplicationTool control_height:210-1]);
        [self buildUI];
    }
    return self;
}
- (void)buildUI {
    
    _spellGroupView = [[GZGSpellGroupView alloc] initWithFrame:self.frame];
    _spellGroupView.backgroundColor = [GZGColorClass subjectGPSpellGroupBackgroundColor];
    __weak GZGSpellGroupCell * weakSelf = self;
    _spellGroupView.buttonClickBlock = ^(UIButton * button) {
        [weakSelf spellGroupClick:button];
    };
    [self.contentView addSubview:_spellGroupView];
}
- (void)spellGroupClick:(UIButton *)button {
    if (self.GZGSpellGroupCellBlock) {
        self.GZGSpellGroupCellBlock(button);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
