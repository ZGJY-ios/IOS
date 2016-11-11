//
//  GZGAboutUsViewController.m
//  ZGJY
//
//  Created by HX on 2016/11/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAboutUsViewController.h"

@interface GZGAboutUsViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray * aboutUs;
@end

@implementation GZGAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles.text = NSLocalizedString(@"关于我们", nil);
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - self.navBarView.frame.origin.y - self.navBarView.frame.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    tableView.tableHeaderView = [self tableHeaderViewWithBackgroundImage:@"OfficialAddress"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    _aboutUs = [NSMutableArray arrayWithObjects:@"地址：北京市XX区XX街道",@"免费客服热线：400-888-8888",@"客服热线：8888-53376081/53376082/53376083",@"E-mail：service@zgjy.com", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 自己的方法
- (UIView *)tableHeaderViewWithBackgroundImage:(NSString *)backgroundImage {
    
    UIImageView * view = [[UIImageView alloc] init];
    view.frame = CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:357]);
    view.image = [UIImage imageNamed:backgroundImage];
    
    return view;
}

#pragma mark - 系统的代理
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _aboutUs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"About";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _aboutUs[indexPath.row];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:24]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:60];
    
}

@end
