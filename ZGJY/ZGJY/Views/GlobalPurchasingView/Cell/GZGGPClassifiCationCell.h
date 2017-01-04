//
//  GZGGPClassifiCationCell.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZGGPClassifiCationCellDelegate <NSObject>

- (void)classifiCationBtnIndex:(NSInteger)index;

@end


@interface GZGGPClassifiCationCell : UITableViewCell
@property(nonatomic, assign)id <GZGGPClassifiCationCellDelegate>delegate;

- (void)loadData:(NSArray *)array;
@end
