//
//  GZGSpecialPerformanceCell.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpecialPerformanceCell.h"

@interface UIImage (SpecialPerformance)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end

@implementation UIImage (SpecialPerformance)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end

@implementation GZGSpecialPerformanceCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [GZGApplicationTool control_wide:328], [GZGApplicationTool control_height:420]);
        
        _typeImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:-5], [GZGApplicationTool control_height:-5], [GZGApplicationTool control_wide:133], [GZGApplicationTool control_height:142]);
            imageView;
        });
        _imageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:268], [GZGApplicationTool control_height:264]);
            imageView.image = [UIImage imageNamed:@"sy_mypic3.jpg"];
            imageView;
        });
        _commodityNameLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"爱他美pre段0-6个月800g", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            label.textColor = [UIColor blackColor];
            label.numberOfLines = 0;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:21]];
            CGSize size = [self computingSizeWithString:label.text forFont:label.font size: CGSizeMake([GZGApplicationTool control_wide:330], MAXFLOAT)];
            label.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:300], size.width, size.height);
            label;
        });
        _commodityNowPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"￥9999", nil);
            label.textColor = [@"e5007f" hexStringToColor];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:40])];
            label.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:300] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:30], size.width, size.height);
            label;
        });
        _commodityOriginalPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"￥9999", nil)];
            label.textColor = [GZGColorClass subjectShoppingCartOriginPriceColor];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:20])];
            label.frame = CGRectMake(self.commodityNowPriceLabel.frame.origin.x + self.commodityNowPriceLabel.frame.size.width, [GZGApplicationTool control_height:300] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:40], size.width, size.height);
            label;
        });
        _cartItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool control_wide:257], [GZGApplicationTool control_height:300] + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:48], [GZGApplicationTool control_height:39]);
            [btn setImage:[[UIImage imageNamed:@"QQG_ADD_GWC"] imageWithTintColor:[@"e5007f" hexStringToColor]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.commodityNameLabel];
        [self.contentView addSubview:self.commodityNowPriceLabel];
        [self.contentView addSubview:self.commodityOriginalPriceLabel];
        [self.contentView addSubview:self.self.cartItem];
        [self.contentView addSubview:self.typeImageView];
    }
    return self;
}
- (void)setType:(SpecialPerformanceType)type {
    
    switch (type) {
        case SpecialPerformanceTypeNone: {
            self.typeImageView.image = [UIImage imageNamed:@""];
        }
            break;
        case SpecialPerformanceTypeImprotedFrom: {
            self.typeImageView.image = [UIImage imageNamed:@"GlobalPurchaaingImportedFrom"];
        }
            break;
        case SpecialPerformanceTypeOfficialStraight: {
            self.typeImageView.image = [UIImage imageNamed:@"GlobalPurchaaingOfficialStraight"];
        }
            break;
        case SpecialPerformanceTypeSpecialPackagesMailed: {
            self.typeImageView.image = [UIImage imageNamed:@"GlobalPurchaaingSpecialPackagesMailed"];
        }
            break;
    }
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
