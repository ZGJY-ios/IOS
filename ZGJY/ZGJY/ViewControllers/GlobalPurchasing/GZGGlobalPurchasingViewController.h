//
//  GZGGlobalPurchasingViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"
typedef NS_ENUM(NSUInteger,HomeItem) {
//    HomeItem_FireAlsoGroup = 0,                     //限时特卖
//    HomeItem_CrossBorderDirectMail,                //洗护用品
//    HomeItem_GlobalSelect,                        //健康保健
//    HomeItem_LimitedTimeSale,                     //居家日用
//    HomeItem_SouthKorea,                           //韩国
//    HomeItem_Japan,                                //日本
//    HomeItem_Australia,                            //澳大利亚
//    HomeItem_TheEuropean,                          //欧洲

//    HomeItem_GlobalSelect = 0,                     //限时特卖
//    HomeItem_LimitedTimeSale,                      //火力拼团
//    HomeItem_FireAlsoGroup,                        //母婴用品
//    HomeItem_CrossBorderDirectMail,                //洗护用品
//    HomeItem_SouthKorea,                           //韩国
//    HomeItem_Japan,                                //日本
//    HomeItem_Australia,                            //澳大利亚
//    HomeItem_TheEuropean,                          //欧洲
    
    HomeItem_type0 = 0,
    HomeItem_type1,                            //未知1  下面一样  问后台！！！谢谢
    HomeItem_type2,
    HomeItem_type3,
    HomeItem_type4,
    HomeItem_type5,
    HomeItem_type6,
    HomeItem_type7,
    

};
@interface GZGGlobalPurchasingViewController : GZGSubViewController

@end
