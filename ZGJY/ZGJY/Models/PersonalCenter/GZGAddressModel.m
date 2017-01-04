//
//  GZGAddressModel.m
//  ZGJY
//
//  Created by HX on 2016/12/5.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGAddressModel.h"

@implementation GZGAddressModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    } 
}

+ (instancetype)specialPerformanceWithDict:(NSDictionary *)dict {
    
    GZGAddressModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

@end
