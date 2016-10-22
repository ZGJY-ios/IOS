//
//  GZGGlobalPurchasingViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"
typedef NS_ENUM(NSUInteger,HomeItem) {
    HomeItem_GlobalSelect = 0,                     //全球精选
    HomeItem_LimitedTimeSale,                      //限时特卖
    HomeItem_FireAlsoGroup,                        //活力拼团
    HomeItem_CrossBorderDirectMail,                //跨境直邮
    HomeItem_SouthKorea,                           //韩国
    HomeItem_Japan,                                //日本
    HomeItem_Australia,                            //澳大利亚
    HomeItem_TheEuropean,                          //欧洲
};
@interface GZGGlobalPurchasingViewController : GZGSubViewController

@end
