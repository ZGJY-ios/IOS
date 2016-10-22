//
//  GZGCountriesPavilionViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesPavilionViewController.h"
#import "GZGCountriesReplenishCell.h"
#import "GZGCountriesHeadFaceCell.h"
@interface GZGCountriesPavilionViewController ()<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic, strong)UITableView *mainTableView;
@end

@implementation GZGCountriesPavilionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.titles.text = self.countriesTitle;
    [self.leftBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Search"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"QQG_TabBar_Message"] forState:UIControlStateNormal];
//    E0334B
    self.navBarView.backgroundColor = self.navColor;
    self.view.backgroundColor = self.backViewColor;;
    [self buildUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark 方法
- (void)buildUI{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT - [GZGApplicationTool tabBarSize]) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor = [UIColor clearColor];
    _mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_mainTableView];
}

#pragma mark 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       return [GZGApplicationTool control_height:611.0f];
    }else if (indexPath.section == 1){
       return [GZGApplicationTool control_height:1124.0f];
    }
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        return 0.00001f;
    }
    return [GZGApplicationTool control_height:20.0f];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *replenishCellStr = @"replenishCellStr";
        GZGCountriesReplenishCell *cell = [tableView dequeueReusableCellWithIdentifier:replenishCellStr];
        if (!cell) {
            cell = [[GZGCountriesReplenishCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:replenishCellStr];
        }
        cell.cellCountriesImage.image = [UIImage imageNamed:@"sy_hgban.jpg"];
        cell.replenishImage = [UIImage imageNamed:@"koho-1.jpg"];
        cell.backgroundColor = [UIColor  clearColor];
        
        return cell;
    }else if (indexPath.section == 1){
        static NSString *headFaceCellStr = @"headFaceCellStr";
        GZGCountriesHeadFaceCell *cell = [tableView dequeueReusableCellWithIdentifier:headFaceCellStr];
        if (!cell) {
            cell = [[GZGCountriesHeadFaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headFaceCellStr];
        }
        
        
        
        
        
        return cell;
    }
    
    
    static NSString *vvv = @"xxxxx";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vvv];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vvv];
    }
    return cell;
}
#pragma mark 自己的代理

#pragma mark 自己的方法

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
