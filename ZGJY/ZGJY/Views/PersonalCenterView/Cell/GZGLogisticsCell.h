//
//  GZGLogisticsCell.h
//  ZGJY
//
//  Created by HX on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  物流

#import <UIKit/UIKit.h>

@interface GZGLogisticsCell : UITableViewCell

@property (nonatomic, strong) UIImageView * timeImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) UIView * verticalLineTopView;
@property (nonatomic, strong) UIView * verticalLineBottomView;
- (void)setTitle:(NSString *)string;
+ (CGFloat)cellHeightWithString:(NSString *)string isContentHeight:(BOOL)isBool;

@end
