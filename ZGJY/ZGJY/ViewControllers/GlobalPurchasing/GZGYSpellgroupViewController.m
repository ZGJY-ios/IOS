//
//  GZGYSpellgroupViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellgroupViewController.h"
#import "GZGYSpellSegView.h"
#import "GZGYSpellView.h"
#import "GZGYSpellgroupTableViewCell.h"
#import "GZGYSpellModel.h"
#import "GZGYDetailsViewController.h"
@interface GZGYSpellgroupViewController ()<UITableViewDelegate,UITableViewDataSource,SpellsegDelegeteClickProtocol>
@property(nonatomic, strong)UITableView * ytableView;
@property(nonatomic, strong)GZGYSpellView * spellView;
@property (nonatomic, strong) NSArray<GZGYSpellModel *> *model;
@property(nonatomic, strong)NSMutableArray * limitArray;
@property(nonatomic, strong)NSMutableArray * nameArray;
@property(nonatomic, strong)NSMutableArray * ImgArray;
@end
@implementation GZGYSpellgroupViewController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"火力拼团";
    self.navBarView.backgroundColor = [UIColor colorWithRed:148/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableViewInterface];
    [self SpellData];
    // Do any additional setup after loading the view.
}
#pragma mark --- 数据
-(void)SpellData
{
    NSDictionary * dic = @{@"tagIds":@"6"};
    [[GZGYAPIHelper shareAPIHelper]SpellGroupURL:@"http://192.168.0.110:8080/appTopic/SpellGroup" Dict:dic Finsh:^(NSArray * dataArray){
        self.model = [GZGYSpellModel mj_objectArrayWithKeyValuesArray:dataArray];
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
        [self.ytableView reloadData];
    }];
}
#pragma mark --- tableView
-(void)tableViewInterface
{
    self.ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize] , SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    self.ytableView.delegate = self;
    self.ytableView.dataSource = self;
    self.ytableView.backgroundColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    [self.view addSubview:self.ytableView];
    self.spellView = [[GZGYSpellView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:630])];
    self.spellView.backgroundColor = [UIColor colorWithDisplayP3Red:148/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    self.ytableView.tableHeaderView = self.spellView;
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
    UIView * colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:20])];
    colorView.backgroundColor = [UIColor colorWithDisplayP3Red:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    return colorView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    GZGYSpellgroupTableViewCell* cell = (GZGYSpellgroupTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[GZGYSpellgroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击cell无高亮
    cell.model = self.model[indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
    details.shopID = self.limitArray[indexPath.section];
    details.shopName = self.nameArray[indexPath.section];
    details.shopImg = self.ImgArray[indexPath.section];
    details.gDetails = GoodsDetailsFireAlsoGroup;
    [self.navigationController pushViewController:details animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
