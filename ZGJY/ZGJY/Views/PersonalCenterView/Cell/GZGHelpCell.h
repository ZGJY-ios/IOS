//
//  GZGHelpCell.h
//  ZGJY
//
//  Created by HX on 2016/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  帮助与反馈

#import <UIKit/UIKit.h>

@interface GZGFeedbackTypeCell : UITableViewCell
@property (nonatomic, strong) UILabel * problemTypeLabel; // 问题类型
@property (nonatomic, strong) NSArray * problems;
@property (nonatomic, copy) void(^returnProblemType)(NSString * problemType);
@end

@interface GZGAdviceCell : UITableViewCell <UITextViewDelegate>
@property (nonatomic, strong) UIImageView * adviceImageView;
@property (nonatomic, strong) UITextView * textView; // 编辑建议
@property (nonatomic, copy) void(^returnOpinion)(NSString * opinion);
@end
