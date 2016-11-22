//
//  GZGYLimitViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLimitViewController.h"
#import "GZGYLimitView.h"
#import "GZGYLimitTableViewCell.h"
#import "GZGYLimitModel.h"
#import "GZGYDetailsViewController.h"
@interface GZGYLimitViewController ()<UITableViewDelegate,UITableViewDataSource,LimitDelegeteClickProtocol>
{
    UIImageView * imgView;
    UITableView * ytableView;
}
@property(nonatomic, strong)NSArray<GZGYLimitModel *> * model;
@property(nonatomic, strong)NSMutableArray * limitArray;
@property(nonatomic, strong)NSMutableArray * ImgArray;
@property(nonatomic, strong)NSMutableArray * nameArray;
@end

@implementation GZGYLimitViewController
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
-(NSMutableArray *)nameArray
{
    if (_nameArray == nil) {
        _nameArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _nameArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"限时特卖";
    [self tableViewInterface];
    [self LimitData];
    // Do any additional setup after loading the view.
}
#pragma mark --- 数据
-(void)LimitData
{
    NSDictionary * dict = @{@"tagIds":@"5"};
    [[GZGYAPIHelper shareAPIHelper]LimitedTimeSaleURL:@"http://192.168.0.110:8080/appTopic/Limitshop" Dict:dict Finsh:^(NSArray * dataArray){
        self.model = [GZGYLimitModel mj_objectArrayWithKeyValuesArray:dataArray];
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
        [ytableView reloadData];
    }];
}
#pragma mark --- tableView界面
-(void)tableViewInterface
{
    self.view.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:295])];
    imgView.image = [UIImage imageNamed:@"04-1APP 限时特卖banner750.psd"];
    ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize] , SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    ytableView.delegate = self;
    ytableView.dataSource = self;
    ytableView.tableHeaderView = imgView;
    [self.view addSubview:ytableView];
    __weak __typeof(self) weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    //    [tableview.header beginRefreshing];
    ytableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf LimitData];
        [ytableView.header performSelector:@selector(endRefreshing) withObject:nil afterDelay:1.0];
    }];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.model.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GZGApplicationTool control_height:365];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [GZGApplicationTool control_height:20];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        UIImageView * imggView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:20])];
    imggView.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        return imggView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    GZGYLimitTableViewCell* cell = (GZGYLimitTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[GZGYLimitTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击cell无高亮
    cell.model = self.model[indexPath.section];
//    if (_nameArray != nil) {
//        [self.ImgArray addObject:cell.imgView];
//    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    details.shopID = self.limitArray[indexPath.section];
    details.shopImg = self.ImgArray[indexPath.section];
    details.shopName = self.nameArray[indexPath.section];
    details.gDetails = GoodsDetailsLimited;
    GZGLog(@"%@",details.shopID);
    [self.navigationController pushViewController:details animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
