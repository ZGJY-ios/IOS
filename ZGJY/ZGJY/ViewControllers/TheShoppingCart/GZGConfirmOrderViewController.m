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
#import "GZGShoppingCartModel.h"
#import "GZGAddressModel.h"
#import "GZGAddressManageViewController.h"

@interface GZGConfirmOrderViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * addressArrays;    // 地址
@property (nonatomic, strong) NSMutableArray * commmodityArrays; // 商品
@property (nonatomic, strong) NSMutableArray * orderArrays;          // 订单
@property (nonatomic, strong) NSMutableArray * courierArrays;    // 配送方式
@property (nonatomic, strong) NSMutableArray * paymentArrays;    // 支付方式
@end

@implementation GZGConfirmOrderViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self requestData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"确认订单", nil);
    
    [self buildUI];
    [self requestData];
}
#pragma mark - 自己的方法
- (void)buildUI {
    // UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
- (void)requestData {
    
    if (!_addressArrays) {
        _addressArrays = [NSMutableArray array];
    }
    if (!_commmodityArrays) {
        _commmodityArrays = [NSMutableArray array];
    }
    if (!_orderArrays) {
        _orderArrays = [NSMutableArray array];
    }
    if (!_courierArrays) {
        _courierArrays = [NSMutableArray array];
    }
    if (!_paymentArrays) {
        _paymentArrays = [NSMutableArray array];
    }
    
    NSString * memberID = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
    NSDictionary * dict = @{@"memberId":memberID};
    [[GZGYAPIHelper shareAPIHelper] makeSureOrderDict:dict Finsh:^(id responseObject) {
        
        NSDictionary * order = responseObject[@"order"];
        GZGOrderModel * orderModel = [GZGOrderModel orderWithDict:order];
        [_orderArrays addObject:orderModel];
        NSArray * address = responseObject[@"address"];
        NSArray * couriers = responseObject[@"shippingMethods"];
        NSArray * payments = responseObject[@"paymentMethods"];
        NSArray * carts = responseObject[@"cart"];
        for (int i = 0; i < address.count; i++) {
            NSDictionary * dict = address[i];
            GZGAddressModel * model = [GZGAddressModel specialPerformanceWithDict:dict];
            if (model.is_default.intValue == 0) {
                [_addressArrays addObject:model];
            }
        }
        for (int i = 0; i < couriers.count; i++) {
            NSDictionary * dict = couriers[i];
            GZGCourierModel * model = [GZGCourierModel courierWithDict:dict];
            [_courierArrays addObject:model];
        }
        for (int i = 0; i < payments.count; i++) {
            NSDictionary * dict = payments[i];
            GZGPayModel * model = [GZGPayModel payWithDict:dict];
            [_paymentArrays addObject:model];
        }
        for (int i = 0; i < carts.count; i++) {
            NSDictionary * dict = carts[i];
            GZGCartModel * model = [GZGCartModel cartWithDict:dict];
            [_commmodityArrays addObject:model];
        }
        if (_tableView) {
            [_tableView reloadData];
        }
    } failed:^(NSError *error) {
        NSLog(@"订单信息错误:%@",error);
        [SVProgressHUD showErrorWithStatus:@"获取订单失败！"];
    }];
}
- (void)requestDataWithSubmitOrder:(NSString *)amount {
    GZGAddressModel * addressModel = _addressArrays.firstObject;
    GZGPayModel * payModel = _paymentArrays.firstObject;
    GZGCourierModel * couriersModel = _courierArrays.firstObject;
    NSDictionary * dict = @{@"receiverId":addressModel.ids,@"paymentMethodId":payModel.ids,@"shippingMethodId":couriersModel.ids};
    [[GZGYAPIHelper shareAPIHelper] submitOrderDict:dict Finsh:^(id responseObject) {
        if ([responseObject[@"type"] isEqualToString:@"success"]) {
            
            GZGOrderPayViewController * orderPayVC = [[GZGOrderPayViewController alloc] init];
            orderPayVC.payTheAmountString = amount;
            orderPayVC.orderNumberString = responseObject[@"content"];
            [self.navigationController pushViewController:orderPayVC animated:YES];
        }else {
            NSLog(@"%@",responseObject);
        }
    } failed:^(NSError *error) {
        NSLog(@"提交订单失败:%@",error);
        [SVProgressHUD showErrorWithStatus:@"订单提交失败"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _addressArrays.count;
    } else if (section == 1) {
        return _commmodityArrays.count;
    }
    return _orderArrays.count;
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
    }
//    else if (indexPath.section == 2 || indexPath.section == 3) {
//        return [GZGApplicationTool control_height:100];
//    }
    return [GZGApplicationTool control_height:423];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"addRessMangerStr";
        GZGAddreddMangerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGAddreddMangerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        GZGAddressModel * model = _addressArrays[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        CGSize nameSize = [GZGApplicationTool textSize:model.consignee font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]] size:SCREENWIDTH];
        cell.cellUserName.frame = CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:30], nameSize.width, nameSize.height);
        
        
        cell.cellUserName.text = model.consignee;
//        cell.cellCertifiCation.text = @"已认证";
        cell.cellTelNumber.text = model.phone;
        cell.cellAddress.text = model.address;
//        cell.cellIDCar.text = @"321542525115152365";
        return cell;
    } else if (indexPath.section == 1) {
        static NSString * cellIdentifier = @"DeliveryOrderCell";
        GZGDeliveryOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGDeliveryOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        GZGCartModel * model = _commmodityArrays[indexPath.row];
        [cell.commodityImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
        cell.commodityNameLabel.text = model.name;
        cell.commodityPriceLabel.text = [NSString stringWithFormat:@"￥%.2f",model.price];
        CGSize size = [cell.commodityPriceLabel sizeThatFits:CGSizeMake(MAXFLOAT, [GZGApplicationTool control_height:30])];
        cell.commodityPriceLabel.frame = CGRectMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:30] - size.width, [GZGApplicationTool control_height:45], size.width, size.height);
        cell.commodityNumberLabel.text = [NSString stringWithFormat:@"%ld",model.quantity];
        [cell setModel];
        return cell;
    }
//    else if (indexPath.section == 2) {
//        static NSString * cellIdentifier = @"Cell";
//        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//        }
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.text = NSLocalizedString(@"发票", nil);
//        cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        cell.detailTextLabel.text = NSLocalizedString(@"不需要发票", nil);
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        return cell;
//    } else if (indexPath.section == 3) {
//        static NSString * cellIdentifier = @"Cell";
//        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//        }
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.text = NSLocalizedString(@"优惠券", nil);
//        cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        cell.detailTextLabel.text = NSLocalizedString(@"使用优惠券", nil);
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        return cell;
//    }
//    else if (indexPath.section == 4) {
//        static NSString * cellIdentifier = @"Cell";
//        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//        }
//        GZGCourierModel * model = _courierArrays[0];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.text = NSLocalizedString(@"配送方式", nil);
//        cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        cell.detailTextLabel.text = model.name;
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
//        return cell;
//    }
    static NSString * cellIdentifier = @"CommodityCell";
    GZGCommodityTogetherCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GZGCommodityTogetherCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    [cell setModel];
    GZGOrderModel * model = _orderArrays[indexPath.row];
    cell.commodityTotalPriceNumber.text = [NSString stringWithFormat:@"￥%.2f",self.totalPrice];
    cell.freightNumber.text = [NSString stringWithFormat:@"%.2f",model.freight];
    cell.totalPriceNumber.text = [NSString stringWithFormat:@"￥%.2f",self.totalPrice + model.freight];
    
    [cell setSubmitOrderBlock:^(NSString * amount) {
        [self requestDataWithSubmitOrder:[NSString stringWithFormat:@"%.2f",self.totalPrice + model.freight]];
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        __weak GZGConfirmOrderViewController * weakSelf = self;
        
        GZGAddressManageViewController * vc = [[GZGAddressManageViewController alloc] init];
        vc.isBack = YES;
        [vc setReturnAddress:^(id address) {
            [weakSelf.addressArrays removeAllObjects];
            [weakSelf.addressArrays addObject:address];
            [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 4) {
        
    }
}

@end
