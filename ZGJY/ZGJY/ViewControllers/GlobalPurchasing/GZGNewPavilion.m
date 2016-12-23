//
//  GZGNewPavilion.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/12/16.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGNewPavilion.h"
#import "GZGNewPavilionCell.h"
#import "GZGCountriesHeadFaceCell.h"
#import "GZGCountriesHeadFaceCollectionCell.h"

static NSString *CountriesHeadFaceCollectionCell = @"CountriesHeadFaceCollectionCell";
@interface GZGNewPavilion ()<UICollectionViewDelegate,UICollectionViewDataSource,GZGCountriesHeadFaceCellDelegate>
@property(nonatomic ,strong)UITableView *mainTableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic,strong) UICollectionView *collection;
@end

@implementation GZGNewPavilion

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray = [NSMutableArray array];
    self.titles.text = self.countriesTitle;
    [self requestDataWithCountriesIndex:self.countriesIndex];
    [self buildUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark 方法
- (void)buildUI{
//    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height)) style:UITableViewStylePlain];
//    _mainTableView.delegate = self;
//    _mainTableView.dataSource = self;
//    _mainTableView.backgroundColor = [UIColor redColor];
//    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    _mainTableView.showsVerticalScrollIndicator = NO;
//    _mainTableView.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:_mainTableView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height)) collectionViewLayout:flowLayout];
    _collection.delegate = self;
    _collection.dataSource = self;
    [self.collection registerClass:[GZGCountriesHeadFaceCollectionCell class] forCellWithReuseIdentifier:CountriesHeadFaceCollectionCell];
    [self.collection registerClass:[GZGCountriesHeadFaceCollectionCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CountriesHeadFaceCollectionCell];
    self.collection.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collection];
}

- (void)requestDataWithCountriesIndex:(CountriesEnterThe)countriesIndex {
    
    
    NSDictionary * dict;
    dict  = @{@"tagIds":self.taglids};
    
    
    [[GZGYAPIHelper shareAPIHelper] pavilionCountries:countriesIndex dict:dict finish:^(NSArray *goods) {
        [_dataArray removeAllObjects];
        for (int i = 0; i < goods.count; i ++) {
            NSDictionary * dict1 = goods[i];
            GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dict1];
            [_dataArray addObject:model];
        }
        [_collection reloadData];
    } failed:^(NSError *error) {
        NSLog(@"错误信息:%@",error);
    }];
    
}

#pragma mark 系统代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
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
    
    GZGSpecialPerformanceModel * model = _dataArray[indexPath.row];
    [cell.cellHeadImage sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    cell.cellCountriesTitle.text = model.name;
    cell.cellTitleName.text = model.name;
    cell.cellTitleQuality.text = model.name;
    cell.cellPriceLab.text = [NSString stringWithFormat:@"%f",model.price];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets set = UIEdgeInsetsMake([GZGApplicationTool control_height:22],[GZGApplicationTool control_wide:22],0,[GZGApplicationTool control_height:22]);
    return set;
}

#pragma mark 自己的代理
- (void)topTitleIndex:(NSInteger)index{
    
}

#pragma mark 自己的方法

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
