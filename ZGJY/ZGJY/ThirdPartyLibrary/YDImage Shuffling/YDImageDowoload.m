//
//  YDImageDowoload.m
//  两站图片实现轮播图
//
//  Created by 刘亚栋 on 16/8/2.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "YDImageDowoload.h"
#import <ImageIO/ImageIO.h>
static NSString *cache;
static YDImageDowoload *image = nil;
@interface YDImageDowoload ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation YDImageDowoload

+(YDImageDowoload *)shareItern{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = [[YDImageDowoload alloc] init];
    });
    return image;
}

+ (void)initialize {
    cache = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"YDImageFile"];
    BOOL isDir = NO;
    BOOL isExists = [[NSFileManager defaultManager] fileExistsAtPath:cache isDirectory:&isDir];
    if (!isExists || !isDir) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cache withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark- 懒加载
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
#pragma mark 下载图片，如果是gif则计算动画时长
UIImage *getImageWithData(NSData *data) {
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(imageSource);
    if (count <= 1) { //非gif
        CFRelease(imageSource);
        return [[UIImage alloc] initWithData:data];
    } else { //gif图片
        NSMutableArray *images = [NSMutableArray array];
        NSTimeInterval duration = 0;
        for (size_t i = 0; i < count; i++) {
            CGImageRef image = CGImageSourceCreateImageAtIndex(imageSource, i, NULL);
            if (!image) continue;
            duration += durationWithSourceAtIndex(imageSource, i);
            [images addObject:[UIImage imageWithCGImage:image]];
            CGImageRelease(image);
        }
        if (!duration) duration = 0.1 * count;
        CFRelease(imageSource);
        return [UIImage animatedImageWithImages:images duration:duration];
    }
}


#pragma mark 获取每一帧图片的时长
float durationWithSourceAtIndex(CGImageSourceRef source, NSUInteger index) {
    float duration = 0.1f;
    CFDictionaryRef propertiesRef = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *properties = (__bridge NSDictionary *)propertiesRef;
    NSDictionary *gifProperties = properties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTime = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTime) duration = delayTime.floatValue;
    else {
        delayTime = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTime) duration = delayTime.floatValue;
    }
    CFRelease(propertiesRef);
    return duration;
}

#pragma  mark 获取图片
- (void)yd_getImageUrl:(NSString *)urlstr image:(void (^)(UIImage *images))img{
    NSString *imageName = [urlstr stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSString *path = [cache stringByAppendingPathComponent:imageName];
    [self downloadImageUrlstr:urlstr path:path image:img];
}

- (void)downloadImageUrlstr:(NSString *)urlstr path:(NSString *)path image:(void (^)(UIImage *images))img{
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data) {
        UIImage *image  = getImageWithData(data);//下载图片
        img(image);
        return;
    }
    NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]];
        if (!data) {
            return;
        }
        UIImage *image = getImageWithData(data);
        [data writeToFile:path atomically:YES];
        img(image);
    }];
    [self.queue addOperation:download];
}

/**
 *  暂时不同，清除缓存
 */
//- (void)clearDiskCache {
//    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:cache error:NULL];
//    for (NSString *fileName in contents) {
//        [[NSFileManager defaultManager] removeItemAtPath:[cache stringByAppendingPathComponent:fileName] error:nil];
//    }
//}

@end
