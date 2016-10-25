//
//  GZGCountriesTheCostomTableView.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesTheCostomTableView.h"

@implementation GZGCountriesTheCostomTableView
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.tableHeaderView && CGRectContainsPoint(self.tableHeaderView.frame, point)) {
        return NO;
    }
    return [super pointInside:point withEvent:event];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
