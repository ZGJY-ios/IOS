//
//  GZGYSalaTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSalaTableViewCell.h"
#import "GZGYRootLimitModel.h"
#define KScreenWigth     [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight  [[UIScreen mainScreen] bounds].size.height
@implementation GZGYSalaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UICollectionViewFlowLayout*flowlay = [[UICollectionViewFlowLayout alloc]init];
        flowlay.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:flowlay];
        flowlay.itemSize = CGSizeMake([GZGApplicationTool control_wide:245],[GZGApplicationTool control_height:270]);
        flowlay.minimumLineSpacing = 5;
        flowlay.minimumInteritemSpacing = 0;
        flowlay.sectionInset = UIEdgeInsetsMake([GZGApplicationTool control_height:10], 0, 0, 0);
        [_collectionView registerClass:[GZGYSalaCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.scrollsToTop = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        //每次滚动都只便宜一个Wigth便宜量
//        _collectionView.pagingEnabled = YES;
        //        _CollectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
        _collectionView.showsVerticalScrollIndicator = NO;
        //水平滑动条
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_collectionView];
        [self LimitData];
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identify = @"cell";
    GZGYSalaCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.model = self.model[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegete CollectionViewDelegeteClick:indexPath.row];
}
#pragma mark --- 限时抢购数据
-(void)LimitData
{
    NSDictionary * dic = @{@"tagIds":@"5"};
    [[GZGYAPIHelper shareAPIHelper]LimitedTimeSaleURL:@"http://192.168.0.110:8080/appTopic/Limitshop" Dict:dic Finsh:^(NSArray * dataArray){
        self.model = [GZGYRootLimitModel mj_objectArrayWithKeyValuesArray:dataArray];
        [self.collectionView reloadData];
        GZGLog(@"多少个%ld",self.model.count);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
