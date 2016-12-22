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
#import "WXApi.h"
#import "Order.h"
#import "APAuthV2Info.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
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
            NSString *appID = @"2088221386225450";
            NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMGaJ2TfaC7USliarsRrNAafkxfsQiM1R+rYvxCjFPHDG+CZqibNh2+hSA5XsM1Mjce0o8TtK7K6Vjr0rb0xoUL/mB23Uq/XWyvF/A8EKzmi9zZ7eMJBeACb1ZtwmUAdf51goQEVJUfDuvx1uCfwZ0yeq3saImhXSh5o5NX1mKYfAgMBAAECgYBBzif9vYIoCLiMjWdCFD5G0g6pXwDL/txHEw0+lnAUDQF4wkJ3lfynEObxGRVbct3uN5RC52qnAXc16tzzJd9t0yHbSKWAVc+/s8WsjkEjEx5jSrOZXP9I7xFlarT0fZ0GFcXjFLEvFOFeZ6OZtycrjToDjSFL5xFRpjC7N4N+wQJBAOBiH8OSp23WtTbjJ2h8ntPtPYalfgUjBt2277PwmhxS8i4VMpMbNEid/hTvrAOcwo/43MpDUaPlb/nQgLXlmqcCQQDc4bQY+c3m345Iy5TdfWcjDZOJaLXRTylLFEa+Dnp9Fr6/fJTJnBNRvHetkuo35NkqQtA+cIWegmo4zxZ/qB/JAkEAii4DT6Y1s1+g0z9KGn98NBiKZivuEm3CobExpodJ8J1oBNcLASqkpP+e4/fA36ye6JiiJ3ETirIVpisvyFSwSwJBAIDyFkRaWLSGH7cpee9PjQ0umMmn4jSd5PpajO3Y3/L0e0ioPufvgGu//ZHL6YXVyF1egdlhsO+XLNGbO4QsrtkCQFpIBwfZW5HPVS5rQ+r9SzGVZJbh0/Kql4l+DPRJu1j4nOWHkqpE7wWq6G+M9f7CsdYJfT0n5qMBX6c1/v3Qb30=";
            
            /*
             *生成订单信息及签名
             */
            //将商品信息赋予AlixPayOrder的成员变量
            Order* order = [Order new];
            
            // NOTE: app_id设置
            order.app_id = appID;
            
            // NOTE: 支付接口名称
            order.method = @"alipay.trade.app.pay";
            
            // NOTE: 参数编码格式
            order.charset = @"utf-8";
            
            // NOTE: 当前时间点
            NSDateFormatter* formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            order.timestamp = [formatter stringFromDate:[NSDate date]];
            
            // NOTE: 支付版本
            order.version = @"1.0";
            
            // NOTE: sign_type设置
            order.sign_type = @"RSA";
            
            // NOTE: 商品数据
            order.biz_content = [BizContent new];
            order.biz_content.body = @"真他妈帅";
            order.biz_content.subject = @"1";
            order.biz_content.out_trade_no = @"123"; //订单ID（由商家自行制定）
            order.biz_content.timeout_express = @"30m"; //超时时间设置
            order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
            
            //将商品信息拼接成字符串
            NSString *orderInfo = [order orderInfoEncoded:NO];
            NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
            NSLog(@"orderSpec = %@",orderInfo);
            
            // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
            //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
            id<DataSigner> signer = CreateRSADataSigner(privateKey);
            NSString *signedString = [signer signString:orderInfo];
            
            // NOTE: 如果加签成功，则继续执行支付
            if (signedString != nil) {
                //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
                NSString *appScheme = @"alisdkdemo";
                
                // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
                NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                         orderInfoEncoded, signedString];
                
                // NOTE: 调用支付结果开始支付
                [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                    NSLog(@"reslut = %@",resultDic);
                    GZGLog(@"%@",resultDic[@"resultStatus"]);
                }];
            }
        }
            break;
        case 2: {
            GZGLog(@"微信支付");
            NSDictionary * dict = @{@"partnerid":@"1",
                                    @"prepayid":@"1",
                                    @"noncestr":@"1",
                                    @"package":@"1",
                                    @"sign":@"1"};
            // 创建微信支付对象
            PayReq * req = [[PayReq alloc] init];
            // 由用户微信号和AppID组成的位移标识，用于效验微信用户
            req.openID = @"";
            // 商家向财付通申请的商家id
            req.partnerId = [dict objectForKey:@"partnerid"];
            // 预支付订单
            req.prepayId =  [dict objectForKey:@"prepayid"];
            // 随机串，防重发
            req.nonceStr =  [dict objectForKey:@"noncestr"];
            // 时间戳，防重发
            req.timeStamp = 1111;
            // 商家根据财付通文档填写的数据和签名
            req.package =   [dict objectForKey:@"package"];
            // 商家根据微信开放平台文档对数据做的签名
            req.sign = [dict objectForKey:@"sign"];
            [WXApi sendReq:req];
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
