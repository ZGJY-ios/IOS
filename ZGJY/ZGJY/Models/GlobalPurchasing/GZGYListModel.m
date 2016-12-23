//
//  GZGYListModel.m
//  ZGJY
//
//  Created by YYS on 2016/12/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYListModel.h"

@implementation GZGYListModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
