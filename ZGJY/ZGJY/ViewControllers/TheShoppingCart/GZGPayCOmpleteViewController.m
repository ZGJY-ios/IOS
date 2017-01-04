//
//  GZGPayCOmpleteViewController.m
//  ZGJY
//
//  Created by HX on 16/11/1.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGPayCOmpleteViewController.h"
#import "GZGLogisticsViewController.h"

@interface GZGPayCOmpleteViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZGPayCOmpleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"支付完成", nil);
    
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
#pragma mark - 自己的方法
- (void)buttonClick:(UIButton *)btn {
    switch (btn.tag) {
        case 1000: {
            NSLog(@"支付完成");
        }
            break;
        case 1001: {
            NSLog(@"继续购物");
        }
            break;
        default:
            break;
    }
}
#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [GZGApplicationTool control_height:186];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [GZGApplicationTool control_height:186];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:186])];
        view.backgroundColor = [UIColor whiteColor];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100]);
        [btn setImage:[UIImage imageNamed:@"TheShoppingCartCheck"] forState:UIControlStateNormal];
        [btn setTitle:NSLocalizedString(@"恭喜你，支付成功！", nil) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:33]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); // 文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0); // 图片距离右边框的距离减少图片的宽度，其他不变
        btn.tag = 1000;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:186])];
        view.backgroundColor = [UIColor clearColor];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100]);
        [btn setTitle:NSLocalizedString(@"继续购物", nil) forState:UIControlStateNormal];
        btn.tag = 1001;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:87];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSLocalizedString(@"请注意查看物流消息，及时收货！", nil);
    cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"请注意查看物流消息，及时收货");
    GZGLogisticsViewController * logisticsVC = [[GZGLogisticsViewController alloc] init];
    [self.navigationController pushViewController:logisticsVC animated:YES];
}

@end
