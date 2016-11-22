//
//  GZGGlobalPurchasingViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGlobalPurchasingViewController.h"
#import "GZGSearchListController.h" // 搜索列表
#import "YDImageRoll.h"
#import "GZGGPClassifiCationCell.h"
#import "GZGSpellGroupCell.h"
#import "GZGGPGlobalSelectCell.h"
#import "GZGGPMaternalInfantCell.h"
#import "GZGCrossBorderDirectMailCell.h"
#import "GZGCountriesPavilionCell.h"
#import "UIImageView+WebCache.h"
#import "GZGYSalaTableViewCell.h"
#import "GZGSearchViewController.h"
#import "GZGCountriesPavilionViewController.h"
#import "GZGSpecialPerformanceViewController.h"
#import "ZGNetWork.h"
#import "GZGYLimitViewController.h"
#import "GZGYSpellgroupViewController.h"
#import "GZGYDetailsViewController.h"
#import "GZGYSpellTableViewCell.h"
#import "GZGYRootSpellModel.h"
#define CellBlcnkHeadHeight [GZGApplicationTool control_height:20]

@interface GZGGlobalPurchasingViewController ()<
YDImageDelegate,
UITableViewDelegate,
UITableViewDataSource,
GZGGPClassifiCationCellDelegate,
GZGGPGlobalSelectCellDelegate,
GZGGPMaternalInfantCellDelegate,
GZGCrossBorderDirectMailCellDelegate,CollectionViewDelegeteClickProtocol
>
@property(nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray<GZGYRootSpellModel *> *spellModel;
@property(nonatomic, strong)NSMutableArray * limitArray;
@property(nonatomic, strong)NSMutableArray * nameArray;
@property(nonatomic, strong)NSMutableArray * ImgArray;
@end


@implementation GZGGlobalPurchasingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    [self navTitleUI];
    [self tableViewUI];
    [self SpellData];
    
}

- (void)navTitleUI{
    [self.leftBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Search"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Message"] forState:UIControlStateNormal];
    self.titles.hidden = YES;
    
    NSString *navTitleStr = NSLocalizedString(@"GZG_GlobalPurchasingTitleStr", nil);
    CGSize navTitleSize = [GZGApplicationTool textSize:navTitleStr font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:38]] size:SCREENWIDTH];
    UILabel *navTitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - (navTitleSize.width + [GZGApplicationTool control_wide:559/3]))/2,
                                                                  ([GZGApplicationTool navBarAndStatusBarSize] - navTitleSize.height)/2+ [GZGApplicationTool control_height:10],
                                                                  navTitleSize.width,
                                                                  navTitleSize.height)];
    navTitle.text = navTitleStr;
    navTitle.textColor = [UIColor whiteColor];
    navTitle.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:38]];
    [self.view addSubview:navTitle];
    
    UIImageView *iamgeViews = [[UIImageView alloc] initWithFrame:CGRectMake(navTitle.edgnSideOffset + [GZGApplicationTool control_wide:10],
                                                                            ([GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:76/3])/2+ [GZGApplicationTool control_height:10],
                                                                            [GZGApplicationTool control_wide:559/3],
                                                                            [GZGApplicationTool control_height:76/3])];
    iamgeViews.image = [UIImage imageNamed:@"QQG_NavTitleText"];
    [self.view addSubview:iamgeViews];
}


- (void)tableViewUI{
    CGFloat xx = 0, yy = [GZGApplicationTool navBarAndStatusBarSize],ww = SCREENWIDTH, hh = SCREENHEIGHT - yy  - [GZGApplicationTool tabBarSize];
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(xx, yy, ww, hh) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor = [UIColor clearColor];
    _mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_mainTableView];
}
#pragma mark --- 拼团数据
-(void)SpellData
{
    NSDictionary * dic = @{@"tagIds":@"6"};
    [[GZGYAPIHelper shareAPIHelper]SpellGroupURL:@"http://192.168.0.110:8080/appTopic/SpellGroup" Dict:dic Finsh:^(NSArray * dataArray){
        self.spellModel = [GZGYRootSpellModel mj_objectArrayWithKeyValuesArray:dataArray];
        for (int i = 0; i<dataArray.count; i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic = dataArray[i];
            [self.limitArray addObject:dic[@"id"]];
            [self.nameArray addObject:dic[@"full_name"]];
            if (dic[@"image"] == nil) {
                [self.ImgArray addObject:@""];
            }else{
                [self.ImgArray addObject:dic[@"image"]];
            }
        }
        [self.mainTableView reloadData];
    }];
}
#pragma mark 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 1;
    }else if (section == 4){
        return 1;
    }else if (section == 5){
        return 1;
    }else if (section == 6){
        return 4;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [GZGApplicationTool control_height:300.0f];
    }else if (indexPath.section == 1){
        return [GZGApplicationTool control_height:640];
    }else if (indexPath.section == 2){
        return [GZGApplicationTool control_height:260.0f];
    }else if (indexPath.section == 3){
        return [GZGApplicationTool control_height:387.0f];
    }else if (indexPath.section == 4){
        return [GZGApplicationTool control_height:643.0f];
    }else if (indexPath.section == 5){
        return [GZGApplicationTool control_height:530.0f];
    }else if (indexPath.section == 6){
        return [GZGApplicationTool control_height:393.0f] + [GZGApplicationTool control_height:382] + [GZGApplicationTool control_height:20];
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return [GZGApplicationTool control_height:300.0f];
    }else if (section == 1 || section == 2|| section == 3|| section == 5){
        return [GZGApplicationTool control_height:153.0f];
    }else if (section == 4){
        return  [GZGApplicationTool control_height:380.0f];
    }else if (section == 6){
       return [GZGApplicationTool control_height:0.00001f];
    }
    return [GZGApplicationTool control_height:20.0f];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [self tableViewHeadView];
    }else if (section == 1){
        return [self limitedTimeSaleBtnViewImage:[UIImage imageNamed:@"nav_xstm.jpg"] index:section];
    }else if (section == 2){
        return [self limitedTimeSaleBtnViewImage:[UIImage imageNamed:@"nav_hlpt.jpg"] index:section];
    }else if (section == 3){
        return [self limitedTimeSaleBtnViewImage:[UIImage imageNamed:@"nav_qqjx.jpg"] index:section];
    }else if (section == 4){
        return [self limitedTimeSaleBtnViewImage:[UIImage imageNamed:@"sy_myzq.jpg"] index:section];
    }else if (section == 5){
        return [self limitedTimeSaleBtnViewImage:[UIImage imageNamed:@"nav_kjzy.jpg"] index:section];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString *str = @"LYD";
        GZGGPClassifiCationCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[GZGGPClassifiCationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        static NSString *vvv = @"sala";
        GZGYSalaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vvv];
        if (!cell) {
            cell = [[GZGYSalaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vvv];
        }
        cell.delegete = self;
        return cell;
    }else if (indexPath.section == 2){
        static NSString * gZGSpellGroupCellstr = @"gZGSpellGroupCellStr";
        GZGYSpellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:gZGSpellGroupCellstr];
        if (!cell) {
            cell = [[GZGYSpellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:gZGSpellGroupCellstr];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:250/255.0 green:239/255.0 blue:208/255.0 alpha:1.0];
        cell.model = self.spellModel[indexPath.row];
        cell.replenishBtn.tag = indexPath.row;
        [cell.replenishBtn addTarget:self action:@selector(SpellBtn:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (indexPath.section == 3){
        static  NSString *globalSelectCellStr = @"globalSelectCellStr";
        GZGGPGlobalSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:globalSelectCellStr];
        if (!cell) {
            cell = [[GZGGPGlobalSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:globalSelectCellStr];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 4){
        static NSString *maternallnfantCellStr = @"maternallnfantCellStr";
        GZGGPMaternalInfantCell *cell = [tableView dequeueReusableCellWithIdentifier:maternallnfantCellStr];
        if (!cell) {
            cell = [[GZGGPMaternalInfantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:maternallnfantCellStr];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 5){
        static NSString *crossBorderDirectMailCellStr = @"crossBorderDirectMailCellStr";
        GZGCrossBorderDirectMailCell *cell = [tableView dequeueReusableCellWithIdentifier:crossBorderDirectMailCellStr];
        if (!cell) {
            cell = [[GZGCrossBorderDirectMailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:crossBorderDirectMailCellStr];
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 6){
        static NSString *countriesPavilionCellStr = @"countriesPavilionCellStr";
        GZGCountriesPavilionCell *cell = [tableView dequeueReusableCellWithIdentifier:countriesPavilionCellStr];
        if (!cell) {
            cell = [[GZGCountriesPavilionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:countriesPavilionCellStr];
        }
        
        NSArray *indexImageArr = @[@"index-Korea.jpg",@"index-Japan.jpg",@"index-Europe.jpg",@"index-Aussie.jpg"];
        NSArray *syImageArr = @[@"sy_hgpic1",@"sy_hlpic2",@"sy_hlpic3",@"sy_hlpic4"];

        [cell.cellCountriesImage sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:indexImageArr[indexPath.row]]];
        cell.cellGoodsImage = [UIImage imageNamed:syImageArr[indexPath.row]];
        cell.cellGoodsName = @"LYD是个大帅哥哦~~~~~~~~~";
        cell.cellGoodsprice = @"9999";
        cell.cellAddshopping = [UIImage imageNamed:@"QQG_ADD_GWC"];
        
        
        cell.backgroundColor = [UIColor clearColor];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
        details.shopID = self.limitArray[indexPath.row];
        details.shopName = self.nameArray[indexPath.row];
        details.shopImg = self.ImgArray[indexPath.row];
        details.gDetails = GoodsDetailsFireAlsoGroup;
        details.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:details animated:YES];
    }
}
#pragma mark 各个Cell的HeadView
- (UIView *)tableViewHeadView{
    UIView *scrToFigureView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:300])];
    
    YDImageRoll *ydimage = [[YDImageRoll alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:300])];
    ydimage.imageUrlArray = @[@"http://www.shengpet.com/uploads/allimg/140410/2-1404100943143X.jpg",
                              @"http://h.hiphotos.bdimg.com/album/w%3D2048/sign=69b2037aca1349547e1eef6462769358/d000baa1cd11728b707d37d9c9fcc3cec2fd2cfc.jpg",
                              @"http://pic15.nipic.com/20110621/2678842_143658366148_2.jpg",
                              @"http://sc.jb51.net/uploads/allimg/150603/14-150603145201143.jpg"];
    ydimage.time = 3;
    ydimage.delegate = self;
    ydimage.defaultImage = @"33333";
    ydimage.pageCurrentColor = [GZGColorClass gzgNavBarBackColor];
    ydimage.pageTintColor = [UIColor whiteColor];
    [scrToFigureView addSubview:ydimage];
    return scrToFigureView;
}
- (UIView *)limitedTimeSaleBtnViewImage:(UIImage *)imageView index:(NSInteger)index{
    
    UIView *view = [[UIView alloc] init];
    UIButton *limitedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    limitedBtn.backgroundColor = [UIColor    greenColor];
    limitedBtn.frame = CGRectMake(0, CellBlcnkHeadHeight, SCREENWIDTH, [GZGApplicationTool control_height:133.0f]);
    if(index == 4){
        limitedBtn.frame = CGRectMake(0, CellBlcnkHeadHeight, SCREENWIDTH, [GZGApplicationTool control_height:360]);
        limitedBtn.backgroundColor = [UIColor    orangeColor];
    }
    [limitedBtn setImage:imageView forState:UIControlStateNormal];
    limitedBtn.tag = index;
    [limitedBtn addTarget:self action:@selector(limitedBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:limitedBtn];
    return view;
}


#pragma mark 自己的代理
- (void)imageClickIndex:(NSInteger)index{
    NSLog(@"点%ld张",index);
}
- (void)classifiCationBtnIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个按钮",index);
    
    GZGCountriesPavilionViewController *vc = [[GZGCountriesPavilionViewController alloc] init];
    switch (index) {
        case HomeItem_GlobalSelect:{
            GZGYLimitViewController * limit = [[GZGYLimitViewController alloc]init];
            limit.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:limit animated:YES];
            break;
        }
        case HomeItem_LimitedTimeSale:{
            GZGYSpellgroupViewController * spell = [[GZGYSpellgroupViewController alloc]init];
            spell.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:spell animated:YES];
            break;
        }
        case HomeItem_FireAlsoGroup: {
            // 母婴
            GZGSpecialPerformanceViewController * specialPerformanceVC = [[GZGSpecialPerformanceViewController alloc] init];
            specialPerformanceVC.titles.text = NSLocalizedString(@"母婴用品", nil);
            specialPerformanceVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:specialPerformanceVC animated:YES];
        }
            break;
        case HomeItem_CrossBorderDirectMail: {
            // 洗护
            GZGSpecialPerformanceViewController * specialPerformanceVC = [[GZGSpecialPerformanceViewController alloc] init];
            specialPerformanceVC.titles.text = NSLocalizedString(@"洗护用品", nil);
            specialPerformanceVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:specialPerformanceVC animated:YES];
        }
            break;
        case HomeItem_SouthKorea:{
            vc.countriesTitle = @"韩国馆";
            vc.countriesIndex = CountriesEnterThe_SouthKorea;
            vc.backViewColor = [GZGColorClass subjectCountriespacilionSouthKoreaBackColor];
            vc.navColor = [GZGColorClass subjectCountriespacilionSouthKoreaNavColor];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case HomeItem_Japan:{
            vc.countriesTitle = @"日本馆";
            vc.countriesIndex = CountriesEnterThe_Japan;
            vc.backViewColor = [GZGColorClass subjectCountriespacilionJapanBackColor];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case HomeItem_Australia:{
            vc.countriesTitle = @"澳洲馆";
            vc.countriesIndex = CountriesEnterThe_Australia;
            vc.backViewColor = [GZGColorClass subjectCountriespacilionAustraliaBackColor];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case HomeItem_TheEuropean:{
            vc.countriesTitle = @"欧洲馆";
            vc.countriesIndex = CountriesEnterThe_TheEuropean;
            vc.backViewColor = [GZGColorClass subjectCountriespacilionTheEuropeanBackColor];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
    
}
- (void)gpGpobalSelectCellIndex:(NSInteger)index{
    if (index == 0) {
        NSLog(@"点了大图");
    }else if(index == 1){
        NSLog(@"点了小图1");
    }else{
        NSLog(@"点了小图2");
    }
}
- (void)maternalBtnIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个按钮",index);
    if(index == GZGGPMaternalInfantCellIndex_CCGDSP){
        NSLog(@"点击了查看更多商品");
    }
}
- (void)crossBorderIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个按钮",index);
}
#pragma mark 自己的方法
- (void)returnBtnDown{
    GZGSearchViewController *vc = [[GZGSearchViewController alloc] init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)limitedBtnDown:(UIButton *)btn{
    NSLog(@"tag = %ld",btn.tag);
    
    switch (btn.tag) {
        case 1:{
            GZGLog(@"限时特卖");
            GZGYLimitViewController * limit = [[GZGYLimitViewController alloc] init];
            limit.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:limit animated:YES];
            break;
        }
        case 2:{
            GZGLog(@"火力拼团");
            GZGYSpellgroupViewController * spellgroup = [[GZGYSpellgroupViewController alloc] init];
            spellgroup.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:spellgroup animated:YES];
            break;
        }
        case 4: {
            NSLog(@"母婴专场");
            GZGSpecialPerformanceViewController * specialPerformanceVC = [[GZGSpecialPerformanceViewController alloc] init];
            specialPerformanceVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:specialPerformanceVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark --- CollectionView点击事件
-(void)CollectionViewDelegeteClick:(NSArray *)sender
{
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    details.shopID = sender[0];
    details.shopName = sender[1];
    details.shopImg = sender[2];
    details.gDetails = GoodsDetailsLimited;
    details.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:details animated:YES];
}
#pragma mark --- 火力拼团进货事件
-(void)SpellBtn:(UIButton *)btn
{
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    details.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:details animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)nameArray
{
    if (_nameArray == nil) {
        _nameArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _nameArray;
}
-(NSMutableArray *)limitArray
{
    if (_limitArray == nil) {
        _limitArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _limitArray;
}
-(NSMutableArray *)ImgArray
{
    if (_ImgArray == nil) {
        _ImgArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _ImgArray;
}

@end
