//
//  GZGYsecondClassification.m
//  ZGJY
//
//  Created by YYS on 2016/12/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYsecondClassification.h"

@implementation GZGYsecondClassification
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.classID = value;
    }
}
@end
