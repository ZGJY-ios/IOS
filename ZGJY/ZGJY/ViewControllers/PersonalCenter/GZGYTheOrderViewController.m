//
//  GZGYTheOrderViewController.m
//  ZGJY
//
//  Created by YYS on 2016/11/14.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYTheOrderViewController.h"
#import "GZGYPaymentTableViewCell.h"
#import "GZGYDorgoodsTableViewCell.h"
#import "GZGYSingleTableViewCell.h"
#import "GZGYOrderTableViewCell.h"
@interface GZGYTheOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView * ytableView;
@end

@implementation GZGYTheOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.tagString integerValue] == 0) {
        self.titles.text = @"待付款";
    }else if ([self.tagString integerValue] == 1){
        self.titles.text = @"待收货";
    }else if ([self.tagString integerValue] == 2){
        self.titles.text = @"待评价";
    }else{
        self.titles.text = @"已完成";
    }
    [self TableViewInterface];
    
    // Do any additional setup after loading the view.
}
#pragma mark --- tableview初始化
-(void)TableViewInterface
{
    self.ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    self.ytableView.delegate = self;
    self.ytableView.dataSource = self;
    [self.view addSubview:self.ytableView];
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
    if ([self.tagString integerValue] == 0) {
        GZGYPaymentTableViewCell* cell = (GZGYPaymentTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYPaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else if ([self.tagString integerValue] == 1){
        GZGYDorgoodsTableViewCell* cell = (GZGYDorgoodsTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYDorgoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else if ([self.tagString integerValue] == 2){
        GZGYSingleTableViewCell* cell = (GZGYSingleTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }else{
        GZGYOrderTableViewCell* cell = (GZGYOrderTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }
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
