//
//  GZGAddressManageViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/25.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAddressManageViewController.h"
#import "GZGAddreddMangerCell.h"
#import "GZGADDAddressViewController.h"
#import "GZGAddressModel.h"
@interface GZGAddressManageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray * addressArrays;
@end

@implementation GZGAddressManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"GZGADDress_ADDressMager", nil);

    [self buildUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self requestData];
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
    
    
    
    UIButton *addDress = [UIButton buttonWithType:UIButtonTypeCustom];
    addDress.frame = CGRectMake(0, SCREENHEIGHT - [GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:100]);
    [addDress setTitle:NSLocalizedString(@"GZGADDress_ADD", nil) forState:UIControlStateNormal];
    addDress.backgroundColor = [UIColor redColor];
    [addDress addTarget:self action:@selector(addDressDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addDress];
    
}

#pragma mark 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _addressArrays.count;
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
    GZGAddressModel * model = _addressArrays[indexPath.row];
    CGSize nameSize = [GZGApplicationTool textSize:model.consignee font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]] size:SCREENWIDTH];
    cell.cellUserName.frame = CGRectMake([GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:30], nameSize.width, nameSize.height);
    
    
    cell.cellUserName.text = model.consignee;
    cell.cellCertifiCation.text = @"已认证";
    cell.cellTelNumber.text = model.phone;
    cell.cellAddress.text = model.address;
    cell.cellIDCar.text = @"321542525115152365";
    cell.cellSelectBtn.tag = indexPath.row+1000;
    [cell.cellSelectBtn addTarget:self action:@selector(cellSelectBtnDown:) forControlEvents:UIControlEventTouchUpInside];
    if (model.is_default.intValue == 0) {
        cell.cellSelectBtn.backgroundColor = [UIColor blackColor];
    }
//    if (indexPath.row == 0) {
//        cell.cellSelectBtn.backgroundColor = [UIColor blackColor];
//    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isBack) {
        GZGAddressModel * model = _addressArrays[indexPath.row];
        if (self.returnAddress) {
            self.returnAddress(model);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
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
    GZGAddressModel * model = _addressArrays[indexPath.row];
    //设置删除按钮
    UITableViewRowAction *deleteRow = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
        [self requestDataWithDeleteID:model.ids];
//        [_mainTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }];
    
    UITableViewRowAction *add = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
        [self editorDressDownWithModel:model];
        
        NSLog(@"设为默认");
    }];
    
    
    
    add.backgroundColor = [UIColor  lightGrayColor];
    
     return  @[deleteRow,add];
 
}
#pragma mark 自己的代理





#pragma mark 自己的方法
- (void)requestData {
    
    if (!_addressArrays) {
        _addressArrays = [NSMutableArray array];
    }
    if (_addressArrays.count) {
        [_addressArrays removeAllObjects];
    }
    
    NSString * userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
    NSDictionary * dict = @{@"memberId":userID};
    [[GZGYAPIHelper shareAPIHelper] addressListDict:dict Finsh:^(NSArray *array) {

        for (int i = 0; i < array.count; i++) {
            NSDictionary * dic = array[i];
            GZGAddressModel * model = [GZGAddressModel specialPerformanceWithDict:dic];
            [_addressArrays addObject:model];
        }
        [self.mainTableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"获取地址失败:%@",error);
    }];
}
- (void)requestDataWithDeleteID:(NSString *)ID {
    NSDictionary * dict = @{@"id":ID};
    [[GZGYAPIHelper shareAPIHelper] deleteAddressDict:dict Finsh:^(NSArray *array) {
        NSLog(@"删除:%@",array);
        [self requestData];
    } failed:^(NSError *error) {
        NSLog(@"删除失败:%@",error);
    }];
}

- (void)cellSelectBtnDown:(UIButton *)btn{
    
    
    
    for (NSInteger i=0; i<3; i++) {
        UIButton *btnxxx = (UIButton *)[self.view viewWithTag:1000 + i];
        btnxxx.backgroundColor = [UIColor redColor];
        
    }
    
    btn.backgroundColor = [UIColor blackColor];
}
- (void)editorDressDownWithModel:(GZGAddressModel *)model {
    GZGADDAddressViewController *vc = [[GZGADDAddressViewController alloc] init];
    [vc setHidesBottomBarWhenPushed:YES];
    vc.model = model;
    vc.type = AddressTypeEditor;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)addDressDown{
    GZGADDAddressViewController *vc = [[GZGADDAddressViewController alloc] init];
    [vc setHidesBottomBarWhenPushed:YES];
    vc.type = AddressTypeAdd;
    [self.navigationController pushViewController:vc animated:YES];
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
