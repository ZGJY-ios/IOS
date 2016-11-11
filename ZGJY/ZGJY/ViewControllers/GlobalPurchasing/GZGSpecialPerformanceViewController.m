//
//  GZGSpecialPerformanceViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpecialPerformanceViewController.h"
#import "GZGSpecialPerformanceView.h"
#import "GZGSpecialPerformanceCell.h"


@interface GZGSpecialPerformanceViewController () <SpecialPerformanceDelegeteClickProtocol, GZGPageViewDelegate,GZGPageViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate> {
    GZGPageView * _pageView;
    GZGSpecialPerformanceView * segment;
    NSArray * nameArray;
}
@end

@implementation GZGSpecialPerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"母婴专场", nil);
    
    nameArray = @[@"妈妈最爱",@"进口奶粉",@"大牌尿裤",@"健康辅助"];
    
    segment = [[GZGSpecialPerformanceView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
    [segment updateChannels:nameArray];
    segment.delegate = self;
    [self.view addSubview:segment];
    
    _pageView =[[GZGPageView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:90] + [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], self.view.bounds.size.height - [GZGApplicationTool control_height:90] - [GZGApplicationTool navBarAndStatusBarSize])];
    _pageView.datasource = self;
    _pageView.delegate = self;
    [_pageView reloadData];
    [_pageView changeToItemAtIndex:0];
    [self.view addSubview:_pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - JXPageViewDataSource
-(NSInteger)numberOfItemInJXPageView:(GZGPageView *)pageView{
    return nameArray.count;
}

-(UIView*)pageView:(GZGPageView *)pageView viewAtIndex:(NSInteger)index{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], _pageView.frame.size.height) collectionViewLayout:layout];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake([GZGApplicationTool control_wide:328], [GZGApplicationTool control_height:420]);
    collectionView.backgroundColor = [@"fee4e6" hexStringToColor];
    [collectionView registerClass:[GZGSpecialPerformanceCell class] forCellWithReuseIdentifier:@"SpecialPerformance"];
    collectionView.bounces = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    return collectionView;
}

#pragma mark - JXSegmentDelegate
- (void)segment:(GZGSpecialPerformanceView*)segment didSelectIndex:(NSInteger)index{
    [_pageView changeToItemAtIndex:index];
}

#pragma mark - JXPageViewDelegate
- (void)didScrollToIndex:(NSInteger)index{
    [segment didChengeToIndex:index];
}
#pragma mark - UICollectionDataSource
////////======
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    GZGSpecialPerformanceCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecialPerformance" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.type = SpecialPerformanceTypeSpecialPackagesMailed;
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake([GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:25]);
}


@end
