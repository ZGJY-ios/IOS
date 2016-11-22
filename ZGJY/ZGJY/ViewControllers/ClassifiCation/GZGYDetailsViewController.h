//
//  GZGYDetailsViewController.h
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGSubViewController.h"

typedef NS_ENUM(NSInteger, GoodsDetails) {
    GoodsDetailsMaternalAndInfant,  // 母婴
    GoodsDetailsWashProtect, // 洗护
    GoodsDetailsLimited, // 限时抢购
    GoodsDetailsFireAlsoGroup, // 火力拼团
    GoodsDetailsKorea, // 韩国馆
    GoodsDetailsJapan, // 日本馆
    GoodsDetailsEurope, // 欧洲馆
    GoodsDetailsAussie, // 澳洲馆
};


@interface GZGYDetailsViewController : GZGSubViewController
@property (nonatomic, assign) GoodsDetails gDetails;
@property(nonatomic, strong)NSString * shopID;
@property(nonatomic, strong)NSString * shopImg;
@property(nonatomic, strong)NSString * shopName;
@property (nonatomic, copy) NSString * productCategoryId;
@end
