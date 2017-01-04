//
//  GZGYButton.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYButton.h"

@implementation GZGYButton

@synthesize headLabel,msgLabel,jiantou;
- (id)initWithFrame:(CGRect)frame Head:(NSString *)head Message:(NSString *)msg
{
    self = [super initWithFrame:frame];
    if (self) {
        //此处设置的坐标无用处 不设置也可以
        headLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 30)];
        headLabel.backgroundColor = [UIColor clearColor];
        headLabel.text = head;
        headLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        //headLabel.lineBreakMode = NSLineBreakByWordWrapping;
        headLabel.numberOfLines = 0;
        [self addSubview:headLabel];
        
        msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
        msgLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:28]];
        msgLabel.textColor = [UIColor lightGrayColor];
        msgLabel.backgroundColor = [UIColor clearColor];
        msgLabel.textAlignment = NSTextAlignmentRight;
        msgLabel.text = msg;
        //msgLabel.lineBreakMode = NSLineBreakByWordWrapping;
        msgLabel.numberOfLines = 0;
        [self addSubview:msgLabel];
        
        jiantou = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-30, (self.frame.size.height-25.5)/2, 28, 25.5)];
        
        [self addSubview:jiantou];
    }
    return self;
}


@end
