//
//  GZGYRightCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYRightCollectionViewCell.h"
#define KScreenWigth     [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight  [[UIScreen mainScreen] bounds].size.height
@implementation GZGYRightCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self addSubview:self.ImgView];
        [self addSubview:self.NameLabel];
    }
    return self;
}
-(UIImageView *)ImgView
{
    if (_ImgView == nil) {
        _ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, KScreenWigth/9*2-20, KScreenWigth/9*2-20)];
        _ImgView.image = [UIImage imageNamed:@"sy_mypic6.jpg"];
    }
    return _ImgView;
}
-(UILabel *)NameLabel
{
    if (_NameLabel == nil) {
        _NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], self.frame.size.width, [GZGApplicationTool control_height:30])];
//        _NameLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        _NameLabel.textAlignment = NSTextAlignmentCenter;
        _NameLabel.font = [UIFont systemFontOfSize:15];
        _NameLabel.text = @"你猜";
    }
    return _NameLabel;
}
-(void)setModel:(GZGYsecondClassification *)model
{
    _model = model;
    _NameLabel.text = [NSString stringWithFormat:@"%@",self.model.name];
}

@end
