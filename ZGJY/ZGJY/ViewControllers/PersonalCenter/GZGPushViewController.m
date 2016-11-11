//
//  GZGPushViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGPushViewController.h"

@interface GZGPushViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *pushs;

@end

@implementation GZGPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"设置", nil);
    
    _pushs = [NSMutableArray arrayWithObjects:@"开启消息推送",@"消息推送音效", nil];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - self.navBarView.frame.origin.y - self.navBarView.frame.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
#pragma mark - 自己的方法
- (void)buttonClick:(UIButton *)btn {
    
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"退出" message:@"是否要退出当前账号" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"退出");
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertC addAction:action];
    [alertC addAction:action2];
    [self presentViewController:alertC animated:YES completion:nil];
}
#pragma mark - 系统的代理
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _pushs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"Setting";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _pushs[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:35]];
    UISwitch * cellSwitch = [[UISwitch alloc] init];
    cellSwitch.frame = CGRectMake([GZGApplicationTool control_wide:580], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:115], [GZGApplicationTool control_height:63]);
    cellSwitch.tag = indexPath.row;
    [cellSwitch addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    [cell.contentView addSubview:cellSwitch];
    if (indexPath.row == 0) {
        // 开启推送
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == UIUserNotificationTypeNone) {
            cellSwitch.on = NO;
        } else {
            cellSwitch.on = YES;
        }
    } else if (indexPath.row == 1) {
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == UIUserNotificationTypeSound) {
            cellSwitch.on = YES;
        } else {
            cellSwitch.on = NO;
        }
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [GZGApplicationTool control_height:0.01];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:123];
}

- (void)switchClick:(UISwitch *)cellSwitch {
    
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}


@end
