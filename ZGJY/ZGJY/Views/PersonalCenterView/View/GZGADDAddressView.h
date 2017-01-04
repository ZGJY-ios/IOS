//
//  GZGADDAddressView.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/31.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CityAddressText) (NSString *text);
@interface GZGADDAddressView : UIView
@property(nonatomic,strong)CityAddressText cityAddressText;
@end
