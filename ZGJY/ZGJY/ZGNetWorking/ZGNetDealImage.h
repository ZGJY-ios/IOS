//
//  ZGNetImageSize.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/12.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZGNetDealImage : NSObject
@end

@interface ZGNetDealImage (NSDates)
/**
 *  图片转Data
 *
 *  @param image UIImage
 *  @param data  NSData
 */
+ (void)conversionImage:(UIImage *)image data:(void(^)(NSData *imgData))datas;
@end