//
//  GZGCountriesPavilionViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesPavilionViewController.h"
#import "GZGCountriesReplenishCell.h"
#import "GZGCountriesHeadFaceCell.h"
#import "YDTopTitleRolling.h"
#import "GZGCountriesTheCostomTableView.h"


@interface GZGCountriesPavilionViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate,
GZGCountriesHeadFaceCellDelegate
>
//@property(nonatomic, strong) UITableView *mainTableView;
@property(nonatomic, strong) GZGCountriesTheCostomTableView *mainTableView;
@property(nonatomic, assign) BOOL isTableViewScrollew;
@property(nonatomic, assign) BOOL isTableViewScrollew1;
@property(nonatomic, assign) BOOL cancelTableScrollew;

@property(nonatomic, strong) NSMutableArray *headFaceArray;

@property(nonatomic, strong) YDTopTitleRolling *ydTopTitleRollingView;
@end

@implementation GZGCountriesPavilionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _headFaceArray = [NSMutableArray array];
    
    _cancelTableScrollew = YES;
    self.titles.text = self.countriesTitle;
    [self.leftBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Search"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Message"] forState:UIControlStateNormal];
//    E0334B
    self.navBarView.backgroundColor = self.navColor;
    self.view.backgroundColor = self.backViewColor;;
    [self buildUI];
    [self loadHeadFacedata];
    [self notififatation];
    
    
//    [self topTItleRollingUI];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark 方法
- (void)buildUI{
    _mainTableView = [[GZGCountriesTheCostomTableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor = [UIColor clearColor];
    _mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.showsHorizontalScrollIndicator = NO;
    _mainTableView.bounces = NO;
    [self.view addSubview:_mainTableView];
}
- (void)notififatation{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(banSliding:) name:GZGCountriesTableBanSlideNotification object:nil];
}



#pragma mark 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       return [GZGApplicationTool control_height:611.0f];
    }else if (indexPath.section == 1){
       return SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize];
    }
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        return 0.00001f;
    }
    return [GZGApplicationTool control_height:20.0f];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *replenishCellStr = @"replenishCellStr";
        GZGCountriesReplenishCell *cell = [tableView dequeueReusableCellWithIdentifier:replenishCellStr];
        if (!cell) {
            cell = [[GZGCountriesReplenishCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:replenishCellStr];
        }
        cell.cellCountriesImage.image = [UIImage imageNamed:@"sy_hgban.jpg"];
        cell.replenishImage = [UIImage imageNamed:@"koho-1.jpg"];
        if (self.countriesIndex == CountriesEnterThe_SouthKorea) {
            cell.oneColor = [@"dd3149" hexStringToColor];
            cell.towColor = [@"ec4c60" hexStringToColor];
        }else if (self.countriesIndex == CountriesEnterThe_Japan) {
            cell.oneColor = [@"e25a2b" hexStringToColor];
            cell.towColor = [@"f08f30" hexStringToColor];
        }else if (self.countriesIndex == CountriesEnterThe_Australia) {
            cell.oneColor = [@"51a8c8" hexStringToColor];
            cell.towColor = [@"48b9e1" hexStringToColor];
        }else{
            cell.oneColor = [@"af347b" hexStringToColor];
            cell.towColor = [@"a94aaa" hexStringToColor];
        }
        
        
        cell.backgroundColor = [UIColor  clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        static NSString *headFaceCellStr = @"headFaceCellStr";
        GZGCountriesHeadFaceCell *cell = [tableView dequeueReusableCellWithIdentifier:headFaceCellStr];
        if (!cell) {
            cell = [[GZGCountriesHeadFaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headFaceCellStr];
        }
        if (self.countriesIndex == CountriesEnterThe_SouthKorea) {
            cell.backgroundColor = [GZGColorClass subjectCountriespacilionSouthKoreaBackColor];
        }else if (self.countriesIndex == CountriesEnterThe_Japan) {
            cell.backgroundColor = [GZGColorClass subjectCountriespacilionJapanBackColor];
        }else if (self.countriesIndex == CountriesEnterThe_Australia) {
            cell.backgroundColor = [GZGColorClass subjectCountriespacilionAustraliaBackColor];
        }else{
            cell.backgroundColor = [GZGColorClass subjectCountriespacilionTheEuropeanBackColor];
        }
        
        
        
        
        
        
        
        
        
        
        cell.delegate = self;
        
        cell.dataArr = _headFaceArray;
        
        cell.cellHeadImageUrl = @"";
        cell.cellPlaceholderHeadImage = [UIImage imageNamed:@"index-Korea.jpg"];
        [cell.collection reloadData];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
    static NSString *vvv = @"xxxxx";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vvv];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vvv];
    }
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat tabOffsetY = [_mainTableView rectForSection:1].origin.y ;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (_cancelTableScrollew == YES) {
        _isTableViewScrollew1 = _isTableViewScrollew;
        
        if (offsetY>=tabOffsetY) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            _isTableViewScrollew = YES;
            
        }else{
            _isTableViewScrollew = NO;
        }
        
        if (_isTableViewScrollew != _isTableViewScrollew1) {
            
            if (!_isTableViewScrollew1 && _isTableViewScrollew) {
                [[NSNotificationCenter defaultCenter] postNotificationName:GZGCountriesTableCanslideNotification object:nil userInfo:@{@"CanSlide":@"YES"}];
                _cancelTableScrollew = NO;
            }
        }
    }else{
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    }
  
}

#pragma mark 自己的代理
//tabBar的TapTitleDelegate
- (void)topTitleIndex:(UILabel *)lab{
    [_mainTableView reloadData];
}


#pragma mark 自己的方法

- (void)banSliding:(NSNotification *)nofiti{
    NSDictionary *userInfo = nofiti.userInfo;
    NSString *canScroll = userInfo[@"BanSlide"];
    if ([canScroll isEqualToString:@"YES"]) {
        _cancelTableScrollew = YES;
        
    }
}

- (void)loadHeadFacedata{
    for (NSInteger i=0; i<10; i++) {
        NSString *countriesTitle = @"【原装进口】可分Confume";
        NSString *titleName = @"纯天然植物染发剂";
        NSString *titleQuality = @"颜色持久 安全染发";
        NSString *priceLab = @"￥125";
        [_headFaceArray addObject:@[countriesTitle,titleName,titleQuality,priceLab]];
    }
    
    [_mainTableView reloadData];
    
}


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
