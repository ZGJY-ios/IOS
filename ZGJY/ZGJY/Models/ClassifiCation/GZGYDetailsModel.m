//
//  GZGYDetailsModel.m
//  ZGJY
//
//  Created by YYS on 2016/11/18.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsModel.h"

@implementation GZGYDetailsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
