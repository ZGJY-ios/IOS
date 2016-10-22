//
//  GZGColorClass.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGColorClass.h"

@implementation GZGColorClass

@end
@implementation GZGColorClass (TabBarOrNavBarColors)
/**
 *港中港背景颜色
 
 *@return Color
 */

+ (UIColor *)gzgBackClolor{return [@"eae7e7" hexStringToColor];}
/**
 *NavBarColor
 
 @return Color
 */
+ (UIColor *)gzgNavBarBackColor{return [@"f94c4c" hexStringToColor];}
/**
 *TabBarTitle选中字体颜色
 
 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColorX{return [@"de3430" hexStringToColor];}
/**
 *TabBarTitle未选中字体颜色
 
 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColor{return [@"353535" hexStringToColor];}
@end
@implementation GZGColorClass (GlobalPurchasingColor)
/**
 *  全球购 火力拼团 背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupBackgroundColor {return [@"faefcf" hexStringToColor];}
/**
 *  全球购 火力拼团 clear
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupClearColor {return [UIColor clearColor];}
/**
 *  全球购 火力拼团 已售背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupSoldBackgroundColor {return [@"b8b8b8" hexStringToColor];}
/**
 *  全球购 火力拼团 剩余背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupRemainingBackgroundColor {return [@"9a978e" hexStringToColor];}
/**
 *   全球购 火力拼团 已售 剩余 字体颜色
 */
+ (UIColor *)subjectGPSpellGroupSoldAndRemainingTextColor{return [@"ffffff" hexStringToColor];}
/**
 *  全球购 火力拼团 数字颜色
 */
+ (UIColor *)subjectGPSpellGroupTitleColor {return [@"fb1a42" hexStringToColor];}
/**
 *  全球购 火力拼团 商品与原产地字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsTextColor {return [@"8c837a" hexStringToColor];}
/**
 *  全球购 火力拼团 商品标签颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupGoodsLabelColor {return [@"fc7c84" hexStringToColor];}
/**
 *  全球购 火力拼团 虚线颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupDottedLineColor {return [@"8c837a" hexStringToColor];}
/**
 *  全球购 火力拼团 限制背景色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitBackgroundColor {return [@"fbb7aa" hexStringToColor];}
/**
 *  全球购 火力拼团 限制字体颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupLimitTextColor {return [@"1b1b1b" hexStringToColor];}
/**
 *  全球购 火力拼团 进货 Normal 颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupReplenishOnrNormalBackgroundColor {return [@"ff0234" hexStringToColor];}
/**
 *  全球购 火力拼团 进度条的进度颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupProgressTintColor {return [@"fd7981" hexStringToColor];}
/**
 *  全球购 火力拼团 百分比颜色
 *  @return Color
 */
+ (UIColor *)subjectGPSpellGroupPercentageTextColor {return [@"fbb1a6" hexStringToColor];}
@end
@implementation GZGColorClass (GlobalPurchaCrossBord)

/**
 跨界直邮颜色1

 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsOne{return [@"f0dfce" hexStringToColor];}
/**
 跨界直邮颜色2
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsTow{return [@"e5dbb2" hexStringToColor];}
/**
 跨界直邮颜色3
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsThree{return [@"e6d9d4" hexStringToColor];}
/**
 跨界直邮颜色4
 
 @return Color
 */
+ (UIColor *)subjectGlobaCrossBorsFore{return [@"d6f6f6" hexStringToColor];}

@end
@implementation GZGColorClass (GlobalCountriesPacilionColor)

+ (UIColor *)subjectCountriesPacilionGoodsTitleColor{return [@"675f5f" hexStringToColor];}

@end
