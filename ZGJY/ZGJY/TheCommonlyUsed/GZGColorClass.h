//
//  GZGColorClass.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface GZGColorClass : NSObject
@end
@interface GZGColorClass (TabBarOrNavBarColors)

/**
 *港中港背景颜色

 *@return Color
 */
+ (UIColor *)gzgBackClolor;

/**
 *NavBarColor

 @return Color
 */
+ (UIColor *)gzgNavBarBackColor;

/**
 *TabBarTitle选中字体颜色

 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColorX;

/**
 *TabBarTitle未选中字体颜色

 *@return Color
 */
+ (UIColor *)subjectTabBarTitleColor;
@end
