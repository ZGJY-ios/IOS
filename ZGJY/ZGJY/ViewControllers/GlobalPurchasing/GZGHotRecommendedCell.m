//
//  GZGHotRecommendedCell.m
//  ZGJY
//
//  Created by HX on 16/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGHotRecommendedCell.h"

@implementation GZGHotRecommendedCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [GZGApplicationTool control_wide:355], [GZGApplicationTool control_height:477]);
        _imageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:113], [GZGApplicationTool control_height:57], [GZGApplicationTool control_wide:160], [GZGApplicationTool control_height:260]);
            imageView.image = [UIImage imageNamed:@"热门推荐.jpg"];
            imageView;
        });
        _commodityNameLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"爱他美pre段0-6个月800g", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            label.textColor = [UIColor blackColor];
            label.numberOfLines = 0;
            CGSize size = [self computingSizeWithString:label.text forFont:label.font size: CGSizeMake([GZGApplicationTool control_wide:330], MAXFLOAT)];
            label.frame = CGRectMake([GZGApplicationTool control_wide:37], [GZGApplicationTool control_height:326], size.width, size.height);
            label;
        });
        _commodityNowPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"￥218", nil);
            label.textColor = [GZGColorClass subjectShoppingCartPriceColor];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:40])];
            label.frame = CGRectMake([GZGApplicationTool control_wide:37], [GZGApplicationTool control_height:326] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:30], size.width, size.height);
            label;
        });
        _commodityOriginalPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"￥280", nil)];
            label.textColor = [GZGColorClass subjectShoppingCartOriginPriceColor];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:20])];
            label.frame = CGRectMake(self.commodityNowPriceLabel.frame.origin.x + self.commodityNowPriceLabel.frame.size.width, [GZGApplicationTool control_height:326] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:40], size.width, size.height);
            label;
        });
        _cartItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool control_wide:287], [GZGApplicationTool control_height:326] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:48], [GZGApplicationTool control_height:39]);
            [btn setImage:[UIImage imageNamed:@"QQG_ADD_GWC"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.commodityNameLabel];
        [self.contentView addSubview:self.commodityNowPriceLabel];
        [self.contentView addSubview:self.commodityOriginalPriceLabel];
        [self.contentView addSubview:self.self.cartItem];
    }
    return self;
}
- (void)buttonClick:(UIButton *)btn {
    NSLog(@"添加进购物车");
}
- (CGSize)computingSizeWithString:(NSString *)string forFont:(UIFont *)font size:(CGSize)originSize {
    
    NSDictionary * dict = @{NSFontAttributeName : font};
    
    CGSize size = [string boundingRectWithSize:originSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    return size;
}
/**
 *  给字符串添加横线
 */
- (NSMutableAttributedString *)attributedStringHorzontalLineWithString:(NSString *)string {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}

@end
