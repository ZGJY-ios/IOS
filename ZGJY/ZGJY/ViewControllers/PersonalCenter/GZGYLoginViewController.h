//
//  GZGYLoginViewController.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYLoginViewController : UIViewController
@property(nonatomic ,strong)void(^TbabarLogin)(NSString * loginId);
@property(nonatomic, strong)NSString * backid;
@end
