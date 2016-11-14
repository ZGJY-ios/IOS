//
//  GZGYCollectionViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYCollectionViewController.h"
#import "GZGYCollectionTableViewCell.h"
@interface GZGYCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GZGYCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles.text = @"我的收藏";
    UITableView * ytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    ytableView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    ytableView.delegate = self;
    ytableView.dataSource = self;
    [self.view addSubview:ytableView];
    UILabel * headlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:80])];
    headlabel.text = @"   全部收藏(2)";
    headlabel.backgroundColor = [UIColor whiteColor];
    ytableView.tableHeaderView = headlabel;
    // Do any additional setup after loading the view.
}
#pragma mark - UITableViewDataSource和UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [GZGApplicationTool control_height:1];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:215];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    GZGYCollectionTableViewCell* cell = (GZGYCollectionTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[GZGYCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
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
