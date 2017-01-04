//
//  GZGHelpViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/5.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGHelpViewController.h"
#import "GZGHelpSuccessViewController.h"
#import "GZGHelpCell.h"

@interface GZGHelpViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * problems;
@property (nonatomic, strong) UITextField * textField; // 联系方式
@property (nonatomic, copy) NSString * problem; // 问题
@property (nonatomic, copy) NSString * opinion; // 意见
@end

@implementation GZGHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"帮助与反馈", nil);
    
    // UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - [GZGApplicationTool navBarAndStatusBarSize]) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.problems = @[@"商品咨询",@"订单问题",@"物流问题",@"售后服务",@"投诉建议",@"优惠劵"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 自己的方法
- (void)buttonClick:(UIButton *)btn {
    
    if (self.problem == nil || self.opinion == nil || self.textField.text == nil) {
        UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"完善信息" message:@"请将信息填写完整" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
    } else {
        UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"提交信息" message:@"信息提交成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            GZGHelpSuccessViewController * helpSuccessVC = [[GZGHelpSuccessViewController alloc] init];
            [self.navigationController pushViewController:helpSuccessVC animated:YES];
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
    }
}
#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 0;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:86];
    } else if (section == 2) {
        return [GZGApplicationTool control_height:200];
    }
    return [GZGApplicationTool control_height:0.01];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:118];
    } else if (section == 2) {
        return [GZGApplicationTool control_height:0.001];
    }
    return [GZGApplicationTool control_height:27];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:25], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:36])];
        label.text = NSLocalizedString(@"您的建议", nil);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        [view addSubview:label];
        return view;
    } else if (section == 2) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:200])];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:0], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:45])];
        label.text = NSLocalizedString(@"请确定您填写了有效的联系方式，我们将在48小时内与您联系！", nil);
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:20]];
        [view addSubview:label];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:73], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:95]);
        btn.backgroundColor = [GZGColorClass subjectHelpSubmitBackgroundColor];
        [btn setTitle:NSLocalizedString(@"提交", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:90])];
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:146], [GZGApplicationTool control_height:36])];
        label.text = NSLocalizedString(@"联系方式：", nil);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        [view addSubview:label];
        UITextField * textField = [[UITextField alloc]init];
        textField.frame = CGRectMake([GZGApplicationTool control_wide:175], [GZGApplicationTool control_height:22], [GZGApplicationTool control_wide:467], [GZGApplicationTool control_height:75]);
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        textField.returnKeyType = UIReturnKeyDone;
        textField.delegate = self;
        [view addSubview:textField];
        self.textField = textField;
        
        return view;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [GZGApplicationTool control_height:320];
    }
    return [GZGApplicationTool control_height:210];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"Cell";
        GZGFeedbackTypeCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GZGFeedbackTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.problemTypeLabel.text = NSLocalizedString(@"请选择您要反馈的问题类型：", nil);
        cell.problems = self.problems;
        __weak GZGHelpViewController * weakSelf = self;
        [cell setReturnProblemType:^(NSString * problemType) {
            weakSelf.problem = problemType;
        }];
        return cell;
    }
    static NSString * cellIdentifier = @"Cell";
    GZGAdviceCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GZGAdviceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    __weak GZGHelpViewController * weakSelf = self;
    [cell setReturnOpinion:^(NSString * opinion) {
        weakSelf.opinion = opinion;
    }];
    return cell;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
