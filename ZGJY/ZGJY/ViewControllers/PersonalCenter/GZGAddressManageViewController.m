//
//  GZGAddressManageViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAddressManageViewController.h"
#import "GZGAddreddMangerCell.h"
@interface GZGAddressManageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *mainTableView;
@end

@implementation GZGAddressManageViewController

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
                                                                   SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:106]) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [self.view addSubview:_mainTableView];
    
}

#pragma mark 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GZGApplicationTool control_height:207];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *addRessMangerStr = @"addRessMangerStr";
    GZGAddreddMangerCell *cell = [tableView dequeueReusableCellWithIdentifier:addRessMangerStr];
    if (!cell) {
        cell = [[GZGAddreddMangerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addRessMangerStr];
    }
    CGSize nameSize = [GZGApplicationTool textSize:@"王小二" font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]] size:SCREENWIDTH];
    cell.cellUserName.frame = CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:30], nameSize.width, nameSize.height);
    
    
    cell.cellUserName.text = @"王小二";
    cell.cellCertifiCation.text = @"已认证";
    cell.cellTelNumber.text = @"13333333333";
    cell.cellAddress.text = @"北京市 朝阳区 惠中路 远大中心 B 1201室 北京市 朝阳区 惠中路 远大中心 B 1201室";
    cell.cellIDCar.text = @"321542525115152365";
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        
//        [self.dataSourceremoveObjectAtIndex:indexPath.row];
//        [self.tableViewdeleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置删除按钮
    UITableViewRowAction *deleteRow = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
//        [_mainTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }];
    
    UITableViewRowAction *add = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"设为默认" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
        
        
        NSLog(@"设为默认");
    }];
    
    
    
    add.backgroundColor = [UIColor  lightGrayColor];
    
     return  @[deleteRow,add];
 
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
