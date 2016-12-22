//
//  GZGYOrderViewController.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYOrderViewController.h"
#import "GZGYOrders.h"
#import "GZGYOrderTableViewCell.h"
#import "GZGYPaymentTableViewCell.h"
#import "GZGYSingleTableViewCell.h"
#import "GZGYDeliveryTableViewCell.h"
#import "GZGYDorgoodsTableViewCell.h"
#import "Product.h"
#import "Order.h"
#import "APAuthV2Info.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
@interface GZGYOrderViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,OrdersDelegeteClickProtocol>
@property(nonatomic, strong)NSMutableArray * tableArray;
@property(nonatomic, strong)NSArray * nameArray;
@property(nonatomic, strong)GZGYOrders * ordersView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)UITableView * reloadTableView;
@end

@implementation GZGYOrderViewController
-(NSMutableArray*)TableArray
{
    if (_tableArray == nil) {
        _tableArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _tableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.titles.text = @"我的订单";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.nameArray = @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"];
    //scrollview
    [self ScrollInterface];
    //ordersView
    [self OrdersInterface];
    // Do any additional setup after loading the view.
}
#pragma mark --- ScrollInterface
-(void)ScrollInterface
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64+ [GZGApplicationTool control_height:105], SCREENWIDTH, SCREENHEIGHT-64-[GZGApplicationTool control_height:105])];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH * self.nameArray.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
}
#pragma mark --- 订单分类
-(void)OrdersInterface
{
    self.ordersView = [[GZGYOrders alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, [GZGApplicationTool control_height:105]) NameArray:self.nameArray];
    self.ordersView.delegate = self;
    [self.view addSubview:self.ordersView];
    [self addTableViewToScrollView:self.scrollView count:self.nameArray.count frame:CGRectZero];

}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH * i, 0 , SCREENWIDTH, SCREENHEIGHT - self.ordersView.frame.size.height - 64)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        [self.tableArray addObject:tableView];
        [self.scrollView addSubview:tableView];
    }
}
#pragma mark - UITableViewDataSource和UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [GZGApplicationTool control_height:20];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:410];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    if (tableView.tag == 0) {
        GZGYOrderTableViewCell* cell = (GZGYOrderTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else if (tableView.tag == 1){
        GZGYPaymentTableViewCell* cell = (GZGYPaymentTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYPaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.paymentBtn.tag = indexPath.section;
        [cell.paymentBtn addTarget:self action:@selector(Payment:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (tableView.tag == 2){
        GZGYDeliveryTableViewCell* cell = (GZGYDeliveryTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYDeliveryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else if (tableView.tag == 3){
        GZGYDorgoodsTableViewCell* cell = (GZGYDorgoodsTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYDorgoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else{
        GZGYSingleTableViewCell* cell = (GZGYSingleTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }
}
- (void)changeView:(float)x {
    float xx = x*(1.0f/5.0f);
    NSLog(@"~~~~~~~~%f",xx);
    CGRect frame = self.ordersView.LineView.frame;
    frame.origin.x = xx;
    [self.ordersView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        [self changeView:scrollView.contentOffset.x];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        float xx = scrollView.contentOffset.x * (0.2) - SCREENWIDTH/5;
        NSLog(@"%f",xx);
        [self.ordersView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.ordersView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / SCREENWIDTH);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    self.reloadTableView = _tableArray[index];
    NSLog(@"%@,%@",_tableArray,_tableArray[index]);
    CGRect frame = self.reloadTableView.frame;
    frame.origin.x = SCREENWIDTH * index;
    [self.reloadTableView setFrame:frame];
    [self.reloadTableView reloadData];
}
-(void)OrdersBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
    [self.scrollView setContentOffset:CGPointMake(SCREENWIDTH * sender, 0) animated:YES];
    float xx = SCREENWIDTH * (sender - 1) * (0.2) - SCREENWIDTH/5;
    [self.ordersView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.ordersView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- 去支付事件
-(void)Payment:(UIButton *)btn
{
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

@end
