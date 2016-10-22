//
//  GZGYSalaCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSalaCollectionViewCell.h"

@implementation GZGYSalaCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _countdown = [GZGYCountdown countDown];
        _countdown.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        _countdown.frame = CGRectMake(0,0, [GZGApplicationTool control_wide:205], [GZGApplicationTool control_height:28]);
        _countdown.timestamp = 100;
        _countdown.timerStopBlock = ^{
            NSLog(@"倒计时结束应该做的事情");
        };
        [self addSubview:_countdown];
        _imgView = [UIImageView new];
        _imgView.frame = CGRectMake(0,[GZGApplicationTool control_height:28], [GZGApplicationTool control_wide:205], [GZGApplicationTool control_height:170]);
        //_imgView.frame = CGRectMake(0, 17, self.frame.size.width, self.frame.size.height-50);
        _imgView.image = [UIImage imageNamed:@"sy_hgpic2.jpg"];
        [self addSubview:_imgView];
        _priceLabel = [UILabel new];
        _priceLabel.frame = CGRectMake(0,[GZGApplicationTool control_height:210], [GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:30]);
        //_priceLabel.frame = CGRectMake(5, self.frame.size.height-30, self.frame.size.width/3, 15);
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.text = @"¥118";
        _priceLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_priceLabel];
        _originalLabel = [[GZGYStrikeThroughLabel alloc] initWithFrame:CGRectZero];
        _originalLabel.frame = CGRectMake([GZGApplicationTool control_wide:62],[GZGApplicationTool control_height:217], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20]);
        //_originalLabel.frame = CGRectMake(self.frame.size.width/3+5, self.frame.size.height-25, 30, 10);
        _originalLabel.strikeThroughEnabled = YES;
        _originalLabel.font = [UIFont systemFontOfSize:8];
        _originalLabel.text = @"¥150";
        [self addSubview:_originalLabel];
        _amqcLabel = [UILabel new];
        _amqcLabel.frame = CGRectMake([GZGApplicationTool control_wide:150],[GZGApplicationTool control_height:200], [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:25]);
        //_amqcLabel.frame = CGRectMake(self.frame.size.width-50, self.frame.size.height-30, 50, 10);
        _amqcLabel.textAlignment = NSTextAlignmentRight;
        _amqcLabel.text = @"AMQS";
        _amqcLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_amqcLabel];
        _brandLabel = [UILabel new];
        _brandLabel.frame = CGRectMake([GZGApplicationTool control_wide:130],[GZGApplicationTool control_height:217], [GZGApplicationTool control_wide:75], [GZGApplicationTool control_height:25]);
        //_brandLabel.frame = CGRectMake(self.frame.size.width-70, self.frame.size.height-20, 70, 10);
        _brandLabel.text = @"NMMYWK";
        _brandLabel.font = [UIFont systemFontOfSize:8];
        _brandLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_brandLabel];
    }
    return self;
}

@end
