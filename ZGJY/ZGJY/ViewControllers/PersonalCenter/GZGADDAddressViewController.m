//
//  GZGADDAddressViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressViewController.h"
#import "GZGADDAddressCell.h"
@interface GZGADDAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *mainTableView;
@end

@implementation GZGADDAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   [GZGApplicationTool navBarAndStatusBarSize],
                                                                   SCREENWIDTH,
                                                                   SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:100]) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_mainTableView];
}

#pragma mark 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GZGApplicationTool control_height:128];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *addAddressStr = @"addAddressStr";
    GZGADDAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:addAddressStr];
    if (!cell) {
        cell = [[GZGADDAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addAddressStr];
    }
    
    NSArray *arrTextFilePle = @[NSLocalizedString(@"GZGADDress_TextFile_UserName", nil),
                                NSLocalizedString(@"GZGADDress_TextFile_PhoneNumber", nil),
                                NSLocalizedString(@"GZGADDress_TextFile_IDCar", nil),
                                NSLocalizedString(@"GZGADDress_TextFile_Provincee", nil),
                                NSLocalizedString(@"GZGADDress_TextFile_DetailedAddress", nil),
                                NSLocalizedString(@"GZGADDress_TextFile_Default", nil)];
    
    cell.cellText.text = arrTextFilePle[indexPath.row];
    if (indexPath.row==0) {
        cell.cellTextFiled.placeholder = NSLocalizedString(@"GZGADDress_TextFilePre_RealUserName", nil);
    }
    if (indexPath.row==2) {
        cell.cellTextFiled.placeholder = NSLocalizedString(@"GZGADDress_TextFilePre_ExplanaIDCar", nil);
    }
    
    
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
