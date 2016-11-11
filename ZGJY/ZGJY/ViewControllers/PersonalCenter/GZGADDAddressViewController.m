//
//  GZGADDAddressViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressViewController.h"
#import "GZGADDAddressCell.h"
#import "GZGADDAddressView.h"
static const NSInteger TEXTFILEDTAG = 1000;

@interface GZGADDAddressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic, strong) UITableView *mainTableView;
@property(nonatomic, strong) UIView *blackBackView;
@property(nonatomic, strong) GZGADDAddressView *addAddressTextView;
@property(nonatomic, strong) NSString *addAddressStr;
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
                                                                   SCREENHEIGHT - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_mainTableView];
    
    
    
    _blackBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _blackBackView.backgroundColor = [UIColor blackColor];
    _blackBackView.alpha = 0.3;
    _blackBackView.hidden = YES;
    [self.view addSubview:_blackBackView];
    
    
    __weak typeof (GZGADDAddressViewController) *address = self;//防止循环引用，页面释放时释放他
    
    _addAddressTextView = [[GZGADDAddressView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT + [GZGApplicationTool control_height:741], SCREENWIDTH, [GZGApplicationTool control_height:741])];
    _addAddressTextView.cityAddressText = ^(NSString *cityAddressText){
        address.blackBackView.hidden = YES;
        address.addAddressStr = cityAddressText;
        [address.mainTableView reloadData];
        [UIView animateWithDuration:0.5 animations:^{
            address.addAddressTextView.frame = CGRectMake(0, SCREENHEIGHT + [GZGApplicationTool control_height:741], SCREENWIDTH, [GZGApplicationTool control_height:741]);
            
        }];
    };
    
    [self.view addSubview:_addAddressTextView];
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
    
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4) {
        cell.cellTextFiled.hidden = NO;
    }else{
        cell.cellAfterText.hidden = NO;
    }
    
    if (indexPath.row == 3) {
        cell.cellAfterText.text =  _addAddressStr;
    }
    if (indexPath.row == 5) {
        cell.cellSWitch.hidden = NO;
    }
    
    cell.cellTextFiled.tag = TEXTFILEDTAG + indexPath.row;
    
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: {
            
        }
            break;
        case 1: {
        }
            break;
        case 2: {
        }
            break;
        case 3: {
            _blackBackView.hidden = NO;
            [UIView animateWithDuration:0.5 animations:^{
                _addAddressTextView.frame = CGRectMake(0, SCREENHEIGHT - [GZGApplicationTool control_height:741], SCREENWIDTH, [GZGApplicationTool control_height:741]);
                
            }];
            
        }
            break;
        case 4: {
        }
            break;
        case 5: {
        }
            break;
            
            
        default:
            break;
    }
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
