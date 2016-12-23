//
//  ClassifiCationViewController.m
//  ZGJY
//
//  Created by YYS on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGClassifiCationViewController.h"
#import "GZGYRightCollectionViewCell.h"
#import "GZGYClassModel.h"
#import "GZGYActivityCollectionViewCell.h"
#import "GZGYSegView.h"
#import "GZGYBrandCollectionViewCell.h"
#import "GZGYDetailsViewController.h"
#import "GZGYoneClassification.h"
#import "GZGYsecondClassification.h"
#import "GZGYBrandModel.h"
#import "GZGSearchListController.h"
#import "GZGYShopListViewController.h"
@interface GZGClassifiCationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,SegDelegeteClickProtocol,UITextFieldDelegate>
{
    UIView*ViewHead;
    NSArray*DataArray;
    UIView * NilView;
    NSInteger number;
}
@property(nonatomic, strong)NSMutableArray * oneIDArray;
@property(nonatomic, strong)NSMutableArray * twoIDArray;
@property(nonatomic, strong)NSMutableArray * brandIDArray;
@property(nonatomic, strong)NSArray<GZGYoneClassification*> * model;
@property(nonatomic, strong)GZGYoneClassification * oneModel;
@property(nonatomic, strong)NSArray<GZGYsecondClassification*> * twoModel;
@property(nonatomic, strong)GZGYsecondClassification * secondModel;
@property(nonatomic, strong)NSArray<GZGYBrandModel*> * brandModel;
@property(nonatomic,strong)UICollectionView * CollectionView;
@property(nonatomic,strong)UITableView * TableView;
@property(nonatomic,strong)UICollectionView * brandCollection;
@property(nonatomic,strong)GZGYSegView * segView;
@property(nonatomic,retain)NSArray * NameArray;
@property(nonatomic,retain)NSString * NameTitle;
@property(nonatomic,retain)UIScrollView * ScrollView;
@property(nonatomic,strong)UIView * twoView;
@end

@implementation GZGClassifiCationViewController
-(NSMutableArray *)oneIDArray
{
    if (_oneIDArray == nil) {
        _oneIDArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _oneIDArray;
}
-(NSMutableArray *)twoIDArray
{
    if (_twoIDArray == nil) {
        _twoIDArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _twoIDArray;
}
-(NSMutableArray *)brandIDArray
{
    if (_brandIDArray == nil) {
        _brandIDArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _brandIDArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    self.titles.text = @"分类";
    self.view.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    self.NameArray = @[@"分类",@"品牌"];
    //搜索框
//    [self SearchInterface];
    [self ScrollViewInterface];
    //Seg
    [self SegViewInterface];
    [self refreshTableView:0];
    [self oneClassifcation];
    [self NilviewInterface];
}
-(void)viewWillAppear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] setObject:@"2" forKey:@"TABBARID"];
}
#pragma mark --- 搜索框
-(void)SearchInterface
{
    UIView* textview = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:100])];
    textview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textview];
    UIView * fieldView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], SCREENWIDTH-[GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:60])];
    fieldView.backgroundColor = [UIColor colorWithRed:214/255.0 green:213/255.0 blue:211/255.0 alpha:1.0];
    fieldView.layer.cornerRadius = 5;
    fieldView.layer.borderColor = [UIColor colorWithRed:214/255.0 green:213/255.0 blue:211/255.0 alpha:1.0].CGColor;
    fieldView.layer.borderWidth = 1;
    [fieldView.layer setMasksToBounds:YES];
    [textview addSubview:fieldView];
    UITextField * textfiled = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:60], 0, SCREENWIDTH-[GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:60])];
    textfiled.font = [UIFont systemFontOfSize:14];
    textfiled.placeholder = @"请输入品牌名称";
    textfiled.delegate = self;
    [fieldView addSubview:textfiled];
    UIImageView * searchImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"-magnify-glass@2x"]];
    searchImg.frame = CGRectMake([GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    [fieldView addSubview:searchImg];
}
#pragma mark --- scrollview
-(void)ScrollViewInterface
{
    self.ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:100]+[GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-64-[GZGApplicationTool control_height:100]-self.tabBarController.tabBar.frame.size.height)];
    self.ScrollView.delegate = self;
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.bounces = NO;
    self.ScrollView.contentSize = CGSizeMake(SCREENWIDTH * _NameArray.count, self.ScrollView.frame.size.height);
    self.ScrollView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self.view addSubview:self.ScrollView];
}
#pragma mark --- Seg
-(void)SegViewInterface
{
    self.segView = [[GZGYSegView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:95]) NameArray:_NameArray];
    self.segView.delegate = self;
    self.segView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segView];
    [self addTableViewToScrollView:self.ScrollView count:_NameArray.count frame:CGRectZero];
}
#pragma mark --- tableview collection
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (_TableView == nil) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/3-7, self.ScrollView.frame.size.height)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
    }
    [self.ScrollView addSubview:self.TableView];
    
    if (_CollectionView == nil) {
        UICollectionViewFlowLayout*flowlay = [[UICollectionViewFlowLayout alloc]init];
        flowlay.headerReferenceSize = CGSizeMake(SCREENWIDTH/3*2, SCREENHEIGHT/20+10);
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREENWIDTH/3, 0, SCREENWIDTH/3*2, self.ScrollView.frame.size.height) collectionViewLayout:flowlay];
        self.CollectionView.alwaysBounceVertical = YES;//不满一屏也可滚动
        flowlay.minimumLineSpacing = 5;
        flowlay.minimumInteritemSpacing = 0;
        flowlay.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        [_CollectionView registerClass:[GZGYActivityCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_CollectionView registerClass:[GZGYRightCollectionViewCell class] forCellWithReuseIdentifier:@"Rcell"];
        //_CollectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
        [_CollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        _CollectionView.backgroundColor = [UIColor whiteColor];
        _CollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    [self.ScrollView addSubview:self.CollectionView];
    
    
    if (_brandCollection == nil) {
        UICollectionViewFlowLayout*brandflowlay = [[UICollectionViewFlowLayout alloc]init];
        brandflowlay.headerReferenceSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT/20+10);
        _brandCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.ScrollView.frame.size.height) collectionViewLayout:brandflowlay];
        self.brandCollection.alwaysBounceVertical = YES;//不满一屏也可滚动
        brandflowlay.minimumLineSpacing = 5;
        brandflowlay.minimumInteritemSpacing = 0;
//        brandflowlay.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        [_brandCollection registerClass:[GZGYBrandCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _brandCollection.delegate = self;
        _brandCollection.dataSource = self;
        _brandCollection.backgroundColor = [UIColor whiteColor];
        _brandCollection.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.ScrollView addSubview:self.brandCollection];
    }
}
#pragma mark --- 一级分类
-(void)oneClassifcation
{
    [[GZGYAPIHelper shareAPIHelper]oneClassificationDict:nil Finsh:^(NSArray *listArray) {
        for (int i = 0; i<listArray.count;i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic = listArray[i];
            [self.oneIDArray addObject:dic[@"id"]];
        }
        self.model = [GZGYoneClassification mj_objectArrayWithKeyValuesArray:listArray];
        [_TableView reloadData];
        if (self.model.count>0) {
            [self.TableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];//设置选中第一行（默认有蓝色背景）
            [self tableView:self.TableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];//实现点击第一行所调用的方法
        }
    }];
}
#pragma mark --- 二级分类
-(void)secondClassification:(NSInteger)sender
{
    [self.twoIDArray removeAllObjects];
    NSDictionary * dict = @{@"parentId":_oneIDArray[sender]};
    [[GZGYAPIHelper shareAPIHelper]secondClassificationDict:dict Finsh:^(NSArray *listArray) {
        for (int i = 0; i<listArray.count;i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic = listArray[i];
            [self.twoIDArray addObject:dic[@"id"]];
        }
        self.twoModel = [GZGYsecondClassification mj_objectArrayWithKeyValuesArray:listArray];
        [_CollectionView reloadData];
        if (self.twoModel.count == 0) {
            NilView.hidden = NO;
        }else
        {
            NilView.hidden = YES;
        }
    }];
}
#pragma mark --- 品牌数据
-(void)BrandData
{
    [[GZGYAPIHelper shareAPIHelper]brandListDict:nil Finsh:^(NSArray *listArray) {
        for (int i = 0; i<listArray.count;i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic = listArray[i];
            [self.brandIDArray addObject:dic[@"id"]];
        }
        self.brandModel = [GZGYBrandModel mj_objectArrayWithKeyValuesArray:listArray];
        [_brandCollection reloadData];
    }];
}
#pragma mark --- tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    _oneModel = self.model[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_oneModel.name];
    cell.textLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [_CollectionView scrollRectToVisible:CGRectMake(0, -5, self.CollectionView.frame.size.width, self.CollectionView.frame.size.height) animated:YES];
    if (self.model.count>0) {
        [self secondClassification:indexPath.row];
    }
    [_CollectionView reloadData];
}
#pragma mark --- collectionview
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([collectionView isEqual:self.CollectionView]) {
        return self.twoModel.count;
    }else{
        return self.brandModel.count;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.CollectionView]) {
        return CGSizeMake(SCREENWIDTH/9*3-10, [GZGApplicationTool control_height:70]);
    }else{
        return CGSizeMake(SCREENWIDTH/9*3-10, [GZGApplicationTool control_height:150]);
    }
}
//设置分区的位置
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 5, 10, 5);//分别为上、左、下、右
}
//两个cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return [GZGApplicationTool control_wide:20];
}

// 两行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return [GZGApplicationTool control_height:20];
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.CollectionView]) {
        static NSString*identify = @"Rcell";
        GZGYRightCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
        cell.model = self.twoModel[indexPath.row];
        cell.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        return cell;
    }else{
        static NSString*identify = @"cell";
        GZGYBrandCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        cell.model = self.brandModel[indexPath.row];
        [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
        return cell;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if ([collectionView isEqual:self.CollectionView]) {
        return CGSizeMake(SCREENWIDTH/3*2, [GZGApplicationTool control_height:190]);
    }else{
        return CGSizeMake(0, 0);
    }
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.CollectionView]) {
        UICollectionReusableView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        UIImageView * imgHeadView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH/3*2, [GZGApplicationTool control_height:200])];
        imgHeadView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
        [headerView addSubview:imgHeadView];
        return headerView;
    }else{
        return nil;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    GZGLog(@"%ld",indexPath.row);
    if ([collectionView isEqual:self.CollectionView]) {
        GZGYShopListViewController * searchVC = [[GZGYShopListViewController alloc]init];
        searchVC.string = [NSString stringWithFormat:@"%@",_twoIDArray[indexPath.row]];
        searchVC.stateString = @"分类";
        searchVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:searchVC animated:YES];
    }else{
        GZGYShopListViewController * searchVC = [[GZGYShopListViewController alloc]init];
        searchVC.string = [NSString stringWithFormat:@"%@",_brandIDArray[indexPath.row]];
        searchVC.stateString = @"品牌";
        searchVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:searchVC animated:YES];
    }
}
#pragma mark --- 分类为空界面
-(void)NilviewInterface
{
    NilView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:300], SCREENWIDTH/3*2, SCREENHEIGHT-[GZGApplicationTool control_height:400]-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize])];
    NilView.backgroundColor = [UIColor whiteColor];
    UIImageView * nilImage = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:100], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:200])];
    nilImage.image = [UIImage imageNamed:@"图层-0"];
    [NilView addSubview:nilImage];
    UILabel * nilLbael = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:350], SCREENWIDTH/3*2, [GZGApplicationTool control_height:50])];
    nilLbael.text = @"此分类暂无商品";
    nilLbael.font = [UIFont boldSystemFontOfSize:25];
    nilLbael.textAlignment = NSTextAlignmentCenter;
    [NilView addSubview:nilLbael];
    [self.CollectionView addSubview:NilView];
    NilView.hidden = YES;
}
- (void)changeView:(float)x {
    float xx = x*(1.0f/2.0f);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]||[scrollView isKindOfClass:[UICollectionView class]]) {
        
    }
    else
    {
        [self changeView:scrollView.contentOffset.x];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]||[scrollView isKindOfClass:[UICollectionView class]]) {
        
    }
    else
    {
        float xx = scrollView.contentOffset.x * (0.5) - SCREENWIDTH/2;
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / SCREENWIDTH);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    if (index == 0) {
        UIButton * classBtn = self.segView.nameArray[0];
        UIButton * brandBtn = self.segView.nameArray[1];
        [classBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:43/255.0 blue:44/255.0 alpha:1.0] forState:UIControlStateNormal];
        [brandBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        CGRect frame = CGRectMake(0, 0, SCREENWIDTH/3-7, self.ScrollView.frame.size.height);
        CGRect frame1 = CGRectMake(SCREENWIDTH/3, 0, SCREENWIDTH/3*2, self.ScrollView.frame.size.height);
        frame.origin.x = 0;
        frame1.origin.x = SCREENWIDTH/3;
        [self.TableView setFrame:frame];
        [self.CollectionView setFrame:frame1];
    }else{
        UIButton * classBtn = self.segView.nameArray[0];
        UIButton * brandBtn = self.segView.nameArray[1];
        [classBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [brandBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:43/255.0 blue:44/255.0 alpha:1.0] forState:UIControlStateNormal];
        if (number == 0) {
            [self BrandData];
        }
        number++;
        CGRect frame = CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.ScrollView.frame.size.height);
        frame.origin.x = SCREENWIDTH;
        [self.twoView setFrame:frame];
    }
}

-(void)SegBtnDelegate:(NSInteger)sender
{
    [self.view endEditing:YES];
    [self.ScrollView setContentOffset:CGPointMake(SCREENWIDTH * sender, 0) animated:YES];
    float xx = SCREENWIDTH * (sender - 1) * (0.5) - SCREENWIDTH/2;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
