//
//  GZGYoneClassification.m
//  ZGJY
//
//  Created by YYS on 2016/12/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYoneClassification.h"

@implementation GZGYoneClassification
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
