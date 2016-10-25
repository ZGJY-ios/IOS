//
//  YDTopTitleRolling.h
//  Testxxfsfd
//
//  Created by 刘亚栋 on 2016/10/22.
//  Copyright © 2016年 刘亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YDTopTitleRollingDelegate <NSObject>

- (void)titleRollingIndex:(NSInteger)index;

@end

@interface YDTopTitleRolling : UIView

@property(nonatomic,assign)id<YDTopTitleRollingDelegate>delegate;


- (instancetype)initWithFrame:(CGRect)frame
                topTitleArray:(NSArray *)topTitleArray
                  selectColor:(UIColor *)selectColor
                 defauleColor:(UIColor *)defaulrColor
                    titleFont:(UIFont *)titleFont
                 titleSpacing:(CGFloat)titleSpacing
                    lineWidth:(CGFloat)lineWidth;

@end


