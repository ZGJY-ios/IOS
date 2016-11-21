//
//  GZGYLimitModel.m
//  ZGJY
//
//  Created by YYS on 2016/11/16.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLimitModel.h"

@implementation GZGYLimitModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
