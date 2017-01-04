//
//  GZGYLoginView.h
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LoginDelegeteClickProtocol <NSObject>

- (void)BackDelegeteClick:(id)sender;
- (void)RegDelegeteClick:(id)sender;
- (void)ForgetDelegeteClick:(id)sender;
- (void)LoginDelegeteClick:(id)sender;

@end
@interface GZGYLoginView : UIView
@property(nonatomic,strong)id <LoginDelegeteClickProtocol>delegete;
@property(nonatomic, strong)UIButton * backBtn;//返回按钮
@property(nonatomic, strong)UILabel * titleLabel;//标题
@property(nonatomic, strong)UIView * backView;
@property(nonatomic, strong)UILabel * lineLabel;
@property(nonatomic, strong)UIImageView * phoneImg;//手机号
@property(nonatomic, strong)UITextField * phoneField;//手机号
@property(nonatomic, strong)UIView * passView;
@property(nonatomic, strong)UILabel * passLabel;
@property(nonatomic, strong)UIImageView * passageImg;//密码
@property(nonatomic, strong)UITextField * passageField;//密码
@property(nonatomic, strong)UIButton * regBtn;//注册
@property(nonatomic, strong)UIButton * forgetBtn;//忘记密码
@property(nonatomic, strong)UIButton * loginBtn;//登录
@end
