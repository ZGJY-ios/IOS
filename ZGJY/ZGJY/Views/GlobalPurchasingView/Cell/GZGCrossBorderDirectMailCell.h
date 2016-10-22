//
//  GZGCrossBorderDirectMailCell.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/10/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZGCrossBorderDirectMailCellDelegate <NSObject>

- (void)crossBorderIndex:(NSInteger)index;

@end


@interface GZGCrossBorderDirectMailCell : UITableViewCell
@property(nonatomic,assign)id <GZGCrossBorderDirectMailCellDelegate>delegate;
@end
