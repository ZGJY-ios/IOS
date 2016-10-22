//
//  GZGYChoiceView.h
//  ZGJY
//
//  Created by YYS on 16/10/22.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGYChoiceView : UIView
{
    UILabel * lineLabel;//分割线
    UILabel * categoryLabel;//类别
    UILabel * countLabel;//商品数量
}
@property(nonatomic, strong)UIView * alphaiView;//半透明背景
@property(nonatomic, strong)UIView * choiceView;//弹出页面
@property(nonatomic, strong)UIImageView * imgView;//商品图片
@property(nonatomic, strong)UIButton * cancelBtn;//取消按钮
@property(nonatomic, strong)UILabel * priceLabel;//商品价格
@property(nonatomic, strong)UIButton * categoryBtn;//类别按钮
@property(nonatomic, strong)UIButton *reduceBtn;//减少
@property(nonatomic, strong)UIButton *addBtn;//增加
@property(nonatomic, strong)UITextField *countField;//输入
@property(nonatomic, strong)UIButton *collectionBtn;//收藏
@property(nonatomic, strong)UIButton *receiptBtn;//进货单
@end
