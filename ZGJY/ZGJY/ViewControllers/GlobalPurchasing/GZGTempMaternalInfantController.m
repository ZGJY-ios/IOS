//
//  GZGTempMaternalInfantController.m
//  ZGJY
//
//  Created by HX on 2016/12/13.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGTempMaternalInfantController.h"
#import "GZGSearchListCell.h"
#import "GZGSpecialPerformanceModel.h"
@interface GZGTempMaternalInfantController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic , strong) NSMutableArray *dataArray;
@property(nonatomic, strong) UITableView *mainTableView;

@end

@implementation GZGTempMaternalInfantController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    
    // Do any additional setup after loading the view.
    
    
    self.titles.text = self.countriesTitle;
    
    
    UIImage * image = [[UIImage imageNamed:@"return-arrow"] imageWithTintColor:[UIColor whiteColor]];
    [self.leftBtn setImage:image forState:UIControlStateNormal];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - (self.navBarView.frame.origin.y + self.navBarView.frame.size.height)) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_mainTableView];
    
    
    [self loadData];
    
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
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGSearchListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[GZGSearchListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TempCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    
    GZGSpecialPerformanceModel * model = _dataArray[indexPath.row];
    
    
    [cell setModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:274];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)loadData{
    NSDictionary * dict;
    
    
    dict  = @{@"tagIds":self.taglids};
    

    
    
    [[GZGYAPIHelper shareAPIHelper] pavilionCountries:0 dict:dict finish:^(NSArray *goods) {
        
        
        
        NSLog(@"%@",goods);
        
        for (int i = 0; i < goods.count; i ++) {
            NSDictionary * dict1 = goods[i];
            GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dict1];
            [_dataArray addObject:model];
        }
        
        [_mainTableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"错误信息:%@",error);
    }];
}


@end
