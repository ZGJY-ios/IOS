//
//  GZGOrderPayViewController.m
//  ZGJY
//
//  Created by HX on 16/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGOrderPayViewController.h"
#import "GZGPayCOmpleteViewController.h"
#import "GZGOrderPayCell.h"

@interface GZGOrderPayViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * methodPays;
@property (nonatomic, assign) NSInteger payInteger;

@end

@implementation GZGOrderPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"订单支付", nil);
    [self.rightBtn setTitle:NSLocalizedString(@"保存", nil) forState:UIControlStateNormal];
    
    // UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"TheShoppingCartTreasurePay",@"img",@"支付宝支付",@"title", nil];
    NSDictionary * dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"TheShoppingCartWeChatPay",@"img",@"微信支付",@"title", nil];
    NSDictionary * dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"TheShoppingCartOnlinePay",@"img",@"网银支付",@"title", nil];
    _methodPays = @[dict1,dict2,dict3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 自己的方法

- (void)buttonClick:(UIButton *)btn {
    
    switch (self.payInteger) {
        case 1: {
            NSLog(@"支付宝支付");
            GZGPayCOmpleteViewController * payCompleteVC = [[GZGPayCOmpleteViewController alloc] init];
            [self.navigationController pushViewController:payCompleteVC animated:YES];
        }
            break;
        case 2: {
            NSLog(@"微信支付");
            GZGPayCOmpleteViewController * payCompleteVC = [[GZGPayCOmpleteViewController alloc] init];
            [self.navigationController pushViewController:payCompleteVC animated:YES];
        }
            break;
        case 3: {
            NSLog(@"网银支付");
            GZGPayCOmpleteViewController * payCompleteVC = [[GZGPayCOmpleteViewController alloc] init];
            [self.navigationController pushViewController:payCompleteVC animated:YES];
        }
            break;
        default: {
            NSLog(@"未选择支付方式");
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"请选择支付方式" message:@"未选择支付方式" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }
            break;
    }
}
#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return self.methodPays.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:90];
    }
    return [GZGApplicationTool control_height:0.001];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:300];
    }
    return [GZGApplicationTool control_height:20];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:36])];
        label.text = NSLocalizedString(@"选择支付方式：", nil);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        [view addSubview:label];
        return view;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:300])];
        view.backgroundColor = [UIColor clearColor];
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:113], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:0.5])];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [view addSubview:lineView];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:155], [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100]);
        [btn setTitle:NSLocalizedString(@"确认支付", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return [GZGApplicationTool control_height:113];
    }
    return [GZGApplicationTool control_height:242];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"OrderNumberCell";
        GZGOrderNumberCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGOrderNumberCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.orderNumberLabel.text = self.orderNumberString;
        NSString * orderTimeString = [self.orderNumberString substringWithRange:NSMakeRange(0, 8)];
        cell.orderTimeLabel.text = [NSString stringWithFormat:@"%@-%@-%@",[orderTimeString substringWithRange:NSMakeRange(0, 4)],[orderTimeString substringWithRange:NSMakeRange(4, 2)],[orderTimeString substringWithRange:NSMakeRange(6, 2)]];
        cell.payAmountLabel.attributedText =  [cell attributedStringWithStringColorWithString:[NSString stringWithFormat:@"支付金额：￥%@",self.payTheAmountString] textColor:[UIColor blackColor] numberColor:[GZGColorClass subjectShoppingCartPriceColor]];
        return cell;
    }
    static NSString * cellIdentifier = @"OrderPayCell";
    GZGOrderPayCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GZGOrderPayCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tag = indexPath.row;
    NSDictionary * dict = self.methodPays[indexPath.row];
    cell.payIconImageView.image = [UIImage imageNamed:dict[@"img"]];
    cell.payNameLabel.text = NSLocalizedString(dict[@"title"], nil);
    [cell setReturnPay:^(UIButton * btn) {
        for (NSInteger i = 0; i < self.methodPays.count; i++) {
            if (btn.tag == i) {
                btn.selected = YES;
                _payInteger = i + 1;
            } else {
                NSIndexPath * payIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
                GZGOrderPayCell * payCell = [_tableView cellForRowAtIndexPath:payIndexPath];
                payCell.selected = NO;
            }
        }
    }];
    return cell;
}

@end
