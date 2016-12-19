//
//  GZGGPMaternalInfantCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/29.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGPMaternalInfantCell.h"
#import "GZGUpImageDownTitleBtn.h"
#import "UIButton+WebCache.h"
#import "GZGCountriesHeadFaceCollectionCell.h"
#import "GZGNewPavilonCellCollecationCelll.h"
#import "UIImageView+WebCache.h"
static const NSInteger MaternalBtnTag = 1000;
static NSString *CountriesHeadFaceCollectionCell = @"CountriesHeadFaceCollectionCell";
@interface GZGGPMaternalInfantCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation GZGGPMaternalInfantCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    _dataArray = [NSMutableArray array];
    
    //以后或许用到  暂时注释   后面只是添加了UICollectionView
//    NSArray *imageMeternallImageArr = @[@"sy_mypic6.jpg",
//                                        @"sy_mypic5.jpg",
//                                        @"sy_mypic4.jpg",
//                                        @"sy_mypic3.jpg",
//                                        @"sy_mypic2.jpg",
//                                        @"sy_mypic5.jpg"];
//    
//    NSArray *titleMaternaallTitleArraay = @[NSLocalizedString(@"a2", nil),
//                                            NSLocalizedString(@"all", nil),
//                                            NSLocalizedString(@"奶粉", nil),
//                                            NSLocalizedString(@"xx", nil),
//                                            NSLocalizedString(@"44", nil),
//                                            NSLocalizedString(@"55", nil)];
//    
//    
//    
//    //    CGFloat ww = SCREENWIDTH/3,hh = [GZGApplicationTool control_height:305];
//    CGFloat ww = [GZGApplicationTool control_wide:132.0f],hh = [GZGApplicationTool control_height:176.0f];
//    //    CGFloat titleWidh = [GZGApplicationTool control_wide:41];
//    CGFloat xx = SCREENWIDTH,yy = [GZGApplicationTool control_height:278];
//    
//    
//    for (NSInteger i=0; i<imageMeternallImageArr.count; i++) {
//        CGFloat xxx = 0 + i%3*(xx/3),yyy = [GZGApplicationTool control_height:10] + i/3*yy;
//        GZGUpImageDownTitleBtn *maternalBtn = [[GZGUpImageDownTitleBtn alloc] initWithFrame:CGRectMake(xxx, yyy, xx/3, yy)];
//        maternalBtn.widhSize = ww;
//        maternalBtn.heightSize = hh;
//        [maternalBtn setTitle:titleMaternaallTitleArraay[i] forState:UIControlStateNormal];
//        maternalBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
//        [maternalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [maternalBtn sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:imageMeternallImageArr[i]]];
//        maternalBtn.tag = i+ MaternalBtnTag;
//        [maternalBtn addTarget:self action:@selector(maternalBtnDown:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:maternalBtn];
//    }
//    
//    for (NSInteger i=0; i<2; i++) {
//        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(xx/3+i*(xx/3),  [GZGApplicationTool control_height:10], 0.5, yy*2)];
//        viewLine.backgroundColor = [UIColor grayColor];
//        [self addSubview:viewLine];
//    }
//    
//    for (NSInteger i=0; i<1; i++) {
//        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:10] + yy+i *yy, SCREENWIDTH, 0.5)];
//        viewLine.backgroundColor = [UIColor grayColor];
//        [self addSubview:viewLine];
//    }
//    
//    UIButton *moreBtn = [UIButton   buttonWithType:UIButtonTypeCustom];
//    moreBtn.frame = CGRectMake((SCREENWIDTH - [GZGApplicationTool control_wide:160])/2, yy * 2 + [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:160], [GZGApplicationTool control_height:50]);
//    [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [moreBtn setTitle:NSLocalizedString(@"GZGGPMaternalInfant_CCGDSP", nil) forState:UIControlStateNormal];
//    moreBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
//    [moreBtn addTarget:self action:@selector(moreBtnDown) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:moreBtn];
    
    
    CGFloat hh = [GZGApplicationTool control_height:0.0f];
    CGFloat w = SCREENWIDTH,h = SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize] - hh;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:10], w, h) collectionViewLayout:flowLayout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerClass:[GZGNewPavilonCellCollecationCelll class] forCellWithReuseIdentifier:CountriesHeadFaceCollectionCell];
    [self.collection registerClass:[GZGNewPavilonCellCollecationCelll class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CountriesHeadFaceCollectionCell];
    self.collection.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collection];
    
}

#pragma  mark 系统的代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([GZGApplicationTool control_wide:214.0f],[GZGApplicationTool control_height:276.0f]);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GZGNewPavilonCellCollecationCelll *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CountriesHeadFaceCollectionCell forIndexPath:indexPath];
    
    [cell.cellImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray[indexPath.row] objectForKey:@"image"]] placeholderImage:nil];
    cell.cellName.text = [_dataArray[indexPath.row] objectForKey:@"name"];
    
    
//    GZGSpecialPerformanceModel * model = self.dataArr[indexPath.row];
//    [cell.cellHeadImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:self.cellPlaceholderHeadImage];
//    cell.cellCountriesTitle.text = model.name;
//    cell.cellTitleName.text = model.name;
//    cell.cellTitleQuality.text = model.name;
//    cell.cellPriceLab.text = [NSString stringWithFormat:@"%f",model.price];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets set = UIEdgeInsetsMake([GZGApplicationTool control_height:24],[GZGApplicationTool control_wide:24],0,[GZGApplicationTool control_height:24]);
    return set;
}



- (void)moreBtnDown{
    [self.delegate maternalBtnIndex:GZGGPMaternalInfantCellIndex_CCGDSP];//99为TagID 便于判断
}

- (void)maternalBtnDown:(UIButton *)btn{
    [self.delegate maternalBtnIndex:btn.tag - MaternalBtnTag];
}


- (void)loadData:(NSArray *)arr{
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:arr];
    [self.collection reloadData];
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
