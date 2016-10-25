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
@interface GZGYDetailsView : UIView
<UIScrollViewDelegate,ImgDelegeteClickProtocol>
{
    GZGYImgScrollView *goodsImgScro;
    
    UIImageView *imgGolbal;//全球购图标
    UILabel *shopName;//商品名称
    UILabel *priceLabel;//价格
    UILabel *shopPrice;//价格
    UILabel *wholeLabel;//批发数量
    UIImageView *phoneImg;//手机专享价
    UILabel *disLabel;//配送
    UILabel *freightLabel;//运费
    UILabel *freight;//运费
    UILabel *countLabel;//数量
    UILabel *speLabel;//规格
    UIImageView *iconImg;//服务图标
    UILabel *serviceLabel;//服务内容
}
@property(nonatomic, strong)GZGYButton *disButton;//配送地点
@property(nonatomic, strong)UIButton *disTimeBtn;//配送时间查询
@property(nonatomic, strong)UIButton *reduceButton;//减少
@property(nonatomic, strong)UIButton *addButton;//增加
@property(nonatomic, strong)UIButton *speButton;//规格
@property(nonatomic, strong)UITextField *countField;//输入
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
@end
