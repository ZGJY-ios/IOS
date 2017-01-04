//
//  YDImageRoll.h
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/1.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDImageDowoload.h"

@protocol YDImageDelegate <NSObject>

- (void)imageClickIndex:(NSInteger)index;

@end

@interface YDImageRoll : UIView
/**
 *  点击代理
 */
@property (nonatomic,weak)id <YDImageDelegate>delegate;

/**
 *  轮播时间
 */
@property (nonatomic,assign) NSTimeInterval time;
/**
 *  图片Url数组
 */
@property (nonatomic,strong) NSArray *imageUrlArray;
/**
 *  Page选择的颜色
 */
@property (nonatomic,strong) UIColor *pageCurrentColor;
/**
 *  Page没有选中的颜色
 */
@property (nonatomic,strong) UIColor *pageTintColor;
/**
 *  Page的个数
 */
@property (nonatomic,assign) NSInteger pageCount;
/**
 *  图片没加载出来默认代替的图片
 */
@property (nonatomic,strong) NSString *defaultImage;

@end
