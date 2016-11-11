//
//  GZGConfirmOrderViewController.m
//  ZGJY
//
//  Created by HX on 16/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGConfirmOrderViewController.h"
#import "GZGOrderPayViewController.h"
#import "GZGAddreddMangerCell.h"
#import "GZGConfirmOrderCell.h"

@interface GZGConfirmOrderViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZGConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"确认订单", nil);
    
    
    // UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:76];
    }
    return [GZGApplicationTool control_height:0.001];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [GZGApplicationTool control_height:30];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:76])];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:36])];
        label.text = NSLocalizedString(@"官方发货", nil);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:27]];
        [view addSubview:label];
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [GZGApplicationTool control_height:207];
    } else if (indexPath.section == 1) {
        return [GZGApplicationTool control_height:212];
    } else if (indexPath.section == 2 || indexPath.section == 3) {
        return [GZGApplicationTool control_height:108];
    }
    return [GZGApplicationTool control_height:423];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"addRessMangerStr";
        GZGAddreddMangerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGAddreddMangerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        CGSize nameSize = [GZGApplicationTool textSize:@"王小二" font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]] size:SCREENWIDTH];
        cell.cellUserName.frame = CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:30], nameSize.width, nameSize.height);
        
        
        cell.cellUserName.text = @"王小二";
        cell.cellCertifiCation.text = @"已认证";
        cell.cellTelNumber.text = @"13333333333";
        cell.cellAddress.text = @"北京市 朝阳区 惠中路 远大中心 B 1201室 北京市 朝阳区 惠中路 远大中心 B 1201室";
        cell.cellIDCar.text = @"321542525115152365";
        return cell;
    } else if (indexPath.section == 1) {
        static NSString * cellIdentifier = @"Cell";
        GZGDeliveryOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGDeliveryOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [cell setModel];
        return cell;
    } else if (indexPath.section == 2) {
        static NSString * cellIdentifier = @"Cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = NSLocalizedString(@"发票", nil);
        cell.detailTextLabel.text = NSLocalizedString(@"不需要发票", nil);
        return cell;
    } else if (indexPath.section == 3) {
        static NSString * cellIdentifier = @"Cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = NSLocalizedString(@"优惠券", nil);
        cell.detailTextLabel.text = NSLocalizedString(@"使用优惠券", nil);
        return cell;
    }
    static NSString * cellIdentifier = @"Cell";
    GZGCommodityTogetherCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GZGCommodityTogetherCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    [cell setModel];
    [cell setSubmitOrderBlock:^(NSString * amount) {
        GZGOrderPayViewController * orderPayVC = [[GZGOrderPayViewController alloc] init];
        orderPayVC.payTheAmountString = amount;
        [self.navigationController pushViewController:orderPayVC animated:YES];
    }];
    return cell;
}

@end
