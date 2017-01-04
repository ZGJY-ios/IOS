//
//  GZGYShopListViewController.m
//  ZGJY
//
//  Created by YYS on 2016/12/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYShopListViewController.h"
#import "GZGSearchListCell.h"
#import "GZGYListModel.h"
#import "GZGYDetailsViewController.h"
@interface GZGYShopListViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) NSArray<GZGYListModel *> *model;
@property (nonatomic, strong) NSMutableArray * shopIDArray;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UIView * NilView;
@end

@implementation GZGYShopListViewController
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
    self.view.backgroundColor = [UIColor whiteColor];
    self.titles.text = @"商品列表";
    [self TableViewInterface];
    [self NilviewInterface];
    // Do any additional setup after loading the view.
}
#pragma mark --- tableview
-(void)TableViewInterface
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [self ListData];
}
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
#pragma mark --- 数据
-(void)ListData
{
    NSDictionary * dict;
    if ([_stateString isEqualToString:@"分类"]) {
        dict = @{@"productCategoryId":_string};
    }else{
        dict = @{@"brandId":_string};
    }
    [[GZGYAPIHelper shareAPIHelper]shopListDict:dict ClassOrBrand:_stateString Finsh:^(NSArray *listArray) {
        if (listArray.count == 0) {
            self.NilView.hidden = NO;
        }else{
            self.NilView.hidden = YES;
        }
        for (int i = 0; i<listArray.count;i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            dic = listArray[i];
            [self.shopIDArray addObject:dic[@"id"]];
        }
        self.model = [GZGYListModel mj_objectArrayWithKeyValuesArray:listArray];
        [_tableView reloadData];
    }];
}
#pragma mark - 系统的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGSearchListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[GZGSearchListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.model[indexPath.row];
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
