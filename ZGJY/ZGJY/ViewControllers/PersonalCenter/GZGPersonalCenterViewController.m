//
//  PersonalCenterViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGPersonalCenterViewController.h"
#import "GZGAddressManageViewController.h"
#import "GZGYOrderViewController.h"
#import "GZGYAftersalesViewController.h"
#import "GZGHelpViewController.h"
#import "GZGSettingViewController.h"
#import "GZGCouponsViewController.h"
#import "GZGAuthenticateViewController.h"
#import "GZGYCollectionViewController.h"
#import "GZGYEvaluationViewController.h"
#import "GZGYTheOrderViewController.h"
#import "GZGYLoginViewController.h"
@interface UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end

@implementation UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end

@interface GZGPersonalCenterViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *personalCenters;
@property (nonatomic, strong) NSDictionary *myInformationGroupDic;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZGPersonalCenterViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self requestDataWithLogin];
}
- (void)requestDataWithLogin {
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userID = [userDefaults objectForKey:@"USERID"];
    if (userID == nil) {
        GZGYLoginViewController * logisticsVC = [[GZGYLoginViewController alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:logisticsVC];
        [self presentViewController:nav animated:YES completion:nil];
    } else {
        NSString * userName = [userDefaults objectForKey:@"USERNAME"];
        self.tableView.tableHeaderView = [self tableHeaderViewWithBackgroundImage:@"PersonalCenterBackgroundImage.jpg" headImage:@"PersonalHead" title:NSLocalizedString(userName, nil)];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"我的中港", nil);
    self.leftBtn.hidden = YES;
    
    [self.rightBtn setImage:[[UIImage imageNamed:@"PersonalCenterSet"]imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    NSArray * myInformationGroupImages = [NSArray arrayWithObjects:@"PersonalCenterForPayment",@"PersonalCenterForGoods",@"PersonalCenterToEvaluate",@"PersonalCenterHasCompleted", nil];
    NSArray * myInformationGroupTitles = [NSArray arrayWithObjects:@"待付款",@"待收货",@"待评价",@"已完成", nil];
    _myInformationGroupDic = [NSDictionary dictionaryWithObjectsAndKeys:myInformationGroupImages,@"image",myInformationGroupTitles,@"title", nil];
    NSArray * myInformationImages = [NSArray arrayWithObjects:@"PersonalCenterOrder",@"PersonalCenterAfterSales",@"PersonalCenterCollection",@"PersonalCenterCoupons",@"PersonalCenterAddress",@"PersonalCenterPassword",@"PersonalCenterEvaluation", nil];
    NSArray * myInformationTitles = [NSArray arrayWithObjects:@"我的订单",@"我的售后",@"我的收藏",@"我的优惠券",@"收货地址管理",@"密码管理",@"评价管理", nil];
    NSDictionary * myInformationDict = [NSDictionary dictionaryWithObjectsAndKeys:myInformationImages,@"image",myInformationTitles,@"title", nil];
    
    NSArray * programFunctionImages = [NSArray arrayWithObjects:@"PersonalCenterHelp", nil];
    NSArray * programFunctionTitles = [NSArray arrayWithObjects:@"评价与反馈", nil];
    
    NSDictionary * programFunction = [NSDictionary dictionaryWithObjectsAndKeys:programFunctionImages,@"image",programFunctionTitles,@"title", nil];
    
    _personalCenters = [NSMutableArray arrayWithObjects:myInformationDict,programFunction, nil];
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.origin.y + self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - self.navBarView.frame.origin.y - self.navBarView.frame.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    tableView.tableHeaderView = [self tableHeaderViewWithBackgroundImage:@"PersonalCenterBackgroundImage.jpg" headImage:@"PersonalHead" title:NSLocalizedString(@"中港会员123", nil)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] setObject:@"3" forKey:@"TABBARID"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 自己的方法
- (UIView *)tableHeaderViewWithBackgroundImage:(NSString *)backgroundImage headImage:(NSString *)headImage title:(NSString *)title {
    UIImageView * view = [[UIImageView alloc] init];
    view.frame = CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:357]);
    view.image = [UIImage imageNamed:backgroundImage];
    
    UIImageView * headView = [[UIImageView alloc] init];
    headView.frame = CGRectMake((view.frame.size.width - [GZGApplicationTool control_height:162]) / 2, [GZGApplicationTool control_height:68], [GZGApplicationTool control_height:162], [GZGApplicationTool control_height:162]);
    headView.image = [UIImage imageNamed:headImage];
    headView.layer.cornerRadius = headView.frame.size.width / 2;
    headView.layer.masksToBounds = YES;
    [view addSubview:headView];
    
    UILabel * label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
    label.textColor = [GZGColorClass subjectPersonalCenterColor];
    label.text = title;
    
    CGSize size = [label.text boundingRectWithSize:CGSizeMake([GZGApplicationTool screenWide], [GZGApplicationTool control_wide:33]) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:label.font} context:nil].size;
    label.frame = CGRectMake((view.frame.size.width - size.width) / 2, [GZGApplicationTool control_height:255], size.width, size.height);
    
    [view addSubview:label];
    
    return view;
}
- (UIView *)firstGroupView {
    UIView * view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:130]);
    view.backgroundColor = [UIColor whiteColor];
    NSArray * images = _myInformationGroupDic[@"image"];
    NSArray * titles = _myInformationGroupDic[@"title"];
    CGFloat width = [GZGApplicationTool screenWide] / titles.count;
    CGFloat height = view.frame.size.height;
    for (NSInteger i = 0; i< titles.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * width, 0, width, height);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; // 使button上的图片和文字水平居中
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleEdgeInsets = UIEdgeInsetsMake(button.imageView.frame.size.height, -button.imageView.frame.size.width, -10, 0); // 文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -button.titleLabel.bounds.size.width); // 图片距离右边框的距离减少图片的宽度，其他不变
        button.tag = i;
        [view addSubview:button];
        [button addTarget:self action:@selector(firstGroupViewItemClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return view;
}
- (void)firstGroupViewItemClick:(UIButton *)button {
    GZGYTheOrderViewController * theorder = [[GZGYTheOrderViewController alloc] init];
    theorder.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:theorder animated:YES];
    theorder.tagString = [NSString stringWithFormat:@"%ld",button.tag];
}
#pragma mark - 复用
- (void)rightBtnDown{
    GZGSettingViewController * settingVC = [[GZGSettingViewController alloc] init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
#pragma mark - 系统的代理
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _personalCenters.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary * dict = _personalCenters[section];
    NSArray * array = dict[@"title"];
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:87];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"PersonalCenter";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary * dict = _personalCenters[indexPath.section];
    NSArray * images = dict[@"image"];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    NSArray * titles = dict[@"title"];
    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
    if ([cell.textLabel.text isEqualToString:NSLocalizedString(@"我的优惠券", nil)]) {
        cell.detailTextLabel.text = NSLocalizedString(@"兑换优惠券", nil);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0: {

                    NSLog(@"我的订单");

                    GZGYOrderViewController * orders= [[GZGYOrderViewController alloc]init];
                    orders.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:orders animated:YES];
                }
                    break;
                case 1: {
                    GZGYAftersalesViewController * aftersales= [[GZGYAftersalesViewController alloc]init];
                    aftersales.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:aftersales animated:YES];
                }
                    break;
                case 2: {
                    GZGYCollectionViewController * collection= [[GZGYCollectionViewController alloc]init];
                    collection.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:collection animated:YES];
                    NSLog(@"我的收藏");
                }
                    break;
                case 3: {
                    NSLog(@"我的优惠券");
                    GZGCouponsViewController * couponsVC = [[GZGCouponsViewController alloc] init];
                    couponsVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:couponsVC animated:YES];
                }
                    break;
                case 4: {
                    NSLog(@"收货地址管理");
                    GZGAddressManageViewController *addredssManger = [[GZGAddressManageViewController alloc] init];
                    [addredssManger setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:addredssManger animated:YES];
                }
                    break;
                case 5: {
                    NSLog(@"密码管理");
                    GZGAuthenticateViewController * authenticateVC = [[GZGAuthenticateViewController alloc] init];
                    authenticateVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:authenticateVC animated:YES];
                }
                    break;
                case 6: {
                    GZGYEvaluationViewController * evaluation = [[GZGYEvaluationViewController alloc] init];
                    evaluation.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:evaluation animated:YES];
                    NSLog(@"评价管理");
                }
                    break;
            }
        }
            break;
            
        default: {
            switch (indexPath.row) {
                case 0: {
                    NSLog(@"评价与反馈");
                    GZGHelpViewController * helpVC = [[GZGHelpViewController alloc] init];
                    helpVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:helpVC animated:YES];

                }
                    break;
            }
        }
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [GZGApplicationTool control_height:130];
    }
    return [GZGApplicationTool control_height:30];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self firstGroupView];
    }
    return nil;
}

@end
