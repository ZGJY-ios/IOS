//
//  GZGCommonlySet.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCommonlySet.h"

@implementation NSString (GZGCommonlySet)

- (UIColor *)hexStringToColor{return [self hexStringToColorWithAlpha:1.0f];}
- (UIColor *)hexStringToColorWithAlpha:(CGFloat)alpha{
    
    NSString *cString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

@end
@implementation UIView (GZGCommonlySet)

- (CGFloat)viewHeight{return self.frame.size.height;}
- (CGFloat)viewWidth{return self.frame.size.width;}
- (CGFloat)edgnSidePosition{return self.frame.origin.x;}
- (CGFloat)edgnSideOffset{return self.frame.origin.x + self.frame.size.width;}
- (CGFloat)onThePosition{return self.frame.origin.y;}
- (CGFloat)onTheOffset{return self.frame.origin.y + self.frame.size.height;}


@end
