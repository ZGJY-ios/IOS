//
//  GZGYEmailsView.h
//  ZGJY
//
//  Created by YYS on 2016/11/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EmailsDelegeteClickProtocol <NSObject>

- (void)BackDelegeteClick:(id)sender;
- (void)EmailsDelegeteClick:(id)sender;

@end
@interface GZGYEmailsView : UIView
@property(nonatomic, strong)id<EmailsDelegeteClickProtocol>delegate;
@property(nonatomic, strong)UIButton * backBtn;
@property(nonatomic, strong)UILabel * titleLabel;
@property(nonatomic, strong)UIView * backView;
@property(nonatomic, strong)UITextField * phoneField;
@property(nonatomic, strong)UILabel * lineLable;
@property(nonatomic, strong)UITextField * codeField;
@property(nonatomic, strong)UITextField * passField;
@property(nonatomic, strong)UITextField * onceField;
@property(nonatomic, strong)UILabel * promptLabel;
@property(nonatomic, strong)UIButton * completeBtn;
@end
