//
//  GZGUpImageDownTitleBtn.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGUpImageDownTitleBtn.h"

@implementation GZGUpImageDownTitleBtn
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super  initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 0;
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0,
                      (self.frame.size.height - [GZGApplicationTool control_height:16+25]),
                      contentRect.size.width,
                      [GZGApplicationTool control_wide:25]);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake((self.frame.size.width - self.widhSize)/2,
                      ((self.frame.size.height - [GZGApplicationTool control_height:16+25]) - self.heightSize)/2,
                      self.widhSize,
                      self.heightSize);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
