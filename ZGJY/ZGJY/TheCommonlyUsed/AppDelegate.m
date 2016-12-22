//
//  AppDelegate.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "AppDelegate.h"
#import "GZGGlobalPurchasingViewController.h"
#import "GZGTheShoppingCartViewController.h"
#import "GZGClassifiCationViewController.h"
#import "GZGPersonalCenterViewController.h"
#import "GZGMainNavgationController.h"
#import "WXApi.h"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setTabBarViewControllerType:0];
    //自动登录
    [self AutomaticLogin];
    
    
    // 向微信注册
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"demo 2.0"];
    
    return YES;
}
- (void)setTabBarViewControllerType:(NSInteger)type{

    GZGGlobalPurchasingViewController *globalVC = [[GZGGlobalPurchasingViewController alloc] init];
    GZGTheShoppingCartViewController *theShopVC = [[GZGTheShoppingCartViewController alloc] init];
    GZGClassifiCationViewController *classVC = [[GZGClassifiCationViewController alloc] init];
    GZGPersonalCenterViewController *personalVC = [[GZGPersonalCenterViewController alloc] init];
    
    [self tabbarViewControllerGlobal:globalVC
                             theShop:theShopVC
                               class:classVC
                            personal:personalVC
                            titleArr:@[NSLocalizedString(@"GZG_TabBarTitle_ZGQQG", nil),
                                       NSLocalizedString(@"GZG_TabBarTitle_GGC", nil),
                                       NSLocalizedString(@"GZG_TabBarTitle_FL", nil),
                                       NSLocalizedString(@"GZG_TabBarTitle_GRZX", nil)]
                     tabBarImageXArr:@[@"TabBar_GlobalPurchasing_X",
                                       @"TabBar_TheShopPingCart_X",
                                       @"TabBar_ClassifiCation_X",
                                       @"TabBar_PerSonalCenter_X"]
                         tabBarImageArr:@[@"TabBar_GlobalPurchasing",
                                       @"TabBar_TheShopPingCart",
                                       @"TabBar_ClassifiCation",
                                       @"TabBar_PerSonalCenter"]
                     tabBarBackColor:[UIColor whiteColor]
                   pitchOnTotleColor:[GZGColorClass subjectTabBarTitleColorX]
                    defaulTitleColor:[GZGColorClass subjectTabBarTitleColor]];
    
}

- (void)tabbarViewControllerGlobal:(__weak UIViewController *)globalController
                           theShop:(__weak UIViewController *)theShopController
                             class:(__weak UIViewController *)classController
                          personal:(__weak UIViewController *)personalController
                          titleArr:(NSArray *)titleArr
                   tabBarImageXArr:(NSArray *)tabbarOmageXArr
                    tabBarImageArr:(NSArray *)tabBarImageArr
                   tabBarBackColor:(UIColor *)tabBarColor
                 pitchOnTotleColor:(UIColor *)pitchOnColor
                  defaulTitleColor:(UIColor *)defaulTitleColor{
    
    NSMutableArray *controllerArr = [NSMutableArray array];
    NSArray *arrControllerVC = @[globalController,theShopController,classController,personalController];
    NSArray *arrTitle = titleArr;
    NSArray *arrTabBarImageX = tabbarOmageXArr;
    NSArray *arrTabBarImage = tabBarImageArr;

    UITabBarController *tabBar = [[UITabBarController alloc] init];
    for (NSInteger i=0; i<arrControllerVC.count; i++) {
        GZGMainNavgationController *mainNav = [[GZGMainNavgationController alloc] initWithRootViewController:arrControllerVC[i]];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        [tabBarItem setTitle:arrTitle[i]];
        tabBarItem.image = [[UIImage imageNamed:arrTabBarImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem.selectedImage = [[UIImage imageNamed:arrTabBarImageX[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ((UIViewController *)arrControllerVC[i]).tabBarItem = tabBarItem;
        [controllerArr addObject:mainNav];
    }
    UIView *tabBarBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    tabBarBack.backgroundColor = tabBarColor;
    [tabBar.tabBar insertSubview:tabBarBack atIndex:0];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:pitchOnColor,NSFontAttributeName:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:16.0f]]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:defaulTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:16.0f]]} forState:UIControlStateNormal];
    tabBar.viewControllers = controllerArr;
    tabBar.selectedIndex = 0;
    self.window.rootViewController = tabBar;
}

#pragma mark --- 自动登录
-(void)AutomaticLogin
{
    NSString * userName = [[NSUserDefaults standardUserDefaults]objectForKey:@"USERNAME"];
    NSString * passWord = [[NSUserDefaults standardUserDefaults]objectForKey:@"PASSWORD"];
    if (userName.length == 0||passWord.length == 0) {
        GZGLog(@"未登录状态");
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"USERID"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERNAME"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"PASSWORD"];
    }else{
        NSDictionary * dict = @{@"username":userName,@"password":passWord};
        [[GZGYAPIHelper shareAPIHelper]LoginDict:dict Between:@"0" Finsh:^(NSString * string,NSString * typeString,NSString * content,NSString * username,NSString * password){
            if ([typeString isEqualToString:@"error"]) {
                GZGLog(@"登录失败%@",content);
            }else{
                [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"USERID"];
                [[NSUserDefaults standardUserDefaults]setObject:username forKey:@"USERNAME"];
                [[NSUserDefaults standardUserDefaults]setObject:password forKey:@"PASSWORD"];
            }
        }];
    }
}
#pragma mark - WXAPI 接入
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    return [WXApi handleOpenURL:url delegate:self];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [WXApi handleOpenURL:url delegate:self];
}
// 微信支付成功或者失败回调
- (void) onResp:(BaseResp *)resp {
    
    NSString * strMsg = [NSString stringWithFormat:@"errcode:%d",resp.errCode];
    NSString * strTitle;
    
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
    }
    if ([resp isKindOfClass:[PayResp class]]) {
        // 支付返回结果，实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess: {
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功-PaySuccess,retcode = %d",resp.errCode);
            }
                break;
            case WXErrCodeUserCancel:
                strMsg = @"用户已经退出支付！";
                NSLog(@"用户已经退出支付-PayCancel, retcode = %d",resp.errCode);
            default: {
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, restr = %@",resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d，retstr = %@",resp.errCode,resp.errStr);
            }
                break;
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
