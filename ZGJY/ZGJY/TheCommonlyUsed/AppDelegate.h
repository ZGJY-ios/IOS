//
//  AppDelegate.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLGhostAlertView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)AutoDisplayAlertView:(NSString*) title :(NSString*)msg;

@end

