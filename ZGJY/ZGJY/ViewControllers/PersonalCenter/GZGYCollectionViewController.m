//
//  GZGYCollectionViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYCollectionViewController.h"
#import "GZGYDetailsViewController.h"
#import "GZGYCollectionTableViewCell.h"
#import "GZGSpecialPerformanceModel.h"
@interface GZGYCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * collections;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZGYCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"我的收藏";
    UITableView * ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    ytableView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    ytableView.delegate = self;
    ytableView.dataSource = self;
    [self.view addSubview:ytableView];
    _tableView = ytableView;
    // Do any additional setup after loading the view.
    
    [self requestData];
}
#pragma mark - 我的方法
- (void)requestData {
    
    if (!_collections) {
        _collections = [NSMutableArray array];
    }
    if (_collections.count > 0) {
        [_collections removeAllObjects];
    }
    
    [[GZGYAPIHelper shareAPIHelper] collectionListDict:nil Finsh:^(id responseObject) {
        NSLog(@"responseObject = %@",responseObject);
        NSArray * array = responseObject[@"page"][@"list"];
        for (int i = 0; i < array.count; i++) {
            NSDictionary * dict = array[i];
            GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dict];
            [_collections addObject:model];
        }
        [_tableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"收藏列表获取失败:%@",error);
    }];
}
#pragma mark - UITableViewDataSource和UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [GZGApplicationTool control_height:80];
    }
    return [GZGApplicationTool control_height:1];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _collections.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:215];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel * headlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:80])];
        headlabel.text = [NSString stringWithFormat:@"    全部收藏(%ld)",_collections.count > 0 ? _collections.count : 0];
        headlabel.backgroundColor = [UIColor whiteColor];
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:79], SCREENWIDTH, 1)];
        view.backgroundColor = [UIColor lightGrayColor];
        [headlabel addSubview:view];
        return headlabel;
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    GZGYCollectionTableViewCell* cell = (GZGYCollectionTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[GZGYCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    GZGSpecialPerformanceModel * model = _collections[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    cell.nameLabel.text = model.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%.2f",model.price];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GZGSpecialPerformanceModel * model = _collections[indexPath.row];
    
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    details.shopID = model.ID;
    details.shopName = model.name;
    details.shopImg = model.image;
    details.gDetails = GoodsDetailsFireAlsoGroup;
    details.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:details animated:YES];
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
