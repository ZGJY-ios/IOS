//
//  GZGCountriesHeadFaceCell.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDTopTitleRolling.h"
#import "GZGSpecialPerformanceModel.h"

@protocol GZGCountriesHeadFaceCellDelegate <NSObject>

- (void)topTitleIndex:(NSInteger)index;
- (void)cellSelectedModel:(GZGSpecialPerformanceModel *)model;

@end

@interface GZGCountriesHeadFaceCell : UITableViewCell

@property(nonatomic,strong) NSMutableArray *dataArr;

@property(nonatomic, strong) NSString *cellHeadImageUrl;
@property(nonatomic, strong) UIImage *cellPlaceholderHeadImage;
@property(nonatomic, strong) NSString *cellCountriesTitle;
@property(nonatomic, strong) NSString *cellTitleName;
@property(nonatomic, strong) NSString *cellTitleQuality;
@property(nonatomic, strong) NSString *cellPriceLab;





@property(nonatomic, strong) YDTopTitleRolling *ydTopTitleRollingView;
@property(nonatomic, assign) id<GZGCountriesHeadFaceCellDelegate>delegate;
@property(nonatomic, strong) UIColor *cellCollectionBackColor;
@property(nonatomic,strong) UICollectionView *collection;

@end
