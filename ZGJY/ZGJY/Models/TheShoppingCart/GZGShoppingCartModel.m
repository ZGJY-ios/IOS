//
//  GZGShoppingCartModel.m
//  ZGJY
//
//  Created by HX on 2016/12/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGShoppingCartModel.h"

@implementation GZGShoppingCartModel

@end

@implementation GZGCartModel
+ (instancetype)cartWithDict:(NSDictionary *)dict {
    
    GZGCartModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}
@end

@implementation GZGOrderModel

+ (instancetype)orderWithDict:(NSDictionary *)dict {
    
    GZGOrderModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

@end

@implementation GZGCourierModel

+ (instancetype)courierWithDict:(NSDictionary *)dict {
    GZGCourierModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}

@end

@implementation GZGPayModel

+ (instancetype)payWithDict:(NSDictionary *)dict {
    GZGPayModel * model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.ids = value;
    }
}

@end
