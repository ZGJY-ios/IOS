//
//  GZGYDetailsView.h
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZGYImgScrollView.h"
#import "GZGYButton.h"
#import "GZGYDetailsModel.h"
@interface GZGYDetailsView : UIView
<UIScrollViewDelegate,ImgDelegeteClickProtocol>
@property(nonatomic, strong)GZGYImgScrollView *goodsImgScro;
@property(nonatomic, strong)UILabel * shopName;//商品名称
@property(nonatomic, strong)UILabel * priceLabel;//价格
@property(nonatomic, strong)UILabel * shopPrice;//价格
@property(nonatomic, strong)UILabel * startLabel;//起批量
@property(nonatomic, strong)UILabel * wholeLabel;//批发数量
@property(nonatomic, strong)UILabel * serialLabel;//编号
@property(nonatomic, strong)UILabel * numberLabel;//编号
@property(nonatomic, strong)UILabel * givingLabel;//赠送积分
@property(nonatomic, strong)UILabel * integralLabel;//赠送积分
@property(nonatomic, strong)UILabel * countLabel;//数量
@property(nonatomic, strong)UIButton * reduceButton;//减少
@property(nonatomic, strong)UIButton * addButton;//增加
@property(nonatomic, strong)UITextField * countField;//输入
@property(nonatomic, strong)GZGYDetailsModel * model;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
@end
