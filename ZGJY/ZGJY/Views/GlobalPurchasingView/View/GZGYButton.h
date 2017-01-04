//
//  GZGYButton.h
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYButton : UIButton
@property (nonatomic ,strong) UILabel *headLabel;
@property (nonatomic ,strong) UILabel *msgLabel;
@property(nonatomic, retain)UIImageView *jiantou;
- (id)initWithFrame:(CGRect)frame Head:(NSString *)head Message:(NSString *)msg;
@end
