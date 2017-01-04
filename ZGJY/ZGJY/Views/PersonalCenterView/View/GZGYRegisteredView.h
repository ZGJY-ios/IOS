//
//  GZGYRegisteredView.h
//  ZGJY
//
//  Created by YYS on 16/11/11.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RegisteredDelegeteClickProtocol <NSObject>

- (void)BackDelegeteClick:(id)sender;
- (void)CodeDelegeteClick:(id)sender;
- (void)RegisteredDelegeteClick:(id)sender;

@end
@interface GZGYRegisteredView : UIView
@property(nonatomic, strong)id<RegisteredDelegeteClickProtocol>delegate;
@property(nonatomic, strong)UIButton * backBtn;
@property(nonatomic, strong)UILabel * titleLabel;
@property(nonatomic, strong)UIView * backView;
@property(nonatomic, strong)UILabel * codeLabel;
@property(nonatomic, strong)UITextField * phoneField;
@property(nonatomic, strong)UITextField * codeField;
@property(nonatomic, strong)UIButton * codeBtn;
@property(nonatomic, strong)UITextField * passField;
@property(nonatomic, strong)UITextField * onceField;
@property(nonatomic, strong)UIButton * completeBtn;
@end
