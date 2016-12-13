//
//  GZGSpecialPerformanceViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpecialPerformanceViewController.h"
#import "GZGTheShoppingCartViewController.h"
#import "GZGSearchViewController.h"
#import "GZGSpecialPerformanceView.h"
#import "GZGSpecialPerformanceCell.h"
#import "GZGSPDropMenuView.h"
#import "GZGSpecialPerformanceModel.h"
#import "GZGYAPIHelper.h"
#import "GZGYDetailsViewController.h"
#import "YDTopTitleRolling.h"
#import "GZGSpeciaPerReusableView.h"
@interface UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end

static NSString *SpecialPerformanceCellStr = @"SpecialPerformanceCellStr";



@implementation UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end

@interface GZGSpecialPerformanceViewController () <SpecialPerformanceDelegeteClickProtocol, GZGPageViewDelegate,GZGPageViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,YDTopTitleRollingDelegate> {
    GZGPageView * _pageView;
    GZGSpecialPerformanceView * segment;
    NSArray * nameArray;
}
/** 下拉菜单 */
@property (nonatomic, strong) GZGSPDropMenuView *dropdownMenu;
@property (nonatomic, strong) NSMutableArray * mutableDatas;
@property(nonatomic, strong) YDTopTitleRolling *ydTopTitleRollingView;
@property(nonatomic, strong ) UICollectionView *collectionView;
@property(nonatomic, strong) GZGSpeciaPerReusableView *speciaPerReusableView;
@end




@implementation GZGSpecialPerformanceViewController
- (NSMutableArray *)mutableDatas {
    
    if (_mutableDatas == nil) {
        _mutableDatas = [NSMutableArray array];
    }
    return _mutableDatas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.rightBtn setImage:[[UIImage imageNamed:@"GlobalPurchaaingEtc"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    
    /** 初始化下拉菜单 */
    [self setupDropDownMenu];
    
//    nameArray = @[@"妈妈最爱",@"进口奶粉",@"大牌尿裤",@"健康辅助"];
//    
//    segment = [[GZGSpecialPerformanceView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
//    [segment updateChannels:nameArray];
//    segment.delegate = self;
//    [self.view addSubview:segment];
////
//    _pageView =[[GZGPageView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:90] + [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], self.view.bounds.size.height - [GZGApplicationTool control_height:90] - [GZGApplicationTool navBarAndStatusBarSize])];
//    _pageView.datasource = self;
//    _pageView.delegate = self;
//    [_pageView reloadData];
//    [_pageView changeToItemAtIndex:0];
//    [self.view addSubview:_pageView];
    
    
    NSArray *titleArr = @[@"妈妈最爱",@"进口奶粉",@"大牌尿裤",@"健康辅助"];
    
    
    _ydTopTitleRollingView = [[YDTopTitleRolling alloc] initWithFrame:
                                  CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:94])
                                                            topTitleArray:titleArr
                                                              selectColor:[GZGColorClass subjectCountriesHeadFaceSelectTitleColor]
                                                             defauleColor:[GZGColorClass subjectCountriesHeadFaceCancleSelectTitleColor]
                                                                titleFont:[UIFont systemFontOfSize:13]
                                                             titleSpacing:10.0f
                                                                lineWidth:2.0f
                                  ];
    _ydTopTitleRollingView.backgroundColor = [UIColor whiteColor];
    _ydTopTitleRollingView.delegate = self;
    [self.view addSubview:self.ydTopTitleRollingView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _ydTopTitleRollingView.onTheOffset, SCREENWIDTH, SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:94]) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[GZGSpecialPerformanceCell class] forCellWithReuseIdentifier:SpecialPerformanceCellStr];
    [_collectionView registerClass:[GZGSpecialPerformanceCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SpecialPerformanceCellStr];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    
    [self requestDataWithProductCategoryId:@"11"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 自己的方法
/** 数据请求 */
- (void)requestDataWithProductCategoryId:(NSString *)productCategoryId {
    NSDictionary * dict = @{@"productCategoryId":productCategoryId};
    [[GZGYAPIHelper shareAPIHelper] specialPerformanceDict:dict finish:^(NSArray *goods) {
        [_mutableDatas removeAllObjects];
        for (int i = 0; i < goods.count; i ++) {
            NSDictionary * dict1 = goods[i];
            GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dict1];
            [_mutableDatas addObject:model];
        }
        
        
        [_collectionView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"错误信息:%@",error);
    }];
}
/** 初始化下拉菜单 */
- (void)setupDropDownMenu {
    NSArray *modelsArray = [self getMenuModelsArray];
    
    self.dropdownMenu = [GZGSPDropMenuView ff_DefaultStyleDropDownMenuWithMenuModelsArray:modelsArray menuWidth:FFDefaultFloat eachItemHeight:FFDefaultFloat menuRightMargin:FFDefaultFloat triangleRightMargin:FFDefaultFloat];
    self.dropdownMenu.triangleColor = [UIColor lightGrayColor];
    self.dropdownMenu.menuItemBackgroundColor = FFColor(0, 0, 0, 0.6);
}

/** 获取菜单模型数组 */
- (NSArray *)getMenuModelsArray {
    __weak typeof(self) weakSelf = self;
    
    //菜单模型0
    FFDropDownMenuModel *menuModel0 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"消息" menuItemIconName:@"QQG_Message"  menuBlock:^{
        NSLog(@"消息");
    }];
    
    
    //菜单模型1
    FFDropDownMenuModel *menuModel1 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"首页" menuItemIconName:@"QQG_Home" menuBlock:^{
        NSLog(@"首页");
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    //菜单模型2
    FFDropDownMenuModel *menuModel2 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"搜索" menuItemIconName:@"QQG_Search" menuBlock:^{
        NSLog(@"搜索");
        GZGSearchViewController * searchVC = [[GZGSearchViewController alloc] init];
        [weakSelf.navigationController pushViewController:searchVC animated:YES];
    }];
    
    //菜单模型3
    FFDropDownMenuModel *menuModel3 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:@"购物车" menuItemIconName:@"QQG_ShoppingCart"  menuBlock:^{
        NSLog(@"购物车");
        GZGTheShoppingCartViewController * shoppingCartVC = [[GZGTheShoppingCartViewController alloc] init];
        shoppingCartVC.view.frame = CGRectMake(shoppingCartVC.view.frame.origin.x, shoppingCartVC.view.frame.origin.y, shoppingCartVC.view.frame.size.width, shoppingCartVC.view.frame.size.height + 44);
        [weakSelf.navigationController pushViewController:shoppingCartVC animated:YES];
    }];
    
    NSArray *menuModelArr = @[menuModel0, menuModel1, menuModel2, menuModel3];
    return menuModelArr;
}

/** 显示下拉菜单 */
- (void)showDropDownMenu {
    [self.dropdownMenu showMenu];
}
- (void)rightBtnDown{
    [self showDropDownMenu];
}
#pragma mark - JXPageViewDataSource
-(NSInteger)numberOfItemInJXPageView:(GZGPageView *)pageView{
    return nameArray.count;
}

//-(UIView*)pageView:(GZGPageView *)pageView viewAtIndex:(NSInteger)index{
//    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
//    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], _pageView.frame.size.height) collectionViewLayout:layout];
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.itemSize = CGSizeMake([GZGApplicationTool control_wide:328], [GZGApplicationTool control_height:420]);
//    collectionView.backgroundColor = [@"fee4e6" hexStringToColor];
//    [collectionView registerClass:[GZGSpecialPerformanceCell class] forCellWithReuseIdentifier:@"SpecialPerformance"];
//    collectionView.bounces = YES;
//    collectionView.dataSource = self;
//    collectionView.delegate = self;
//    
//    return collectionView;
//}

//#pragma mark - JXSegmentDelegate
//- (void)segment:(GZGSpecialPerformanceView*)segment didSelectIndex:(NSInteger)index{
//    [_pageView changeToItemAtIndex:index];
//    switch (_pageView.currentIndex) {
//        case 0: {
//            // 妈妈最爱
//            [self requestDataWithProductCategoryId:@"11"];
//        }
//            break;
//        case 1: {
//            // 进口奶粉
//            [self requestDataWithProductCategoryId:@"31"];
//        }
//            break;
//        case 2: {
//            // 大牌尿裤
//            [self requestDataWithProductCategoryId:@"21"];
//        }
//            break;
//        case 3: {
//            // 健康辅助
//            [self requestDataWithProductCategoryId:@"41"];
//        }
//            break;
//    }
//}
//
//#pragma mark - JXPageViewDelegate
//- (void)didScrollToIndex:(NSInteger)index{
//    [segment didChengeToIndex:index];
//}



#pragma mark - UICollectionDataSource
////////======
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mutableDatas.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    /*
     JHHeaderReusableView 头部的类
     kHeaderID  重用标识
     */
    if (kind == UICollectionElementKindSectionHeader) {
        
        _speciaPerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:SpecialPerformanceCellStr forIndexPath:indexPath];
        
        
        return _speciaPerReusableView;
        
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREENWIDTH, [GZGApplicationTool control_height:172]);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    GZGSpecialPerformanceCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:SpecialPerformanceCellStr forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.type = SpecialPerformanceTypeSpecialPackagesMailed;
    GZGSpecialPerformanceModel * model = self.mutableDatas[indexPath.row];
    cell.commodityNameLabel.text = model.name;
    cell.commodityNowPriceLabel.text = [NSString stringWithFormat:@"￥%.0f",model.price];
    cell.commodityOriginalPriceLabel.attributedText = [cell attributedStringHorzontalLineWithString:[NSString stringWithFormat:@"￥%.0f",model.market_price]];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * urlString = [model.image stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        });
    });
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([GZGApplicationTool control_wide:330.0f],[GZGApplicationTool control_height:420.0f]);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets set = UIEdgeInsetsMake([GZGApplicationTool control_height:22],[GZGApplicationTool control_wide:22],0,[GZGApplicationTool control_height:22]);
    return set;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GZGSpecialPerformanceModel * model = self.mutableDatas[indexPath.row];
    
    GZGYDetailsViewController * detailsVC = [[GZGYDetailsViewController alloc] init];
    detailsVC.shopName = model.name;
    detailsVC.shopImg = model.image;
    detailsVC.shopID = model.ID;
    switch (_pageView.currentIndex) {
        case 0: {
            // 妈妈最爱
            detailsVC.productCategoryId = @"11";
        }
            break;
        case 1: {
            // 进口奶粉
            detailsVC.productCategoryId = @"31";
        }
            break;
        case 2: {
            // 大牌尿裤
            detailsVC.productCategoryId = @"21";
        }
            break;
        case 3: {
            // 健康辅助
            detailsVC.productCategoryId = @"41";
        }
            break;
    }
    [self.navigationController pushViewController:detailsVC animated:YES];
}

- (void)titleRollingIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}


@end
