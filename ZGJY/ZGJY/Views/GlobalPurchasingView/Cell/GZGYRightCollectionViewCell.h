//
//  GZGYRightCollectionViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYsecondClassification.h"

@interface GZGYRightCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)GZGYsecondClassification*model;

@property(nonatomic,strong)UIImageView*ImgView;

@property(nonatomic,strong)UILabel*NameLabel;

@end
