//
//  GZGConfirmOrderCell.m
//  ZGJY
//
//  Created by HX on 16/10/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGConfirmOrderCell.h"

@implementation GZGReceivingInformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation GZGDeliveryOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.commodityImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:45], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:125]);
            imageView.image = [UIImage imageNamed:@"searchList-icon2"];
            imageView;
        });
        self.commodityNameLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"BABY专享尊贵体内平衡益生菌胶囊益生菌", nil);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [self computingSizeWithString:label.text forFont:label.font];
            label.numberOfLines = 0;
            label.frame = CGRectMake([GZGApplicationTool control_wide:160], [GZGApplicationTool control_height:45], size.width, size.height);
            label;
        });
        self.commodityPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"￥188.00", nil);
            label.textColor = [GZGColorClass subjectGPSpellGroupTitleColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:45], size.width, size.height);
            label;
        });
        self.commodityNumberLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"x 2", nil);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:75], size.width, size.height);
            label;
        });
        self.commodityRateLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"税率：35%", nil);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:126], size.width, size.height);
            label;
        });
        
        [self.contentView addSubview:self.commodityImageView];
        [self.contentView addSubview:self.commodityNameLabel];
        [self.contentView addSubview:self.commodityPriceLabel];
        [self.contentView addSubview:self.commodityNumberLabel];
        [self.contentView addSubview:self.commodityRateLabel];
    }
    return self;
}
- (void)setModel {
    
    
    self.commodityLabels = [NSMutableArray arrayWithArray:@[@"上新",@"热卖",@"促销"]];
    for (NSInteger i = 0; i < _commodityLabels.count; i ++) {
        UILabel * commodityLabel = [[UILabel alloc] init];
        commodityLabel.frame = CGRectMake(self.commodityNameLabel.frame.origin.x + [GZGApplicationTool control_wide:70] * i, self.commodityNameLabel.frame.origin.y + self.commodityNameLabel.frame.size.height + [GZGApplicationTool control_height:22], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:20]);
        commodityLabel.text = NSLocalizedString(_commodityLabels[i], nil);
        commodityLabel.textColor = [UIColor whiteColor];
        commodityLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:12]];
        commodityLabel.textAlignment = NSTextAlignmentCenter;
        // 颜色
        if ([self.commodityLabels[i] isEqualToString:@"上新"]) {
            commodityLabel.backgroundColor = [[UIImage imageNamed:@"blue-back"] mostColor];
        } else if ([self.commodityLabels[i] isEqualToString:@"热卖"]) {
            commodityLabel.backgroundColor = [[UIImage imageNamed:@"orange-back"] mostColor];
        } else if ([self.commodityLabels[i] isEqualToString:@"促销"]) {
            commodityLabel.backgroundColor = [[UIImage imageNamed:@"green-back"] mostColor];
        }
        [self addSubview:commodityLabel];
    }
}
- (CGSize)computingSizeWithString:(NSString *)string forFont:(UIFont *)font {
    
    NSDictionary * dict = @{NSFontAttributeName : font};
    
    CGSize size = [string boundingRectWithSize:CGSizeMake([GZGApplicationTool control_wide:375], MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    return size;
}

@end

@implementation GZGCommodityTogetherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.commodityTogetherLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:35]);
            label.text = NSLocalizedString(@"商品合计", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [UIColor blackColor];
            label;
        });
        self.commodityTotalPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"商品总价：", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:204] - size.width, [GZGApplicationTool control_height:20], size.width, size.height);
            label;
        });
        self.preferentialActivitiesLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"优惠活动：", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:204] - size.width, [GZGApplicationTool control_height:60], size.width, size.height);
            label;
        });
        self.freightLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"运费：", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:204] - size.width, [GZGApplicationTool control_height:100], size.width, size.height);
            label;
        });
        self.taxesAndFeesLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"税费：", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:204] - size.width, [GZGApplicationTool control_height:140], size.width, size.height);
            label;
        });
        self.totalPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"总价：", nil);
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:32])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:204] - size.width, [GZGApplicationTool control_height:242], size.width, size.height);
            label;
        });
        [self.contentView addSubview:self.commodityTogetherLabel];
        [self.contentView addSubview:self.commodityTotalPriceLabel];
        [self.contentView addSubview:self.preferentialActivitiesLabel];
        [self.contentView addSubview:self.freightLabel];
        [self.contentView addSubview:self.taxesAndFeesLabel];
        [self.contentView addSubview:self.totalPriceLabel];
        
        self.commodityTotalPriceNumber = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"￥188.00", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:20], size.width, size.height);
            label;
        });
        self.preferentialActivitiesNumber = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"-￥0.00", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:60], size.width, size.height);
            label;
        });
        self.freightNumber = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"￥24.00", nil);
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:100], size.width, size.height);
            label;
        });
        self.taxesAndFeesNumber = ({
            UILabel * label = [[UILabel alloc] init];
            label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"￥12.00", nil)];
            label.textColor = [GZGColorClass subjectConfirmOrderLightGreyColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:140], size.width, size.height);
            label;
        });
        self.totalPriceNumber = ({
            UILabel * label = [[UILabel alloc] init];
            label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"￥400.00", nil)];
            label.textColor = [GZGColorClass subjectConfirmOrderItemColor];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:32])];
            label.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:242], size.width, size.height);
            label;
        });
        [self.contentView addSubview:self.commodityTotalPriceNumber];
        [self.contentView addSubview:self.preferentialActivitiesNumber];
        [self.contentView addSubview:self.freightNumber];
        [self.contentView addSubview:self.taxesAndFeesNumber];
        [self.contentView addSubview:self.totalPriceNumber];
        
        
        self.submitOrdersItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:310], [GZGApplicationTool control_height:295], [GZGApplicationTool control_wide:280], [GZGApplicationTool control_height:70]);
            btn.backgroundColor = [GZGColorClass subjectConfirmOrderItemColor];
            [btn setTitle:NSLocalizedString(@"提交订单", nil) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self.contentView addSubview:self.submitOrdersItem];
    }
    return self;
}
- (void)setModel {
    
    UILabel * label = [[UILabel alloc] init];
    label.text = NSLocalizedString(@"关税≤50，免征哦", nil);
    label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17.0]];
    label.textColor = [GZGColorClass subjectConfirmOrderItemColor];
    CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:21])];
    label.frame = CGRectMake(self.taxesAndFeesLabel.frame.origin.x - [GZGApplicationTool control_wide:15] - size.width, self.taxesAndFeesLabel.frame.origin.y + [GZGApplicationTool control_height:5], size.width, size.height);
    [self.contentView addSubview:label];
}
- (void)buttonClick:(UIButton *)button {
    if (self.submitOrderBlock) {
        self.submitOrderBlock(self.totalPriceLabel.text);
    }
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置当前上下问路径
    //设置起始点
    CGContextMoveToPoint(context, 0, [GZGApplicationTool control_height:198]);
    //增加点
    CGContextAddLineToPoint(context, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:198]);
//    CGContextAddLineToPoint(context, 50, 200);
    //关闭路径
    CGContextClosePath(context);
    //3.设置属性
    /*
     UIKit会默认导入 core Graphics框架，UIKit对常用的很多的唱歌方法做了封装
     UIColor setStroke设置边线颜色
     uicolor setFill 设置填充颜色
     
     */
    [[UIColor lightGrayColor]setStroke];
    [[UIColor blueColor]setFill];
    //4.绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}
/**
 *  给字符串添加横线
 */
- (NSMutableAttributedString *)attributedStringHorzontalLineWithString:(NSString *)string {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    string = [string substringWithRange:NSMakeRange(1, string.length -1)];
    if ([string floatValue] > 50) {
        return attributedString;
    } else {
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attributedString.length)];
        return attributedString;
    }
}
@end


@implementation UIImage (Tint)

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

-(UIColor*)mostColor{
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, self.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}


@end
