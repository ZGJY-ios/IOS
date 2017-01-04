//
//  GZGCountriesPavilionCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/10/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesPavilionCell.h"
#import "GZGCountriesCollectionViewCell.h"
static NSString *const CellCountriesCellStr = @"cellCountriesCellStr";

@interface GZGCountriesPavilionCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *collection;
@end


@implementation GZGCountriesPavilionCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    CGFloat hh = [GZGApplicationTool control_height:382.0f];
    CGFloat w = SCREENWIDTH,h = [GZGApplicationTool control_height:393];
    
    UIView *viewCell = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], SCREENWIDTH, hh+h)];
    viewCell.backgroundColor = [UIColor whiteColor];
    [self addSubview:viewCell];
    
    
   
    self.cellCountriesImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hh)];
    [viewCell addSubview:self.cellCountriesImage];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, hh, w, h) collectionViewLayout:flowLayout];
    _collection.delegate = self;
    _collection.dataSource = self;
    [_collection registerClass:[GZGCountriesCollectionViewCell class] forCellWithReuseIdentifier:CellCountriesCellStr];
    [_collection registerClass:[GZGCountriesCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellCountriesCellStr];
    _collection.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collection];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([GZGApplicationTool control_wide:260],[GZGApplicationTool control_height:393]);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GZGCountriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellCountriesCellStr forIndexPath:indexPath];
    cell.cellGoodsImage.image = self.cellGoodsImage;
    cell.cellGoodsName.text = self.cellGoodsName;
    cell.cellGoodsprice.text = [NSString stringWithFormat:@"￥%@",self.cellGoodsprice];
     [self priceLab:cell.cellGoodsprice rang:NSMakeRange(0, 1) font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:15]]];

    [cell.cellAddshopping setImage:self.cellAddshopping forState:UIControlStateNormal];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}


//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    UIEdgeInsets set = UIEdgeInsetsMake(0,0,0,0);
//    return set;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 0.0;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 0.0;
//}

- (void)priceLab:(UILabel *)lab rang:(NSRange)rang font:(UIFont *)font{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:lab.text];
    [str addAttribute:NSFontAttributeName value:font range:rang];
    //    [str addAttribute:NSForegroundColorAttributeName value:UIColorFromHEX(0x353535) range:rang];
    lab.attributedText = str;
    
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
