//
//  GZGGPGlobalSelectCell.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZGGPGlobalSelectCellDelegate <NSObject>

- (void)gpGpobalSelectCellIndex:(NSInteger)index;

@end

@interface GZGGPGlobalSelectCell : UITableViewCell
@property (nonatomic, assign)id <GZGGPGlobalSelectCellDelegate>delegate;
@end
