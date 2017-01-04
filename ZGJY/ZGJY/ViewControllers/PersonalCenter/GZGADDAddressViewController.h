//
//  GZGADDAddressViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"
#import "GZGAddressModel.h"

typedef NS_ENUM(NSInteger, AddressType) {
    AddressTypeEditor, // 编辑
    AddressTypeAdd, // 添加
};

@interface GZGADDAddressViewController : GZGSubViewController

@property (nonatomic) AddressType type;

@property (nonatomic) GZGAddressModel * model;

@end
