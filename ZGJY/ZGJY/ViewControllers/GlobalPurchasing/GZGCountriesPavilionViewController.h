//
//  GZGCountriesPavilionViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"

//typedef NS_ENUM(NSUInteger,CountriesEnterThe) {
//    CountriesEnterThe_SouthKorea = 0,                       //韩国
//    CountriesEnterThe_Japan,                                //日本
//    CountriesEnterThe_Australia,                            //澳大利亚
//    CountriesEnterThe_TheEuropean                           //欧洲
//};



@interface GZGCountriesPavilionViewController : GZGSubViewController
@property(nonatomic, strong) NSString *countriesTitle;
@property(nonatomic, strong) UIColor *backViewColor;
@property(nonatomic, strong) UIColor *navColor;
@property(nonatomic, assign) NSUInteger countriesIndex;
@end
