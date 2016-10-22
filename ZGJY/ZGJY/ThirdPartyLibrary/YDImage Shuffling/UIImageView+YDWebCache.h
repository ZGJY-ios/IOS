//
//  UIImageView+YDWebCache.h
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YDWebCache)
- (void)yd_downloadImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
@end
