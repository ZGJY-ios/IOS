//
//  GZGSpecialPerformanceModel.m
//  ZGJY
//
//  Created by HX on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSpecialPerformanceModel.h"

@implementation GZGSpecialPerformanceModel

+ (instancetype)specialPerformanceWithDict:(NSDictionary *)dict {
    
    GZGSpecialPerformanceModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setNilValueForKey:(NSString *)key {
    
    if ([key isEqualToString:@"distance"]) {
        _weight = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
