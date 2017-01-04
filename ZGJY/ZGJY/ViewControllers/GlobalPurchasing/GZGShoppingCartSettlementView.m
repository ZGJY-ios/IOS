//
//  GZGShoppingCartSettlementView.m
//  ZGJY
//
//  Created by HX on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGShoppingCartSettlementView.h"

@implementation GZGShoppingCartSettlementView

- (instancetype)initWithOriginY:(CGFloat)originY Height:(CGFloat)height {
    if (self = [super initWithFrame:CGRectMake(0, originY, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:height])]) {
        // 全选 title
        _futureGenerationsTitle = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:75], [GZGApplicationTool control_height:40]);
            label.text = NSLocalizedString(@"全选", nil);
            label.textColor = [UIColor blackColor];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            label;
        });
        // 全选 button
        _futureGenerationsItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool control_wide:105], [GZGApplicationTool control_height:30], [GZGApplicationTool control_height:40], [GZGApplicationTool control_height:40]);
            [btn setImage:[UIImage imageNamed:@"TheShoppingCartSelectHook"] forState:UIControlStateDisabled];
            [btn setImage:[UIImage imageNamed:@"TheShoppingCartNoHook"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"TheShoppingCartSelectHook"] forState:UIControlStateSelected];
            btn.enabled = NO;
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 0;
            btn;
        });
        // 合计 title
        _combinedTitle = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:186], [GZGApplicationTool control_height:13], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:30]);
            label.textAlignment = NSTextAlignmentLeft;
            label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"合计: ￥", nil) textColor:[UIColor blackColor] numberColor:[GZGColorClass subjectShoppingCartPriceColor]];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
            label;
        });
        // 合计 价格 title
        _combinedPriceTitle = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:13], [GZGApplicationTool control_wide:145], [GZGApplicationTool control_height:30]);
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [GZGColorClass subjectShoppingCartPriceColor];
            label.text = NSLocalizedString(@"0.00", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
            label;
        });
        // 运费 title
        _freightTitle = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:186], [GZGApplicationTool control_height:56], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:22]);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"含运费: ￥", nil) textColor:[UIColor blackColor] numberColor:[GZGColorClass subjectShoppingCartPriceColor]];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:20]];
            label;
        });
        // 运费 价格 title
        _freightPriceTitle = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:56], [GZGApplicationTool control_wide:145], [GZGApplicationTool control_height:22]);
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [GZGColorClass subjectShoppingCartPriceColor];
            label.text = NSLocalizedString(@"24.00", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:20]];
            label;
        });
        // 结算 item
        _settlementItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool control_wide:417], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:330], self.frame.size.height);
            [btn setTitle:NSLocalizedString(@"去结算", nil) forState:UIControlStateNormal];
            btn.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1;
            btn;
        });
        [self addSubview:self.futureGenerationsTitle]; // 全选 title
        [self addSubview:self.futureGenerationsItem]; // 全选 item
        [self addSubview:self.combinedTitle]; // 合计 title
        [self addSubview:self.combinedPriceTitle]; // 合计价格 title
//        [self addSubview:self.freightTitle]; // 运费 title
//        [self addSubview:self.freightPriceTitle]; // 运费价格 title
        [self addSubview:self.settlementItem]; // 结算 item
    }
    return self;
}

- (void)buttonClick:(UIButton *)btn {
    if (self.buttonClick) {
        self.buttonClick(btn);
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, [GZGApplicationTool control_wide:1.0]);
    CGContextSetStrokeColorWithColor(context, [GZGColorClass subjectGPSpellGroupDottedLineColor].CGColor);
    CGContextMoveToPoint(context, rect.origin.x , rect.origin.y );
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width ,rect.origin.y );
    CGContextStrokePath(context);
}

/**
 *  给字体添加不同的颜色
 */
- (NSMutableAttributedString *)attributedStringWithStringColorWithString:(NSString *)string textColor:(UIColor *)textColor numberColor:(UIColor *)numberColor {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableArray * components = (NSMutableArray *)[string componentsSeparatedByString:@" "];
    for (NSInteger i = 0; i < components.count; i++) {
        NSString * tempString = components[i];
        if ([tempString isEqualToString:@"$"] || [tempString isEqualToString:@"￥"]) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:numberColor range:[string rangeOfString:tempString]];
        } else {
            [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:[string rangeOfString:tempString]];
        }
    }
    return attributedString;
}

@end
