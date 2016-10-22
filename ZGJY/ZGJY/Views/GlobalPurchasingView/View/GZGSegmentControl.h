//
//  GZGSegmentControl.h
//  ZGJY
//
//  Created by HX on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SegmentType) {
    SegmentTypeComprehensive, // 综合
    SegmentTypeSales, // 销量
    SegmentTypePriceHigh, // 高价格
    SegmentTypePriceLow, // 低价格
    SegmentTypeEvaluation, // 评价
};

@class GZGSegmentControlItem,GZGSegmentControl;
@protocol GZGSegmentControlDelegate <NSObject>
@required
- (void)segmentItemSelected:(SegmentType)type;
- (void)control:(GZGSegmentControl *)segmentControl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
@protocol GZGSegmentControlDataSource <NSObject>
- (NSInteger)control:(GZGSegmentControl *)segmentControl numberOfRowsInColum:(NSInteger)column;
- (NSString *)control:(GZGSegmentControl *)segmentControl titleForColumn:(NSInteger)column;
- (NSString *)control:(GZGSegmentControl *)segmentControl titleForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface GZGSegmentControlItem : UIControl
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *line;
@end

@interface GZGSegmentControl : UIView
@property (copy, nonatomic)   NSArray *items;
@property (copy, nonatomic)   NSArray *indicators;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (copy, nonatomic)   NSArray *titles;
@property (weak, nonatomic) id<GZGSegmentControlDelegate> delegate;
@property (weak, nonatomic) id<GZGSegmentControlDataSource> dataSource;
@property (nonatomic, strong) id indicator;
@property (assign, nonatomic) BOOL hasLine;
@end
