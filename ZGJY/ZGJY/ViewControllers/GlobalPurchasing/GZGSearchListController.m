//
//  GZGSearchListController.m
//  ZGJY
//
//  Created by HX on 16/10/18.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSearchListController.h"
#import "GZGSearchListCell.h"
#import "GZGSegmentControl.h"
#import "GZGDropDownMenu.h"
#import "GZGSpecialPerformanceModel.h"
#import "GZGYListModel.h"
#import "GZGYDetailsViewController.h"

@interface GZGSearchListController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,GZGDropDownMenuDelegate,GZGDropDownMenuDataSource,GZGSegmentControlDelegate,GZGSegmentControlDataSource>
@property (nonatomic, strong) NSArray<GZGYListModel *> *model;
@property (nonatomic, strong) NSMutableArray * shopIDArray;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) GZGSegmentControl * segmentControl;
@property (nonatomic, strong) NSMutableArray * segmentData1;
@property (nonatomic, strong) NSMutableArray * segmentData2;
@property (nonatomic, strong) NSMutableArray * segmentData3;
@property (nonatomic, strong) NSMutableArray * segmentData4;
@property (nonatomic, assign) NSInteger currentSegmentData1Index;
@property (nonatomic, strong) GZGDropDownMenu * downMenu;
@property (nonatomic, strong) NSMutableArray * data1;
@property (nonatomic, strong) NSMutableArray * data2;
@property (nonatomic, strong) NSMutableArray * data3;
@property (nonatomic, strong) NSMutableArray * data4;
@property (nonatomic, assign) NSInteger currentData1Index;
@property (nonatomic, assign) NSInteger currentData2Index;
@property (nonatomic, assign) NSInteger currentData3Index;
@property (nonatomic, assign) NSInteger currentData4Index;
@property (nonatomic, assign) NSInteger currentData1SelectedIndex;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) NSMutableArray * commonditys;
//@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIView * NilView;
@end

@implementation GZGSearchListController
-(NSMutableArray *)shopIDArray
{
    if (_shopIDArray == nil) {
        _shopIDArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _shopIDArray;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navBarView.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
//    UIImage * image = [[UIImage imageNamed:@"return-arrow"] imageWithTintColor:[UIColor whiteColor]];
//    [self.leftBtn setImage:image forState:UIControlStateNormal];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.leftBtn.frame.origin.x + self.leftBtn.frame.size.width + [GZGApplicationTool control_wide:30],
                                                               [GZGApplicationTool control_height:8] + [UIApplication sharedApplication].statusBarFrame.size.height,
                                                               [GZGApplicationTool screenWide] - (self.leftBtn.frame.origin.x + self.leftBtn.frame.size.width + [GZGApplicationTool control_wide:50]) ,
                                                               self.navBarView.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - [GZGApplicationTool control_height:16])];
    _textField.delegate = self;
    _textField.placeholder = @"中港会员日，特惠来袭！";
    _textField.borderStyle=UITextBorderStyleRoundedRect;
    _textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    UIImageView *imageTextFiled = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:29])];
    imageTextFiled.image = [UIImage imageNamed:@"QQG_Search_FDJ"];
    _textField.leftView = imageTextFiled;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField.backgroundColor = [GZGColorClass gzgBackClolor];
    NSLog(@"%@",_string);
    _textField.text = _string;
    [self.view addSubview:_textField];
    
    
    _segmentData1 = [NSMutableArray arrayWithObjects:@"综合排序",@"新品优先", nil];
    NSArray * segmentTitles = @[@"综合",@"销量",@"价格",@"评价"];
    _segmentControl = [[GZGSegmentControl alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [UIScreen mainScreen].bounds.size.width, [GZGApplicationTool control_height:98])];
    _segmentControl.titles = segmentTitles;
    _segmentControl.delegate = self;
    _segmentControl.dataSource = self;
    _segmentControl.selectedIndex = 0;
    _segmentControl.layer.borderColor = [UIColor clearColor].CGColor;
    _segmentControl.layer.borderWidth = 1.0f;
//    [self.view addSubview:_segmentControl];
    
    //  指定默认选中
    _currentData1Index = 0;
    _currentData1SelectedIndex = 0;

    _data1 = [NSMutableArray arrayWithObjects:@"免费配送", nil];
    _data2 = [NSMutableArray arrayWithObjects:@"品牌", @"爱他美（Aptamil）", @"雅培（Abbott）", @"诺优能（Nutrilon）", @"雀巢（Nestle）", @"贝因美（Beingmate）", @"合生元（BIOSTIME）",@"完达山（wondersun）",@"牛栏（Cow&Gate）",@"a2",@"圣元（Synutra）",@"佳贝艾特（Kabrita）",@"惠氏（Wyeth）",@"美赞臣（MeadJohnson Nutrition）",@"美素佳儿（Friso）",@"伊利",@"飞鹤（FIRMUS）",@"喜宝（Hipp）",@"君乐宝（JUNLEBAO）",@"A2.",@"多美滋（Dumex）",@"可瑞康（karicare）",@"贝拉米（Bellamy's）",@"荷兰美素（Herobaby）", nil];
    _data3 = [NSMutableArray arrayWithObjects:@"段位", @"1段", @"2段", @"3段",@"4段", nil];
    _data4 = [NSMutableArray arrayWithObjects:@"适用年龄",@"0~6个月",@"6~12个月",@"12~36个月",@"3~6岁",@"6岁以上",@"其它", nil];
    
    _downMenu = [[GZGDropDownMenu alloc] initWithOrigin:CGPointMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height + [GZGApplicationTool control_height:98]) andHeight:[GZGApplicationTool control_height:96]];
    _downMenu.separatorColor = [UIColor clearColor];
    _downMenu.textNormalColor = [GZGColorClass subjectSearchListNormalTextColor];
    _downMenu.textSelectedColor = [GZGColorClass subjectSearchListSelectedTextColor];
    _downMenu.dataSource = self;
    _downMenu.delegate = self;
//    [self.view addSubview:self.downMenu];
    
//    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height + [GZGApplicationTool control_height:194], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height + [GZGApplicationTool control_height:194])) style:UITableViewStylePlain];
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height)) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [self NilviewInterface];
    [self requestDataWithKeyword:self.string];
}
#pragma mark - 自己的方法
#pragma mark --- 分类为空界面
-(void)NilviewInterface
{
    self.NilView = [[UIView alloc]initWithFrame:self.tableView.frame];
    self.NilView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    UIImageView * nilImage = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:250], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:250])];
    nilImage.image = [UIImage imageNamed:@"图层-0"];
    [self.NilView addSubview:nilImage];
    UILabel * nilLbael = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:550], SCREENWIDTH, [GZGApplicationTool control_height:50])];
    nilLbael.text = @"此分类暂无商品";
    nilLbael.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_height:50]];
    nilLbael.textAlignment = NSTextAlignmentCenter;
    [self.NilView addSubview:nilLbael];
    [self.view addSubview:self.NilView];
    self.NilView.hidden = YES;
}
- (void)requestDataWithKeyword:(NSString *)keyword {
    
    if (!_commonditys) {
        _commonditys = [NSMutableArray array];
    }
    if (_commonditys.count > 0) {
        [_commonditys removeAllObjects];
    }
    NSDictionary * dict = @{@"keyword":keyword};
    [[GZGYAPIHelper shareAPIHelper] searchDict:dict Finsh:^(NSArray *dataArray) {
        if (dataArray.count == 0) {
            self.NilView.hidden = NO;
        }else{
            self.NilView.hidden = YES;
        }
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary * dic = dataArray[i];
            GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dic];
            [_commonditys addObject:model];
        }
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        GZGLog(@"搜索失败：%@",error);
        [SVProgressHUD showErrorWithStatus:@"搜索失败，请稍后重试！"];
    }];
}
#pragma mark - 系统的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commonditys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGSearchListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[GZGSearchListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    GZGSpecialPerformanceModel * model = _commonditys[indexPath.row];
    [cell setSModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:274];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    GZGYListModel * listModel = [[GZGYListModel alloc]init];
    listModel = self.model[indexPath.row];
    details.shopID = self.shopIDArray[indexPath.row];
    details.shopName = listModel.name;
    NSString * urlString;
    if (listModel.image.length == 0&&listModel.logo.length!=0) {
        urlString = listModel.logo;
    }else if (listModel.logo.length == 0&&listModel.image.length!=0){
        urlString = listModel.image;
    }
    details.shopImg = urlString;
    [self.navigationController pushViewController:details animated:YES];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}
#pragma mark - 自己的代理
#pragma mark - GZGSegmentControlDelegate
- (void)segmentItemSelected:(SegmentType)type {
    
    [self reloadDataWithQuery:[NSString stringWithFormat:@"%ld", (long)type]];
}
- (void)control:(GZGSegmentControl *)segmentControl didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _currentSegmentData1Index = indexPath.row;
    }
}
- (NSInteger)control:(GZGSegmentControl *)segmentControl numberOfRowsInColum:(NSInteger)column {
    if (column == 0) {
        return _segmentData1.count;
    }
    return 1;
}
- (NSString *)control:(GZGSegmentControl *)segmentControl titleForColumn:(NSInteger)column {
    if (column == 0) {
        return _segmentData1[_currentSegmentData1Index];
    }
    return nil;
}
- (NSString *)control:(GZGSegmentControl *)segmentControl titleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return _segmentData1[indexPath.row];
    }
    return nil;
}
#pragma mark - GZGDropDownMenuDataSource
- (NSInteger)numberOfColumnsInMenu:(GZGDropDownMenu *)menu {
    
    return 4;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    if (column == 0) {
        return _data1.count > 1 ? YES : NO;
    } else if (column == 1) {
        return _data2.count > 1 ? YES : NO;
    } else if (column == 2) {
        return _data3.count > 1 ? YES : NO;
    } else if (column == 3) {
        return _data4.count > 1 ? YES : NO;
    }
    return YES;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
        
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    
    return 0;
}

- (NSInteger)menu:(GZGDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        
        return _data1.count;
    } else if (column==1){
        
        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    } else if (column==3) {
        
        return _data4.count;
    }
    
    return 0;
}

- (NSString *)menu:(GZGDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return _data1[_currentData1Index];
            break;
        case 1: return _data2[_currentData2Index];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        case 3: return _data4[_currentData4Index];
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(GZGDropDownMenu *)menu titleForRowAtIndexPath:(GZGIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        
        return _data1[indexPath.row];
    } else if (indexPath.column==1) {
        
        return _data2[indexPath.row];
        
    } else if (indexPath.column == 2){
        
        return _data3[indexPath.row];
    } else {
        
        return _data4[indexPath.row];
    }
}
#pragma mark - GZGDropDownMenuDelegate
- (void)menu:(GZGDropDownMenu *)menu didSelectRowAtIndexPath:(GZGIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
        _currentData1Index = indexPath.row;
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else if (indexPath.column == 2){
        
        _currentData3Index = indexPath.row;
    } else {
        
        _currentData4Index = indexPath.row;
    }
}
#pragma mark - 自己的方法
- (void)reloadDataWithQuery:(NSString *)query {
    NSLog(@"query = %@",query);
//    __weak typeof(self) weakSelf = self;
//    [self.commodityListModel loadCommodityListWithQueryFormat:query Success:^{
//        [weakSelf.tableView reloadData];
//    } Failure:nil];
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
