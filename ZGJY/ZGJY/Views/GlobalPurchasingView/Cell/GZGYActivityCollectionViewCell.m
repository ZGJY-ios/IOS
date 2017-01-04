//
//  GZGYActivityCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYActivityCollectionViewCell.h"

@implementation GZGYActivityCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.imgView];
        [self addSubview:self.titleLabel];
    }
    return self;
}
-(UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, [GZGApplicationTool control_height:65])];
        _imgView.image = [UIImage imageNamed:@"time-limit"];
    }
    return _imgView;
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:70], self.frame.size.width, 30)];
        _titleLabel.text = @"限时抢购 先到先得";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:27]];
    }
    return _titleLabel;
}
@end
