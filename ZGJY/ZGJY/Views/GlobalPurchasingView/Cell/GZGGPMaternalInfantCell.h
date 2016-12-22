//
//  GZGGPMaternalInfantCell.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/29.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZGGPMaternalInfantCellDelegate <NSObject>

- (void)maternalBtnIndex:(NSInteger)index;

@end

typedef NS_ENUM(NSUInteger,GZGGPMaternalInfantCellIndex) {
    GZGGPMaternalInfantCellIndex_CCGDSP          =               99,      //99为TagID 便于判断
};

@interface GZGGPMaternalInfantCell : UITableViewCell
@property (nonatomic, assign)id <GZGGPMaternalInfantCellDelegate>delegate;
@property(nonatomic,strong) UICollectionView *collection;
- (void)loadData:(NSArray *)arr;
@end
