//
//  UIImageView+XMGExtension.m
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIImageView+XMGExtension.h"
#import "UIImage+XMGExtension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (XMGExtension)
- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}

- (void)setCircleHeader:(NSString *)url
{
    UIImage *placeholder = [UIImage circleImage:@"GZG_Placeholder_Square_IMG"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
//        self.image = [image circleImage];
    }];
}

- (void)setRectHeader:(NSString *)url
{
    UIImage *placeholder = [UIImage imageNamed:@"GZG_Placeholder_Square_IMG"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}
@end
