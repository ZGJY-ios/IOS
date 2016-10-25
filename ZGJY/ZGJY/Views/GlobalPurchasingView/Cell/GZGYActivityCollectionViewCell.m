//
//  GZGYActivityCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYActivityCollectionViewCell.h"

@implementation GZGYActivityCollectionViewCell
@synthesize imgView,titleLabel;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, [GZGApplicationTool control_height:65])];
        imgView.image = [UIImage imageNamed:@"sy_hgpic2.jpg"];
        [self addSubview:imgView];
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:70], self.frame.size.width, 30)];
        titleLabel.text = @"限时抢购 先到先得";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13.5];
        [self addSubview:titleLabel];
    }
    return self;
}
@end
