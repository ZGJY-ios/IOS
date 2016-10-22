//
//  GZGYBrandCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYBrandCollectionViewCell.h"

@implementation GZGYBrandCollectionViewCell
@synthesize imgView;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        imgView.image = [UIImage imageNamed:@"sy_hlpic2.jpg"];
        [self addSubview:imgView];
    }
    return self;
}
@end
