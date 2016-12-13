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
@interface GZGClassifiCationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,SegDelegeteClickProtocol,UITextFieldDelegate>
{
    UIView*ViewHead;
    NSArray*DataArray;
    NSArray*classArray;
    NSInteger number;
}
@property(nonatomic,retain)NSMutableArray*SecArray;
@property(nonatomic,strong)NSArray<GZGYClassModel*>*model;
@property(nonatomic,strong)UICollectionView*CollectionView;
@property(nonatomic,strong)UITableView*TableView;
@property(nonatomic,strong)UICollectionView*brandCollection;
@property(nonatomic,strong)GZGYSegView*segView;
@property(nonatomic,retain)NSArray*NameArray;
@property(nonatomic,retain)NSString*NameTitle;
@property(nonatomic,retain)UIScrollView*ScrollView;
@property(nonatomic,strong)UIView*twoView;
@end

@implementation GZGClassifiCationViewController
-(NSMutableArray*)SecArray
{
    if (_SecArray == nil) {
        _SecArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _SecArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    self.titles.text = @"分类";
    number = 0;
    self.view.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    classArray = @[@"精品男装",@"潮流女装",@"母婴用品",@"儿童玩具",@"个护化妆",@"家用电器",@"电脑办公",@"手机数码",@"母婴童装",@"图书音像",@"家居家纺",@"家居生活",@"家具建材",@"食品生鲜",@"酒水饮料",@"运动户外",@"奢品礼品"];
    self.NameArray = @[@"分类",@"品牌"];
    DataArray = @[@{@"SecStr":@"常用分类",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]},@{@"SecStr":@"专场推荐",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]},@{@"SecStr":@"热门分类",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]}];
    self.model = DataArray;
    for (int i = 0; i<DataArray.count; i++) {
        NSString*String = DataArray[i][@"SecStr"];
        [self.SecArray addObject:String];
    }
    //搜索框
    [self SearchInterface];
    [self ScrollViewInterface];
    //Seg
    [self SegViewInterface];
    //scrollview
//    [self ScrollViewInterface];
    [self refreshTableView:0];
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
    self.ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:200]+[GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-64-[GZGApplicationTool control_height:200]-self.tabBarController.tabBar.frame.size.height)];
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
    self.segView = [[GZGYSegView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:101]+[GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:95]) NameArray:_NameArray];
    self.segView.delegate = self;
    self.segView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segView];
    [self addTableViewToScrollView:self.ScrollView count:_NameArray.count frame:CGRectZero];
}
#pragma mark --- tableview collection
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (_TableView == nil) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH/3-7, self.ScrollView.frame.size.height)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
    }
    [self.ScrollView addSubview:self.TableView];
    
    if (_CollectionView == nil) {
        UICollectionViewFlowLayout*flowlay = [[UICollectionViewFlowLayout alloc]init];
        flowlay.headerReferenceSize = CGSizeMake(SCREENWIDTH/3*2, SCREENHEIGHT/20+10);
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREENWIDTH/3, 59, SCREENWIDTH/3*2, self.ScrollView.frame.size.height) collectionViewLayout:flowlay];
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
        brandflowlay.minimumLineSpacing = 5;
        brandflowlay.minimumInteritemSpacing = 0;
        brandflowlay.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        [_brandCollection registerClass:[GZGYBrandCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_brandCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        _brandCollection.delegate = self;
        _brandCollection.dataSource = self;
        _brandCollection.backgroundColor = [UIColor whiteColor];
        _brandCollection.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.ScrollView addSubview:self.brandCollection];
    }
}

#pragma mark --- tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return classArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",classArray[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [_CollectionView scrollRectToVisible:CGRectMake(0, -5, self.CollectionView.frame.size.width, self.CollectionView.frame.size.height) animated:YES];
    
    
    //    _selectedIndex = indexPath.row;
    
    [_CollectionView reloadData];
}
#pragma mark --- collectionview

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout colorForSectionAtIndex:(NSInteger)section;
{
    if (section == 0) {
        return [UIColor redColor];
    }else{
        return [UIColor yellowColor];
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([collectionView isEqual:self.CollectionView]) {
        if (section == 0) {
            return 0;
        }else if (section == 1){
            return 4;
        }
        return 10;
    }else{
        if (section == 0) {
            return 4;
        }else if (section == 1){
            return 4;
        }
        return 4;
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([collectionView isEqual:self.CollectionView]) {
        return 3;
    }else{
        return 3;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.CollectionView]) {
        if (indexPath.section == 1) {
            return CGSizeMake(SCREENWIDTH/3-10, [GZGApplicationTool control_height:110]);
        }
        return CGSizeMake(SCREENWIDTH/9*2-10, SCREENHEIGHT/8);
    }else{
        return CGSizeMake(SCREENWIDTH/9*3-10, [GZGApplicationTool control_height:100]);
    }
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.CollectionView]) {
        if (indexPath.section == 1) {
            static NSString*identify = @"cell";
            GZGYActivityCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
            return cell;
        }else{
            static NSString*identify = @"Rcell";
            GZGYRightCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
            cell.model =[self.model[indexPath.section] valueForKey:@"STR"][indexPath.row];
            NSLog(@"%@",cell.model);
            return cell;
        }
    }else{
        static NSString*identify = @"cell";
        GZGYBrandCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        NSLog(@"%@",[cell superview]);
        [[cell superview] superview].backgroundColor = [UIColor redColor];
        [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
        return cell;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if ([collectionView isEqual:self.CollectionView]) {
        if (section==0) {
            return CGSizeMake(SCREENWIDTH/3*2, [GZGApplicationTool control_height:255]);
        }else{
            return CGSizeMake(SCREENWIDTH/3*2, SCREENHEIGHT/20);
        }
    }else{
        return CGSizeMake(SCREENWIDTH, [GZGApplicationTool control_height:90]);
    }
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    number++;
    NSLog(@"你吗呀%ld",number);
    if ([collectionView isEqual:self.CollectionView]) {
        UICollectionReusableView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            if (number == 5) {
                UIImageView*imgHeadView = [[UIImageView alloc]init];
                imgHeadView.frame = CGRectMake(0, 0, SCREENWIDTH/3*2, [GZGApplicationTool control_height:305]);
                imgHeadView.image = [UIImage imageNamed:@"sy_xspic3.jpg"];
                [headerView addSubview:imgHeadView];
            }else{
                NSLog(@"不建了");
            }
        }else{
            UILabel*HeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, SCREENWIDTH/3*2, SCREENHEIGHT/20)];
            HeadLabel.font = [UIFont systemFontOfSize:13];
            HeadLabel.text = _SecArray[indexPath.section];
            HeadLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
            [headerView addSubview:HeadLabel];
        }
        return headerView;
    }else{
        UICollectionReusableView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        UILabel*HeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT/20)];
        HeadLabel.font = [UIFont systemFontOfSize:13];
        HeadLabel.text = @"世界品牌";
        HeadLabel.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:HeadLabel];
        
        
        return headerView;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    NSLog(@"%ld",indexPath.row);
    if ([collectionView isEqual:self.CollectionView]) {
        GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
        details.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:details animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (void)changeView:(float)x {
    float xx = x*(1.0f/2.0f);
    NSLog(@"~~~~~~~~%f",xx);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        [self changeView:scrollView.contentOffset.x];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        float xx = scrollView.contentOffset.x * (0.5) - SCREENWIDTH/2;
        NSLog(@"%f",xx);
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / SCREENWIDTH);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    if (index == 0) {
        CGRect frame = CGRectMake(0, 0, SCREENWIDTH/3-7, self.ScrollView.frame.size.height);
        CGRect frame1 = CGRectMake(SCREENWIDTH/3, 0, SCREENWIDTH/3*2, self.ScrollView.frame.size.height);
        frame.origin.x = 0;
        frame1.origin.x = SCREENWIDTH/3;
        [self.TableView setFrame:frame];
        [self.CollectionView setFrame:frame1];
    }else{
        CGRect frame = CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.ScrollView.frame.size.height);
        frame.origin.x = SCREENWIDTH;
        [self.twoView setFrame:frame];
    }
}

-(void)SegBtnDelegate:(NSInteger)sender
{
    [self.view endEditing:YES];
    NSLog(@"%ld",sender);
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
