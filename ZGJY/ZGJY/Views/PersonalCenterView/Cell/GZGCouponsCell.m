//
//  GZGCouponsCell.m
//  ZGJY
//
//  Created by HX on 2016/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCouponsCell.h"

@implementation GZGCouponsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _couponsImage = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:30], [GZGApplicationTool control_height:107], [GZGApplicationTool control_height:107]);
            imageView.backgroundColor = [GZGColorClass subjectCouponsImageBackgroundColor];
            imageView.layer.cornerRadius = imageView.frame.size.width / 2;
            imageView.layer.masksToBounds = YES;
            imageView;
        });
        
        UILabel * yuanLabel = [[UILabel alloc] init];
        yuanLabel.frame = CGRectMake([GZGApplicationTool control_wide:80], [GZGApplicationTool control_height:41], [GZGApplicationTool control_height:16], [GZGApplicationTool control_height:16]);
        yuanLabel.textAlignment = NSTextAlignmentCenter;
        yuanLabel.textColor = [UIColor whiteColor];
        yuanLabel.text = NSLocalizedString(@"元", nil);
        yuanLabel.font =[ UIFont systemFontOfSize:[GZGApplicationTool control_height:16]];
        [self.couponsImage addSubview:yuanLabel];
        
        UIView * view = [[UIView alloc] init];
        view.frame = CGRectMake(0, [GZGApplicationTool control_height:70], self.couponsImage.frame.size.width, [GZGApplicationTool control_height:1]);
        view.backgroundColor = [UIColor whiteColor];
        [self.couponsImage addSubview:view];
        
        self.couponsLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:77], self.couponsImage.frame.size.width - [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:16]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:16]];
            label.textColor = [UIColor whiteColor];
            label.text = NSLocalizedString(@"优惠券", nil);
            label.textAlignment = NSTextAlignmentCenter;
            label;
        });
        self.couponsPriceLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:15], [GZGApplicationTool control_height:25], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:40]);
            label.font = [UIFont boldSystemFontOfSize:[GZGApplicationTool control_wide:30]];
            label.textColor = [UIColor whiteColor];
            label.text = NSLocalizedString(@"20", nil);
            label.textAlignment = NSTextAlignmentRight;
            label;
        });
        self.couponsNameLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:30], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:34]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
            label.textColor = [GZGColorClass subjectCouponsImageBackgroundColor];
            label.text = NSLocalizedString(@"奶粉20元劵", nil);
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
        self.couponsPasswordLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:66], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:29]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
            label.textColor = [UIColor blackColor];
            label.text = NSLocalizedString(@"劵密码：43333211556", nil);
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
        self.couponsConditionsLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:130], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:29]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
            label.textColor = [UIColor lightGrayColor];
            label.text = NSLocalizedString(@"使用条件：限部分指定商品使用", nil);
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
        UIView * line = [[UIView alloc] init];
        line.frame = CGRectMake(0, [GZGApplicationTool control_height:176], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:1]);
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
        self.couponsTimeLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:27], [GZGApplicationTool control_height:200], [GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:27]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:19]];
            label.textColor = [GZGColorClass subjectCouponsImageBackgroundColor];
            label.text = NSLocalizedString(@"还有10天过期", nil);
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
        self.couponsTimeLimitLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:371], [GZGApplicationTool control_height:200], [GZGApplicationTool control_wide:330], [GZGApplicationTool control_height:27]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:19]];
            label.textColor = [UIColor lightGrayColor];
            label.text = NSLocalizedString(@"有效期至：2016-09-16", nil);
            label.textAlignment = NSTextAlignmentRight;
            label;
        });
        
        
        [self.contentView addSubview:self.couponsImage];
        [self.couponsImage addSubview:self.couponsLabel];
        [self.couponsImage addSubview:self.couponsPriceLabel];
        [self.contentView addSubview:self.couponsNameLabel];
        [self.contentView addSubview:self.couponsPasswordLabel];
        [self.contentView addSubview:self.couponsConditionsLabel];
        [self.contentView addSubview:self.couponsTimeLabel];
        [self.contentView addSubview:self.couponsTimeLimitLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
