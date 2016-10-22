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
#import "GZGYClassModel.h"
@implementation GZGYRightCollectionViewCell
@synthesize ImgView,NameLabel;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, KScreenWigth/9*2-20, KScreenWigth/9*2-20)];
        ImgView.image = [UIImage imageNamed:@"sy_mypic6.jpg"];
        [self addSubview:ImgView];
        NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KScreenWigth/9*2-10, KScreenWigth/9*2-10, 15)];
        NameLabel.textAlignment = NSTextAlignmentCenter;
        NameLabel.font = [UIFont systemFontOfSize:13];
        NameLabel.text = @"你猜";
        [self addSubview:NameLabel];
    }
    return self;
}
-(void)setModel:(GZGYClassModel *)model
{
    _model = model;
    NSLog(@"%@",model);
    NSDictionary*dic = model;
    self.NameLabel.text = dic[@"NameStr"];
}

@end
