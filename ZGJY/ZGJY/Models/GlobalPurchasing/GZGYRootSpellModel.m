//
//  GZGYRootSpellModel.m
//  ZGJY
//
//  Created by YYS on 2016/11/17.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYRootSpellModel.h"

@implementation GZGYRootSpellModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end