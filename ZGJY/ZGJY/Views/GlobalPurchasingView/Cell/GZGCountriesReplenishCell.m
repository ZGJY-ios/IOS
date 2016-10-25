//
//  GZGCountriesReplenishCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesReplenishCell.h"
#import "GZGCountriesReplenishCollectionCell.h"
static NSString *const CellCountriesCellStr = @"cellCountriesCellStr";
@interface GZGCountriesReplenishCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *collection;
@end
@implementation GZGCountriesReplenishCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}


- (void)buildUI{
    CGFloat hh = [GZGApplicationTool control_height:295.0f];
    CGFloat w = SCREENWIDTH,h = [GZGApplicationTool control_height:316.0f];

    UIView *viewCell = [UIView countriesGradiengColor:CGRectMake(0,0, SCREENWIDTH, hh+h) oneColor:self.oneColor towColor:self.towColor];
    [self addSubview:viewCell];
    
    
    self.cellCountriesImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hh)];
    [viewCell addSubview:self.cellCountriesImage];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, hh, w, h) collectionViewLayout:flowLayout];
    _collection.delegate = self;
    _collection.dataSource = self;
    [_collection registerClass:[GZGCountriesReplenishCollectionCell class] forCellWithReuseIdentifier:CellCountriesCellStr];
    [_collection registerClass:[GZGCountriesReplenishCollectionCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellCountriesCellStr];
    _collection.backgroundColor = [UIColor clearColor];
    [self addSubview:_collection];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([GZGApplicationTool control_wide:195.0f],[GZGApplicationTool control_height:261.0f]);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GZGCountriesReplenishCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellCountriesCellStr forIndexPath:indexPath];
    cell.replenishImage.image = self.replenishImage;
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
