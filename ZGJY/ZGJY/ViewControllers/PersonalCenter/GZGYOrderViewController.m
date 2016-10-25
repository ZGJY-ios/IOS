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
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64+ [GZGApplicationTool control_height:105], KScreenWigth, KScreenHeight-64-[GZGApplicationTool control_height:105])];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(KScreenWigth * self.nameArray.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
}
#pragma mark --- 订单分类
-(void)OrdersInterface
{
    self.ordersView = [[GZGYOrders alloc]initWithFrame:CGRectMake(0, 64, KScreenWigth, [GZGApplicationTool control_height:105]) NameArray:self.nameArray];
    self.ordersView.delegate = self;
    [self.view addSubview:self.ordersView];
    [self addTableViewToScrollView:self.scrollView count:self.nameArray.count frame:CGRectZero];

}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(KScreenWigth * i, 0 , KScreenWigth, KScreenHeight - self.ordersView.frame.size.height - 64)];
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
        float xx = scrollView.contentOffset.x * (0.2) - KScreenWigth/5;
        NSLog(@"%f",xx);
        [self.ordersView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth, self.ordersView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / KScreenWigth);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    self.reloadTableView = _tableArray[index];
    NSLog(@"%@,%@",_tableArray,_tableArray[index]);
    CGRect frame = self.reloadTableView.frame;
    frame.origin.x = KScreenWigth * index;
    [self.reloadTableView setFrame:frame];
    [self.reloadTableView reloadData];
}
-(void)OrdersBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
    [self.scrollView setContentOffset:CGPointMake(KScreenWigth * sender, 0) animated:YES];
    float xx = KScreenWigth * (sender - 1) * (0.2) - KScreenWigth/5;
    [self.ordersView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth, self.ordersView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
