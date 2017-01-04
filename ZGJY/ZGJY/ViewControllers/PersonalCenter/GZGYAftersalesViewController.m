//
//  GZGYAftersalesViewController.m
//  ZGJY
//
//  Created by YYS on 16/10/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAftersalesViewController.h"
#import "GZGYSegView.h"
#import "GZGYAftersalesTableViewCell.h"
#import "GZGYProgressTableViewCell.h"
#import "GZGYNopromptTableViewCell.h"
@interface GZGYAftersalesViewController ()<SegDelegeteClickProtocol,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)GZGYSegView * segView;
@property(nonatomic, strong)NSArray * nameArray;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSMutableArray * tableArray;
@property(nonatomic, strong)UITableView * reloadTableView;
@end

@implementation GZGYAftersalesViewController
-(NSMutableArray*)TableArray
{
    if (_tableArray == nil) {
        _tableArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _tableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"我的售后";
    self.nameArray = @[@"售后申请",@"进度查询"];
    [self ScrollInterface];
    [self SegViewInterface];
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
#pragma mark --- Seg
-(void)SegViewInterface
{
    self.segView = [[GZGYSegView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:95]) NameArray:_nameArray];
    self.segView.delegate = self;
    self.segView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segView];
    [self addTableViewToScrollView:self.scrollView count:self.nameArray.count frame:CGRectZero];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH * i, 0 , SCREENWIDTH, SCREENHEIGHT - self.segView.frame.size.height - 64)];
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
    if (tableView.tag == 0) {
        return [GZGApplicationTool control_height:300];
    }else{
        if (indexPath.section == 0) {
            return [GZGApplicationTool control_height:435];
        }
        return [GZGApplicationTool control_height:300];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    if (tableView.tag == 0) {
        GZGYAftersalesTableViewCell* cell = (GZGYAftersalesTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYAftersalesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else{
        if (indexPath.section == 0) {
            GZGYProgressTableViewCell* cell = (GZGYProgressTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYProgressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            return cell;
        }else{
            GZGYNopromptTableViewCell* cell = (GZGYNopromptTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYNopromptTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            return cell;
        }
    }
}
- (void)changeView:(float)x {
    float xx = x*(1.0f/2.0f);
    NSLog(@"~~~~~~~~%f",xx);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
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
        float xx = scrollView.contentOffset.x * (0.5) - SCREENWIDTH/2;
        NSLog(@"%f",xx);
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.HeaderScroller.frame.size.height) animated:YES];
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
-(void)SegBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
    [self.scrollView setContentOffset:CGPointMake(SCREENWIDTH * sender, 0) animated:YES];
    float xx = SCREENWIDTH * (sender - 1) * (0.5) - SCREENWIDTH/2;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.frame.size.height) animated:YES];
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
