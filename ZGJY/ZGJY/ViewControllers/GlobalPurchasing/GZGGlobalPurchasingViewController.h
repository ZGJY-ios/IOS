//
//  GZGGlobalPurchasingViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"
typedef NS_ENUM(NSUInteger,HomeItem) {
    HomeItem_FireAlsoGroup = 0,                     //限时特卖
    HomeItem_CrossBorderDirectMail,                //洗护用品
    HomeItem_GlobalSelect,                        //限时特卖
    HomeItem_LimitedTimeSale,                     //火力拼团
    HomeItem_SouthKorea,                           //韩国
    HomeItem_Japan,                                //日本
    HomeItem_Australia,                            //澳大利亚
    HomeItem_TheEuropean,                          //欧洲
};
@interface GZGGlobalPurchasingViewController : GZGSubViewController

@end
