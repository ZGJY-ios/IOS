//
//  ZGNetImageSize.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/12.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "ZGNetDealImage.h"



@implementation ZGNetDealImage
@end
@implementation ZGNetDealImage (NSDates)

/**
 *  等比例压缩图片Size
 *
 *  @param image UIImage
 *
 *  @return CGSize
 */
+ (CGSize)compressImageSize:(UIImage *)image{
    
    CGFloat ww = [UIScreen mainScreen].bounds.size.width;
    CGFloat hh = [UIScreen mainScreen].bounds.size.height;
    CGSize imageSize = image.size;
    if (image.size.height/hh && image.size.width<ww) {
        imageSize.height = imageSize.height;
        imageSize.width = imageSize.width;
    }else{
        if (image.size.height/hh > (image.size.width/ww) ) {
            imageSize.height = hh;
            imageSize.width = ((hh/image.size.height)*image.size.width);
        }else if (image.size.height/hh <= image.size.width/ww){
            imageSize.height = (ww/image.size.width)*image.size.height;
            imageSize.width = ww;
        }
    }
    return imageSize;
}
/**
 *  压缩图片
 *
 *  @param image UIImage
 *  @param size  Size
 *
 *  @return UIImage
 */
+ (UIImage *)compressFinishIsImages:(UIImage *)image scaledToSize:(CGSize)size{
    //    创建一个图形图像上下文
    UIGraphicsBeginImageContext(size);
    //    把图片换成新的尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //    得到新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 *  图片转Data
 *
 *  @param image UIImage
 *  @param data  NSData
 */
+ (void)conversionImage:(UIImage *)image data:(void(^)(NSData *imgData))datas{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CGSize size = [self compressImageSize:image];
        UIImage *img = [self compressFinishIsImages:image scaledToSize:size];
        NSData *imgData = UIImagePNGRepresentation(img);
        dispatch_async(dispatch_get_main_queue(), ^{
            datas(imgData);
        });
    });
}

@end
