//
//  GZGLogisticsViewController.m
//  ZGJY
//
//  Created by HX on 16/11/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGLogisticsViewController.h"
#import "GZGLogisticsCell.h"

@interface GZGLogisticsViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * logisticsDetails;
@end

@implementation GZGLogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"查看物流", nil);
    
    // UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"【北京市朝阳区XX公司】的派件员【XXC区123556588】正在派送",@"detail",@"2015-06-08 13:53:12",@"time", nil];
    NSDictionary * dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"【北京市朝阳区XX公司】的派件员【XXC区123556588】正在派送",@"detail",@"2015-06-08 13:53:12",@"time", nil];
    NSDictionary * dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"【北京市朝阳区XX公司】的派件员【XXC区123556588】正在派送",@"detail",@"2015-06-08 13:53:12",@"time", nil];
    _logisticsDetails = [NSMutableArray arrayWithArray:@[dict1,dict2,dict3]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return self.logisticsDetails.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:86];
    }
    return [GZGApplicationTool control_height:0.01];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [GZGApplicationTool control_height:27];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:36])];
        label.text = NSLocalizedString(@"物流详情", nil);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        [view addSubview:label];
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSDictionary * dict = self.logisticsDetails[indexPath.row];
    return [GZGLogisticsCell cellHeightWithString:dict[@"detail"] isContentHeight:NO];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"Cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"shentong-logo"];
        cell.textLabel.text = NSLocalizedString(@"申通快递", nil);
        cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        cell.detailTextLabel.text = NSLocalizedString(@"运单编号：2202244552100", nil);
        return cell;
    }
    static NSString * cellIdentifier = @"Cell";
    GZGLogisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GZGLogisticsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary * dict = self.logisticsDetails[indexPath.row];
    [cell setTitle:dict[@"detail"]];
    cell.timeLabel.text = dict[@"time"];
    if (indexPath.row == 0) {
        cell.verticalLineTopView.hidden = YES;
    } else if (indexPath.row == self.logisticsDetails.count - 1) {
        cell.verticalLineBottomView.hidden = YES;
    }
    return cell;
}

@end
