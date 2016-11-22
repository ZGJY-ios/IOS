//
//  GZGYBrandCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYBrandCollectionViewCell.h"

@implementation GZGYBrandCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imgView];
    }
    return self;
}
-(UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _imgView.image = [UIImage imageNamed:@"sy_hlpic2.jpg"];
    }
    return _imgView;
}
@end
