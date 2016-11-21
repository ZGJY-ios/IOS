//
//  GZGCountriesHeadFaceCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesHeadFaceCell.h"
#import "GZGCountriesHeadFaceCollectionCell.h"
#import "UIImageView+WebCache.h"

static NSString *CountriesHeadFaceCollectionCell = @"CountriesHeadFaceCollectionCell";

@interface GZGCountriesHeadFaceCell()<YDTopTitleRollingDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign) BOOL CollectionCanSilide;
@end
@implementation GZGCountriesHeadFaceCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    
    
//    NSLog(@"%@  %@  %@",self.cellCountriesTitle,self.cellTitleName,self.cellPriceLab);
    

//    NSArray *titleArr = @[@"  面部护理",@"营养肌肤",@"洗发护发",@"彩妆修颜",@"亮甲美甲",@"洗发护发"];
    
     NSArray *titleArr = @[@"母婴用品",@"洗护用品"];

    
    self.ydTopTitleRollingView = [[YDTopTitleRolling alloc] initWithFrame:
                                 CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:94])
                                                           topTitleArray:titleArr
                                                             selectColor:[GZGColorClass subjectCountriesHeadFaceSelectTitleColor]
                                                            defauleColor:[GZGColorClass subjectCountriesHeadFaceCancleSelectTitleColor]
                                                               titleFont:[UIFont systemFontOfSize:13]
                                                            titleSpacing:10.0f
                                                               lineWidth:2.0f
                                 ];
    self.ydTopTitleRollingView.backgroundColor = [UIColor whiteColor];
    self.ydTopTitleRollingView.delegate = self;
    [self addSubview:self.ydTopTitleRollingView];
    
    CGFloat hh = [GZGApplicationTool control_height:94.0f];
    CGFloat w = SCREENWIDTH,h = SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize] - hh;
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, hh, w, h) collectionViewLayout:flowLayout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerClass:[GZGCountriesHeadFaceCollectionCell class] forCellWithReuseIdentifier:CountriesHeadFaceCollectionCell];
    [self.collection registerClass:[GZGCountriesHeadFaceCollectionCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CountriesHeadFaceCollectionCell];
    self.collection.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collection];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:GZGCountriesTableCanslideNotification object:nil];
}
#pragma  mark 系统的代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([GZGApplicationTool control_wide:330.0f],[GZGApplicationTool control_height:420.0f]);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GZGCountriesHeadFaceCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CountriesHeadFaceCollectionCell forIndexPath:indexPath];

    

//    [cell.cellHeadImage sd_setImageWithURL:[NSURL URLWithString:self.cellHeadImageUrl] placeholderImage:self.cellPlaceholderHeadImage];
//    cell.cellCountriesTitle.text = self.dataArr[indexPath.row][0];
//    cell.cellTitleName.text = self.dataArr[indexPath.row][1];
//    cell.cellTitleQuality.text = self.dataArr[indexPath.row][2];
//    cell.cellPriceLab.text = self.dataArr[indexPath.row][3];
//    [self priceLab:cell.cellPriceLab rang:NSMakeRange(0, 1) font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:16]]];
    [cell.cellShonpingBtn setImage:[UIImage imageNamed:@"QQG_ADD_GWC"] forState:UIControlStateNormal];
    
    GZGSpecialPerformanceModel * model = self.dataArr[indexPath.row];
    [cell.cellHeadImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:self.cellPlaceholderHeadImage];
    cell.cellCountriesTitle.text = model.name;
    cell.cellTitleName.text = model.name;
    cell.cellTitleQuality.text = model.name;
    cell.cellPriceLab.text = [NSString stringWithFormat:@"%f",model.price];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    
    GZGSpecialPerformanceModel * model = self.dataArr[indexPath.row];
    
    [self.delegate cellSelectedModel:model];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets set = UIEdgeInsetsMake([GZGApplicationTool control_height:22],[GZGApplicationTool control_wide:22],0,[GZGApplicationTool control_height:22]);
    return set;
}


#pragma mark Delegate
- (void)titleRollingIndex:(UILabel *)lab{
    
    NSLog(@"%f",self.collection.contentOffset.y);
    self.collection.contentOffset = CGPointMake(0, 0);
    
    
    
    [self.delegate topTitleIndex:lab];
}

- (void)priceLab:(UILabel *)lab rang:(NSRange)rang font:(UIFont *)font{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:lab.text];
    [str addAttribute:NSFontAttributeName value:font range:rang];
    //    [str addAttribute:NSForegroundColorAttributeName value:UIColorFromHEX(0x353535) range:rang];
    lab.attributedText = str;
    
}

- (void)acceptMsg:(NSNotification *)notifi{
    NSDictionary *userInfo = notifi.userInfo;
    NSString *canScroll = userInfo[@"CanSlide"];
    if ([canScroll isEqualToString:@"YES"]) {
        _CollectionCanSilide = YES;
        self.collection.showsVerticalScrollIndicator = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (!_CollectionCanSilide) {
        [scrollView setContentOffset:CGPointZero];
    }
    CGFloat offsetY = scrollView.contentOffset.y;


    if (offsetY<0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:GZGCountriesTableBanSlideNotification object:nil userInfo:@{@"BanSlide":@"YES"}];
        [scrollView setContentOffset:CGPointZero];
        _CollectionCanSilide = NO;
        self.collection.showsVerticalScrollIndicator = NO;
    }
 
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
