//
//  SpellGroupCell.m
//  ZGJY
//
//  Created by HX on 16/9/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpellGroupCell.h"

@interface GZGSpellGroupView : UIView

@property (nonatomic, strong) UIImageView * imageView;//商品图片
@property (nonatomic, strong) UIButton * replenishOnrButton; // 进货
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
- (void)buildUI {
    
    self.imageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:220], [GZGApplicationTool control_height:160]);
        imageView;
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
    
    
    
    [self addSubview:self.imageView];
    [self addSubview:self.replenishOnrButton];
}
- (void)setModel:(UIImage *)imagex {
    
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

- (void)setModel:(UIImage *)imagex {
    [_spellGroupView setModel:imagex];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildUI];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,[GZGApplicationTool screenWide], [GZGApplicationTool control_height:235.0f-1]);
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
