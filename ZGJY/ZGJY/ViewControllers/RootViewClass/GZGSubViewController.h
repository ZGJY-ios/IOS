//
//  GZGSubViewController.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGRootViewController.h"
#import "UIImageView+WebCache.h"

@interface GZGSubViewController : GZGRootViewController
@property (nonatomic, strong) UIView *navBarView;
@property (nonatomic, strong) UILabel *titles;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
-(void)creatleftBtnWithTitle:(NSString*)title normalImage:(NSString*)normalImage highlightedImage:(NSString*)highlightedImage frame:(CGRect)frame action:(SEL)action;
-(void)pop;
@end
