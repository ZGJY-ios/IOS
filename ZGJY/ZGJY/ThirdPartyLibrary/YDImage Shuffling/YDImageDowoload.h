//
//  YDImageDowoload.h
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YDImageDowoload : NSObject
+(YDImageDowoload *)shareItern;
+(void)initialize;
- (void)yd_getImageUrl:(NSString *)urlstr image:(void (^)(UIImage *images))img;
@end
