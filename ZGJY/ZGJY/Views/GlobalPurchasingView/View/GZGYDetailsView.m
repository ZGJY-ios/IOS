//
//  GZGYDetailsView.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsView.h"

@implementation GZGYDetailsView
@synthesize disButton,disTimeBtn,reduceButton,addButton,speButton,countField;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr
{
    self = [super initWithFrame:frame];
    if (self) {
        goodsImgScro = [[GZGYImgScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:750]) andImageArr:imageArr];
        goodsImgScro.delegete = self;
        [self addSubview:goodsImgScro];
        imgGolbal = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Oayep-tag"]];
        imgGolbal.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:800], [GZGApplicationTool control_wide:65], [GZGApplicationTool control_height:35]);
        [self addSubview:imgGolbal];
        shopName = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:790], [GZGApplicationTool control_wide:640], [GZGApplicationTool control_height:90])];
        shopName.text = @"        爱茉莉太平洋旗下的沙龙美发品牌至纯去屑发膜原装进口 保税区发货";
        shopName.numberOfLines = 2;
        [self addSubview:shopName];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:930], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:45])];
        priceLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        priceLabel.text = @"价格";
        [self addSubview:priceLabel];
        shopPrice = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:930], [GZGApplicationTool control_wide:100],[GZGApplicationTool control_height:45])];
        shopPrice.text = @"¥650";
        shopPrice.textColor = [UIColor colorWithRed:170/255.0 green:50/255.0 blue:55/255.0 alpha:1.0];
        [self addSubview:shopPrice];
        wholeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:210], [GZGApplicationTool control_height:930], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:45])];
        wholeLabel.text = @"(15件起批)";
        wholeLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:wholeLabel];
        phoneImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone-tag"]];
        phoneImg.frame = CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_wide:980], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35]);
        [self addSubview:phoneImg];
        disLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1070], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:45])];
        disLabel.text = @"配送";
        disLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:disLabel];
        disButton = [[GZGYButton alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:1065], [GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:55]) Head:@"北京" Message:nil];
        disButton.layer.masksToBounds = YES;
        disButton.layer.borderWidth = 1.0;
        disButton.layer.borderColor = [[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] CGColor];
        disButton.headLabel.frame = CGRectMake(0, [GZGApplicationTool control_height:5], [GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:35]);
        disButton.headLabel.textAlignment = NSTextAlignmentCenter;
        disButton.jiantou.frame = CGRectMake([GZGApplicationTool control_wide:115], [GZGApplicationTool control_height:15], [GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:15]);
        disButton.jiantou.image = [UIImage imageNamed:@"uncheck-down"];
        [self addSubview:disButton];
        disTimeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        disTimeBtn.frame = CGRectMake([GZGApplicationTool control_wide:300], [GZGApplicationTool control_height:1070], [GZGApplicationTool control_wide:230], [GZGApplicationTool control_height:45]);
        [disTimeBtn setTitle:@"配送时间查询" forState:UIControlStateNormal];
        [disTimeBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:101/255.0 blue:188/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:disTimeBtn];
        freightLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1160], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:45])];
        freightLabel.text = @"运费";
        freightLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:freightLabel];
        freight = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:1160], [GZGApplicationTool control_wide:600], [GZGApplicationTool control_height:45])];
        freight.text = @"单笔订单不满399元,在线支付运费15元";
        [self addSubview:freight];
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1240], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:45])];
        countLabel.text = @"数量";
        countLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:countLabel];
        UIView * countView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:1235], [GZGApplicationTool control_wide:180], [GZGApplicationTool control_height:55])];
        countView.layer.masksToBounds = YES;
        countView.layer.borderWidth = 1.0;
        countView.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0] CGColor];
        [self addSubview:countView];
        reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        reduceButton.frame = CGRectMake(0, 0, [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55]);
        reduceButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [reduceButton setTitle:@"➖" forState:UIControlStateNormal];
        [countView addSubview:reduceButton];
        countField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:55], 0, [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:55])];
        countField.text = @"1";
        countField.textAlignment = NSTextAlignmentCenter;
        [countView addSubview:countField];
        addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake([GZGApplicationTool control_wide:125], 0, [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55]);
        [addButton setTitle:@"➕" forState:UIControlStateNormal];
        addButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [countView addSubview:addButton];
        speLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:1340], [GZGApplicationTool control_wide:90], [GZGApplicationTool control_height:45])];
        speLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        speLabel.text = @"规格";
        [self addSubview:speLabel];
        speButton = [UIButton buttonWithType:UIButtonTypeCustom];
        speButton.frame = CGRectMake([GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:1335], [GZGApplicationTool control_wide:550], [GZGApplicationTool control_height:55]);
        speButton.layer.masksToBounds = YES;
        speButton.layer.borderWidth = 1.0;
        speButton.layer.borderColor = [[UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0] CGColor];
        [speButton setTitle:@"经典版" forState:UIControlStateNormal];
        [speButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:speButton];
        UIView * serviceView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:1420], SCREENWIDTH, [GZGApplicationTool control_height:140])];
        serviceView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [self addSubview:serviceView];
        NSArray * imgArray = @[@"pass-red",@"pass-red",@"pass-red",@"tip"];
        NSArray * serviceArray = @[@"中港全球发货",@"正品保证",@"支持货到付款",@"不支持七天退货"];
        for (int i = 0; i<2; i++) {
            for (int j = 0; j<3; j++) {
                if (i>0&&j>0) {
                    NSLog(@"别创建了");
                }else{
                    iconImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20]+([GZGApplicationTool control_wide:230]+[GZGApplicationTool control_wide:10])*j, [GZGApplicationTool control_height:15]+([GZGApplicationTool control_height:45]+[GZGApplicationTool control_height:10])*i, [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30])];
                    iconImg.image = [UIImage imageNamed:imgArray[i*3+j]];
                    [serviceView addSubview:iconImg];
                    serviceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:60]+([GZGApplicationTool control_wide:230]+[GZGApplicationTool control_wide:10])*j, [GZGApplicationTool control_height:15]+([GZGApplicationTool control_height:45]+[GZGApplicationTool control_height:10])*i, [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30])];
                    serviceLabel.text = serviceArray[i*3+j];
                    serviceLabel.font = [UIFont systemFontOfSize:12];
                    serviceLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
                    [serviceView addSubview:serviceLabel];
                }
            }
        }
        
    }
    return self;
}
-(void)ImgDelegeteClick:(id)sender
{
    NSLog(@"%@",sender);
}
@end
