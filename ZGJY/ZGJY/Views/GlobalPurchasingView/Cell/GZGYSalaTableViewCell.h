//
//  GZGYSalaTableViewCell.h
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYCountdown.h"
#import "GZGYStrikeThroughLabel.h"
#import "GZGYSalaCollectionViewCell.h"
@class GZGYRootLimitModel;
@protocol CollectionViewDelegeteClickProtocol <NSObject>

- (void)CollectionViewDelegeteClick:(NSInteger)sender;

@end
@interface GZGYSalaTableViewCell : UITableViewCell
<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)id <CollectionViewDelegeteClickProtocol>delegete;
@property (nonatomic, strong) NSArray<GZGYRootLimitModel *> *model;
@property(nonatomic,strong)UICollectionView*collectionView;
@end
