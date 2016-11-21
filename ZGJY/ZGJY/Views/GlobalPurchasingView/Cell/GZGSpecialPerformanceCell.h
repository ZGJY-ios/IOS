//
//  GZGSpecialPerformanceCell.h
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SpecialPerformanceType) {
    SpecialPerformanceTypeNone,
    SpecialPerformanceTypeImprotedFrom, // 原装进口
    SpecialPerformanceTypeOfficialStraight, // 官方直供
    SpecialPerformanceTypeSpecialPackagesMailed, // 特价包邮
};

@interface GZGSpecialPerformanceCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView * typeImageView; // 类型
@property (nonatomic, strong) UIImageView * imageView; // 图片
@property (nonatomic, strong) UILabel * commodityNameLabel; // 名称
@property (nonatomic, strong) UILabel * commodityNowPriceLabel; // 商品现价格
@property (nonatomic, strong) UILabel * commodityOriginalPriceLabel; // 商品原价格
@property (nonatomic, strong) UIButton * cartItem; // 购物车
@property (nonatomic) SpecialPerformanceType type;

/**
 *  给字符串添加横线
 */
- (NSMutableAttributedString *)attributedStringHorzontalLineWithString:(NSString *)string;
@end
