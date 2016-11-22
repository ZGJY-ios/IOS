//
//  GZGSettingViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSettingViewController.h"
#import "GZGPushViewController.h"
#import "GZGAboutUsViewController.h"
#import "GZGYLoginViewController.h"
#import "GZGYRegisteredViewController.h"
@interface GZGSettingViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *settings;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZGSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"设置", nil);
    
    _settings = [NSMutableArray arrayWithObjects:@[@"开启消息推送",@"清除缓存"],@[@"关于港中港"], nil];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - self.navBarView.frame.origin.y - self.navBarView.frame.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
#pragma mark - 自己的方法
- (void)buttonClick:(UIButton *)btn {
    
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"退出" message:@"是否要退出当前账号" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        GZGYLoginViewController * login = [[GZGYLoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"USERID"];
        [self presentViewController:nav animated:YES completion:NULL];
        NSLog(@"退出");
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertC addAction:action2];
    [alertC addAction:action];
    [self presentViewController:alertC animated:YES completion:nil];
}
// 计算缓存大小
- (NSString *)getCacheSize {
    
    // 定义变量存储总的缓存大小
    long long sumSize = 0;
    // 获取当前缓存路径
    NSString * cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    // 创建文件管理对象
    NSFileManager * fileManager = [NSFileManager defaultManager];
    // 获取当前缓存路径下的所有子路径
    NSArray * subPaths = [fileManager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
    
    // 遍历所有子文件
    for (NSString * subPath in subPaths) {
        // 拼接完整路径
        NSString * filePath = [cacheFilePath stringByAppendingFormat:@"/%@",subPath];
        // 计算文件大小
        long long fileSize = [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
        // 加载到文件的大小
        sumSize += fileSize;
    }
    float size_m = sumSize / (1000 * 1000) ;
    return [NSString stringWithFormat:@"%.2fM",size_m];
}
// 清除本地缓存
- (void)removeCache {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    [fileManager removeItemAtPath:cacheFilePath error:nil];
    
    // 04、刷新单元格
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    // 05、04和05使用其一即可
    [_tableView reloadData]; // 刷新表视图
    
}
#pragma mark - 系统的代理
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _settings.count + 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == self.settings.count) {
        return 0;
    }
    NSArray * dict = _settings[section];
    return dict.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == self.settings.count) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:160])];
        view.backgroundColor = [UIColor clearColor];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100]);
        [btn setTitle:NSLocalizedString(@"退出", nil) forState:UIControlStateNormal];
        btn.tag = 1001;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"Setting";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray * dict = _settings[indexPath.section];
    cell.textLabel.text = dict[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:35]];
    if ([cell.textLabel.text isEqualToString:NSLocalizedString(@"开启消息推送", nil)] || [cell.textLabel.text isEqualToString:NSLocalizedString(@"版本检测", nil)] || [cell.textLabel.text isEqualToString:NSLocalizedString(@"关于港中港", nil)]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if ([cell.textLabel.text isEqualToString:NSLocalizedString(@"清除缓存", nil)]) {
        cell.detailTextLabel.text = [self getCacheSize];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [GZGApplicationTool control_height:40];
    } else if (section == self.settings.count) {
        return [GZGApplicationTool control_height:160];
    }
    return [GZGApplicationTool control_height:0.01];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:124];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            GZGPushViewController * pushVC = [[GZGPushViewController alloc] init];
            [self.navigationController pushViewController:pushVC animated:YES];
        } else if (indexPath.row == 1) {
            
            UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"" message:@"确定清除本地缓存？" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                [self removeCache];
            }];
            UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"取消");
            }];
            [alertC addAction:action2];
            [alertC addAction:action];
            [self presentViewController:alertC animated:YES completion:nil];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            // 关于港中港
            GZGAboutUsViewController * aboutUsVC = [[GZGAboutUsViewController alloc] init];
            [self.navigationController pushViewController:aboutUsVC animated:YES];
        } else if (indexPath.row == 1) {

        }
    }
}

@end
