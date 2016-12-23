//
//  GZGSearchListCell.m
//  ZGJY
//
//  Created by HX on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSearchListCell.h"
#import "UIImageView+WebCache.h"
@implementation GZGSearchListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:274]);
        [self buildUI];
    }
    return self;
}
- (void)buildUI {
    
    self.commodityHotImageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:0], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:65], [GZGApplicationTool control_height:65]);
        imageView.image = [UIImage imageNamed:@"SearchListHot"];
        imageView;
    });
    self.commodityImageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:44], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:274]);
        imageView;
    });
    self.commodityNameLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.commodityImageView.frame.origin.x + self.commodityImageView.frame.size.width + [GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:48], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:336], [GZGApplicationTool control_height:30]);
//        label.backgroundColor = self.backgroundColor;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = NSLocalizedString(@"澳洲进口 体内平衡益生菌", nil);
        label.textColor = [UIColor blackColor];
        label;
    });
    // 商品介绍
    self.commodityIntroductionLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.commodityNameLabel.frame.origin.x, [GZGApplicationTool control_height:15] + self.commodityNameLabel.frame.origin.y + self.commodityNameLabel.frame.size.height, [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:336], [GZGApplicationTool control_height:46]);
//        label.backgroundColor = self.backgroundColor;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:19]];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        label.text = NSLocalizedString(@"富含最佳女性抗衰老成分OPC， 女性必吃天然西芹籽精华", nil);
        label.textColor = [UIColor grayColor];
        label;
    });
    self.commodityPriceLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.commodityNameLabel.frame.origin.x, [GZGApplicationTool control_height:175], [GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:30]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [GZGColorClass subjectGPSpellGroupTitleColor];
        label.text = NSLocalizedString(@"￥70.00", nil);
        label;
    });
    self.commodityReferencePriceLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.commodityNameLabel.frame.origin.x, [GZGApplicationTool control_height:217], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:356], [GZGApplicationTool control_height:20]);
        label.backgroundColor = [GZGColorClass subjectGPSpellGroupClearColor];
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:18]];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [GZGColorClass subjectGPSpellGroupGoodsTextColor];
//        label.text = NSLocalizedString(@"国内参考价：￥146.00", nil);
        label.attributedText = [self attributedStringHorzontalLineWithString:NSLocalizedString(@"国内参考价：￥146.00", nil)];
        label;
    });
    
    
//    [self.commodityImageView addSubview:self.commodityHotImageView];
    [self addSubview:self.commodityImageView];
    [self addSubview:self.commodityNameLabel];
    [self addSubview:self.commodityIntroductionLabel];
    [self addSubview:self.commodityPriceLabel];
    [self addSubview:self.commodityReferencePriceLabel];
}
- (void)setModel:(GZGSpecialPerformanceModel *)model {
    
    
    
//    "allocated_stock" = 0;
//    "create_by" = "\U7ba1\U7406\U5458";
//    "creation_date" = "2016-11-22 15:49:25";
//    "delete_flag" = 0;
//    "full_name" = "\U5566\U5566\U5566\U5566\U5566";
//    "goods_id" = 137;
//    hits = 0;
//    id = 69;
//    image = "http://localhost:8080/upload/image/201611/4398aebd-d667-4c5c-ae56-001dfa2b4a86-thumbnail.jpg";
//    "is_gift" = 0;
//    "is_list" = 1;
//    "is_marketable" = 1;
//    "is_top" = 0;
//    "last_updated_by" = "\U7ba1\U7406\U5458";
//    "last_updated_date" = "2016-12-16 09:40:39";
//    "market_price" = "14.4";
//    "month_hits" = 0;
//    "month_hits_date" = "2016-11-22 15:49:24";
//    "month_sales" = 0;
//    "month_sales_date" = "2016-11-22 15:49:24";
//    name = "\U5566\U5566\U5566\U5566\U5566";
//    point = 12;
//    price = 12;
//    "product_category_id" = 284;
//    sales = 0;
//    score = 0;
//    "score_count" = 0;
//    sn = 201611225454;
//    "total_score" = 0;
//    "week_hits" = 0;
//    "week_hits_date" = "2016-11-22 15:49:24";
//    "week_sales" = 0;
//    "week_sales_date" = "2016-11-22 15:49:24";
    
    
    
    
    
    [self.commodityImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.commodityNameLabel.text = model.name;
    self.commodityIntroductionLabel.text = model.full_name;
    self.commodityPriceLabel.text = [NSString stringWithFormat:@"%0.2f",model.price];
    self.commodityReferencePriceLabel.attributedText = [self attributedStringHorzontalLineWithString:[NSString stringWithFormat:@"国内参考价%0.2f",model.market_price]];
    
    self.commodityLabels = [NSMutableArray arrayWithArray:@[@"上新",@"热卖",@"促销"]];
    for (NSInteger i = 0; i < _commodityLabels.count; i ++) {
        UILabel * commodityLabel = [[UILabel alloc] init];
        commodityLabel.frame = CGRectMake(self.commodityPriceLabel.frame.origin.x + self.commodityPriceLabel.frame.size.width + [GZGApplicationTool control_wide:10] + [GZGApplicationTool control_wide:70] * i, self.commodityIntroductionLabel.frame.origin.y + self.commodityIntroductionLabel.frame.size.height + [GZGApplicationTool control_height:42], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:20]);
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 自己的方法
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
