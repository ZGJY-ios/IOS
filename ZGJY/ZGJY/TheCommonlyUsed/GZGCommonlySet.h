//
//  GZGCommonlySet.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface NSString (GZGCommonlySet)

/**
 *颜色16进制

 @return Color
 */
- (UIColor *)hexStringToColor;
@end
@interface UIView (GZGCommonlySet)

/**
 *View的高度

 @return CGFloat
 */
- (CGFloat)viewHeight;
/**
 *View的宽度
 
 @return CGFloat
 */
- (CGFloat)viewWidth;
/**
 *View靠边的位置
 
 @return CGFloat
 */
- (CGFloat)leftSidePosition;
/**
 *View的靠边总长度偏移量
 
 @return CGFloat
 */
- (CGFloat)edgnSideOffset;
/**
 *View靠上的位置
 
 @return CGFloat
 */
- (CGFloat)onThePosition;
/**
 *View局上的总长度
 
 @return CGFloat
 */
- (CGFloat)onTheOffset;
@end
