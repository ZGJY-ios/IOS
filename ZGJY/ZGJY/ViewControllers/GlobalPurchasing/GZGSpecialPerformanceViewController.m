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

@interface UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end

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

@interface GZGSpecialPerformanceViewController () <SpecialPerformanceDelegeteClickProtocol, GZGPageViewDelegate,GZGPageViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate> {
    GZGPageView * _pageView;
    GZGSpecialPerformanceView * segment;
    NSArray * nameArray;
}
/** 下拉菜单 */
@property (nonatomic, strong) GZGSPDropMenuView *dropdownMenu;
@property (nonatomic, strong) NSMutableArray * mutableDatas;
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
        UICollectionView * collectionView = _pageView.itemsArray[_pageView.currentIndex];
        
        [collectionView reloadData];
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
    switch (_pageView.currentIndex) {
        case 0: {
            // 妈妈最爱
            [self requestDataWithProductCategoryId:@"11"];
        }
            break;
        case 1: {
            // 进口奶粉
            [self requestDataWithProductCategoryId:@"31"];
        }
            break;
        case 2: {
            // 大牌尿裤
            [self requestDataWithProductCategoryId:@"21"];
        }
            break;
        case 3: {
            // 健康辅助
            [self requestDataWithProductCategoryId:@"41"];
        }
            break;
    }
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
    return self.mutableDatas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    GZGSpecialPerformanceCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecialPerformance" forIndexPath:indexPath];
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
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake([GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:25]);
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


@end
