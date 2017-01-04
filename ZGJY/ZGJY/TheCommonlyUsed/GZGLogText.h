//
//  GZGLogText.h
//  ZGJY
//
//  Created by 刘亚栋 on 2016/11/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#ifndef GZGLogText_h
#define GZGLogText_h

// 日志输出
#ifdef DEBUG // 开发阶段-DEBUG阶段:使用Log
#define GZGLog(...) NSLog(__VA_ARGS__)
#else // 发布阶段-上线阶段:移除Log
#define GZGLog(...)
#endif
// 方法输出
#define XMGLogFunc GZGLog(@"%s", __func__);

#define kAPPDELEGATE ((AppDelegate*)[UIApplication sharedApplication].delegate)

#define kDEFAULTNOTIFICATION   [NSNotificationCenter defaultCenter]

#endif /* GZGLogText_h */
