//
//  UIImageView+YDWebCache.m
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "UIImageView+YDWebCache.h"

#import "YDImageDowoload.h"
@implementation UIImageView (YDWebCache)
- (void)yd_downloadImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage{
    self.image = placeholderImage;
    __weak __typeof(self)wself = self;
    YDImageDowoload *imagexxx = [[YDImageDowoload alloc] init];
    [imagexxx yd_getImageUrl:url image:^(UIImage *images) {
        wself.image = images;
    }];
}



@end
