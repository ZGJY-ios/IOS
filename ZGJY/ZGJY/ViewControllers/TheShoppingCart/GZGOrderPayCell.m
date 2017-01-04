//
//  GZGOrderPayCell.m
//  ZGJY
//
//  Created by HX on 16/10/31.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGOrderPayCell.h"

@implementation GZGOrderPayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGRect rect = self.frame;
        rect.size.height = [GZGApplicationTool control_height:113];
        self.frame = rect;
        
        _payIconImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:27.5], [GZGApplicationTool control_wide:147], [GZGApplicationTool control_height:58]);
            imageView.image = [UIImage imageNamed:@"TheShoppingCartTreasurePay"];
            imageView;
        });
        _payNameLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:197], [GZGApplicationTool control_height:44], [GZGApplicationTool control_wide:356], [GZGApplicationTool control_height:25]);
            label.text = NSLocalizedString(@"支付宝支付", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
            label;
        });
        _payCheckItem = ({
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:69], [GZGApplicationTool control_height:29], [GZGApplicationTool control_height:45], [GZGApplicationTool control_height:45]);
            [btn setImage:[UIImage imageNamed:@"TheShoppingCartEmptyHook"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"TheShoppingCartRedHook"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self.contentView addSubview:self.payIconImageView];
        [self.contentView addSubview:self.payNameLabel];
        [self.contentView addSubview:self.payCheckItem];
    }
    return self;
}
- (void)setTag:(NSInteger)tag {
    
    [super setTag:tag];
    _payCheckItem.tag = tag;
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    _payCheckItem.selected = selected;
}
- (void)buttonClick:(UIButton *)btn {
    
    if (self.returnPay) {
        self.returnPay(btn);
    }
}

@end

@implementation GZGOrderNumberCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _checkImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:22.5], [GZGApplicationTool control_height:38], [GZGApplicationTool control_height:38]);
            imageView.image = [UIImage imageNamed:@"TheShoppingCartCheck"];
            imageView;
        });
        _orderNumberLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:75], [GZGApplicationTool control_height:29], [GZGApplicationTool control_wide:356], [GZGApplicationTool control_height:25]);
            label.text = NSLocalizedString(@"订单号：ZZHY123456789", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
            label;
        });
        _orderTimeLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"2016-09-29 15:54:55", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17]];
            CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
            label.frame = CGRectMake([GZGApplicationTool screenWide]-[GZGApplicationTool control_wide:22] - size.width, [GZGApplicationTool control_height:26.5], size.width, [GZGApplicationTool control_height:30]);
            label.textAlignment = NSTextAlignmentRight;
            label;
        });
        _payAmountLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.attributedText = [self attributedStringWithStringColorWithString:NSLocalizedString(@"支付金额：￥400.00", nil) textColor:[UIColor blackColor] numberColor:[GZGColorClass subjectShoppingCartPriceColor]];
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17]];
            label.frame = CGRectMake(0, [GZGApplicationTool control_height:115], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:48]);
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:35]];
            label;
        });
        _payRemindersLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.text = NSLocalizedString(@"（请在60分钟内完成支付！）", nil);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:17]];
            label.frame = CGRectMake(0, [GZGApplicationTool control_height:168], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:48]);
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:27]];
            label;
        });
        [self.contentView addSubview:self.checkImageView];
        [self.contentView addSubview:self.orderNumberLabel];
        [self.contentView addSubview:self.orderTimeLabel];
        [self.contentView addSubview:self.payAmountLabel];
        [self.contentView addSubview:self.payRemindersLabel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置当前上下问路径
    //设置起始点
    CGContextMoveToPoint(context, 0, [GZGApplicationTool control_height:83]);
    //增加点
    CGContextAddLineToPoint(context, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:83]);
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
 *  给字体添加不同的颜色
 */
- (NSMutableAttributedString *)attributedStringWithStringColorWithString:(NSString *)string textColor:(UIColor *)textColor numberColor:(UIColor *)numberColor {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableArray * components = (NSMutableArray *)[string componentsSeparatedByString:@"："];
    for (NSInteger i = 0; i < components.count; i++) {
        NSString * tempString = components[i];
        if ([tempString hasPrefix:@"￥"]) {
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
