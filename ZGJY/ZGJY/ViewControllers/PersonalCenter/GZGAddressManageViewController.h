//
//  GZGAddressManageViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSubViewController.h"

@interface GZGAddressManageViewController : GZGSubViewController

@property (nonatomic) BOOL isBack; // Default NO;

@property (nonatomic, copy) void(^returnAddress)(id address);

@end
