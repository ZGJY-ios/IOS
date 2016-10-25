//
//  GZGShoppingCartCell.m
//  ZGJY
//
//  Created by HX on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGShoppingCartCell.h"

@implementation GZGShoppingCartCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [GZGApplicationTool screenWide], [GZGApplicationTool control_height:230]);
        [self buildUI];
    }
    return self;
}

#pragma mark - 自己的方法
- (void)buildUI {
    
    self.cartRedio = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake([GZGApplicationTool control_wide:15], [GZGApplicationTool control_height:90], [GZGApplicationTool control_height:40], [GZGApplicationTool control_height:40]);
        [button setImage:[UIImage imageNamed:@"TheShoppingCartNoHook"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"TheShoppingCartSelectHook"] forState:UIControlStateSelected];
        button.tag = 0;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    self.cartImage = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:61], [GZGApplicationTool control_height:20], [GZGApplicationTool control_height:180], [GZGApplicationTool control_height:180]);
        imageView.image = [UIImage imageNamed:@"searchList-icon2"];
        imageView;
    });
    self.cartTitle = ({
        UILabel * label = [[UILabel alloc] init];
        label.text = NSLocalizedString(@"金装幼儿配方奶粉3段（1-3岁幼儿适用）900克", nil);
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:27]];
        CGSize size = [self computingSizeWithString:label.text forFont:label.font];
        label.frame = CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:20], size.width, size.height);
        label.numberOfLines = 0;
        label;
    });
    self.cartPhone = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake([GZGApplicationTool control_wide:290], self.cartTitle.frame.origin.y + self.cartTitle.frame.size.height + [GZGApplicationTool control_height:12], [GZGApplicationTool control_height:20], [GZGApplicationTool control_height:29]);
        imageView.image = [UIImage imageNamed:@"TheShoppingCartPhone"];
        imageView;
    });
    self.cartExclusive = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(self.cartPhone.frame.origin.x + self.cartPhone.frame.size.width + [GZGApplicationTool control_wide:10], self.cartTitle.frame.origin.y + self.cartTitle.frame.size.height + [GZGApplicationTool control_height:14], [GZGApplicationTool control_wide:97], [GZGApplicationTool control_height:25]);
        imageView.image = [UIImage imageNamed:@"TheShoppingCartExclusive"];
        imageView;
    });
    self.cartPrice = ({
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake([GZGApplicationTool control_wide:290], [GZGApplicationTool control_height:170], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:33]);
        label.text = NSLocalizedString(@"￥188.00", nil);
        label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        label.textColor = [GZGColorClass subjectShoppingCartPriceColor];
        label;
    });
    UIView * view = [[UIView alloc] init];
    view.frame = CGRectMake([GZGApplicationTool control_wide:483], [GZGApplicationTool control_height:147], [GZGApplicationTool control_wide:185], [GZGApplicationTool control_height:55]);
    view.layer.borderWidth = 1;
    view.layer.borderColor = [GZGColorClass subjectShoppingCartBorderColor].CGColor;
    view.userInteractionEnabled = YES;
    [self.contentView addSubview:view];
    self.cartSub = ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:484], [GZGApplicationTool control_height:148], [GZGApplicationTool control_wide:54], [GZGApplicationTool control_height:53]);
        btn.backgroundColor = [GZGColorClass subjectShoppingCartGoodsAddSubBackgroundColor];
        [btn setTitleColor:[GZGColorClass subjectShoppingCartGoodsFillColor] forState:UIControlStateNormal];
        [btn setTitle:@"-" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1;
        btn;
    });
    self.cartNumber = ({
        UITextField * textField = [[UITextField alloc] init];
        textField.frame = CGRectMake([GZGApplicationTool control_wide:538], [GZGApplicationTool control_height:148], [GZGApplicationTool control_wide:75], [GZGApplicationTool control_height:53]);
        textField.borderStyle = UITextBorderStyleNone;
        textField.text = @"1";
        textField.textAlignment = NSTextAlignmentCenter;
        textField.enabled = NO;
        textField;
    });
    self.cartAdd = ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:613], [GZGApplicationTool control_height:148], [GZGApplicationTool control_wide:54], [GZGApplicationTool control_height:53]);
        btn.backgroundColor = [GZGColorClass subjectShoppingCartGoodsAddSubBackgroundColor];
        [btn setTitleColor:[GZGColorClass subjectShoppingCartGoodsFillColor] forState:UIControlStateNormal];
        [btn setTitle:@"+" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 2;
        btn;
    });
    [self.contentView addSubview:self.cartRedio];
    [self.contentView addSubview:self.cartImage];
    [self.contentView addSubview:self.cartTitle];
    [self.contentView addSubview:self.cartPhone];
    [self.contentView addSubview:self.cartExclusive];
    [self.contentView addSubview:self.cartPrice];
    [self.contentView addSubview:self.cartSub];
    [self.contentView addSubview:self.cartNumber];
    [self.contentView addSubview:self.cartAdd];
}
- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case 0: {
            // 选中
            button.selected = !button.isSelected;
        }
            break;
        case 1: {
            // 商品减少
            NSInteger number = [self.cartNumber.text integerValue];
            if (number > 1) {
                self.cartNumber.text = [NSString stringWithFormat:@"%ld",--number];
            }
        }
            break;
        case 2: {
            // 商品添加
            NSInteger number = [self.cartNumber.text integerValue];
            self.cartNumber.text = [NSString stringWithFormat:@"%ld",++number];
        }
            break;
    }
}
- (CGSize)computingSizeWithString:(NSString *)string forFont:(UIFont *)font {
    
    NSDictionary * dict = @{NSFontAttributeName : font};
    
    CGSize size = [string boundingRectWithSize:CGSizeMake([GZGApplicationTool control_wide:375], MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    return size;
}

@end
