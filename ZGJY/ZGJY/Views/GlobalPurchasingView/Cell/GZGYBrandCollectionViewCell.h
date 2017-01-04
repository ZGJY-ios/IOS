//
//  GZGYBrandCollectionViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYBrandModel.h"
#import "ZGNetWork.h"
@interface GZGYBrandCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)UILabel * nameLabel;

@property(nonatomic,strong)UIImageView * imgView;

@property(nonatomic, strong)GZGYBrandModel * model;
@end
