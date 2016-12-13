//
//  GZGTempMaternalInfantController.m
//  ZGJY
//
//  Created by HX on 2016/12/13.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGTempMaternalInfantController.h"
#import "GZGSearchListCell.h"

@interface GZGTempMaternalInfantController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GZGTempMaternalInfantController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * image = [[UIImage imageNamed:@"return-arrow"] imageWithTintColor:[UIColor whiteColor]];
    [self.leftBtn setImage:image forState:UIControlStateNormal];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height)) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 系统的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGSearchListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[GZGSearchListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TempCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    [cell setModel];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:274];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
