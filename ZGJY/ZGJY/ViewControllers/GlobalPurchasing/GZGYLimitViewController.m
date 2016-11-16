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
@interface GZGYLimitViewController ()<UITableViewDelegate,UITableViewDataSource,LimitDelegeteClickProtocol>
{
    UIImageView * imgView;
    UITableView *ytableView;
}
@end

@implementation GZGYLimitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"限时特卖";
    [self headerViewInterface];
//    [self LimitData];
    // Do any additional setup after loading the view.
}
#pragma mark --- 数据
//-(void)LimitData
//{
////    NSDictionary*dict = @{@"a":@"tag_recommend",@"action":@"sub",@"c":@"topic"};
//    [[GZGYAPIHelper shareAPIHelper]LimitedTimeSaleURL:@"http://192.168.0.110:8080/topic/Limitshop" Dict:nil Finsh:^{
//    }];
//}
#pragma mark --- headerView界面
-(void)headerViewInterface
{
    self.view.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:295])];
    imgView.image = [UIImage imageNamed:@"04-1APP 限时特卖banner750.psd"];
    ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize] , SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    ytableView.delegate = self;
    ytableView.dataSource = self;
    ytableView.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
    ytableView.tableHeaderView = imgView;
    [self.view addSubview:ytableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        return [GZGApplicationTool control_height:20];
    }
    return [GZGApplicationTool control_height:365];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return [GZGApplicationTool control_height:120];
    }
    return [GZGApplicationTool control_height:0];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIImageView * imggView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:120])];
        imggView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
        return imggView;
    }else{
        return nil;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    if (indexPath.row%2 == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        return cell;
    }else{
        GZGYLimitTableViewCell* cell = (GZGYLimitTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYLimitTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
