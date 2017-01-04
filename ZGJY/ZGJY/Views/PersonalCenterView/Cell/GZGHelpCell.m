//
//  GZGHelpCell.m
//  ZGJY
//
//  Created by HX on 2016/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGHelpCell.h"

@implementation GZGFeedbackTypeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _problemTypeLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:34], [GZGApplicationTool control_wide:454], [GZGApplicationTool control_height:38]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:32]];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
        [self.contentView addSubview:self.problemTypeLabel];
    }
    return self;
}

- (void)setProblems:(NSArray *)problems {
    
    _problems = problems;
    
    NSInteger o = 0;
    NSInteger p = 0;
    for (NSInteger i = 0; i < _problems.count; i++) {
        
        if (o / 3 > 0) {
            p++;
            o = 0;
        }
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"PersonalCenterHelpNormal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"PersonalCenterHelpSelected"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitle:NSLocalizedString(_problems[i], nil) forState:UIControlStateNormal];
        btn.frame = CGRectMake([GZGApplicationTool control_wide:42] +[GZGApplicationTool control_wide:230] * o, [GZGApplicationTool control_height:115] + [GZGApplicationTool control_height:90] * p, [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
        btn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:25]];
        btn.tag = i + 10;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        o++;
        [self.contentView addSubview:btn];
    }
}
- (void)buttonClick:(UIButton *)btn {
    for (NSInteger i = 0; i < self.problems.count; i++) {
        UIButton * btn = [self.contentView viewWithTag:i + 10];
        btn.selected = NO;
    }
    btn.selected = YES;
    if (self.returnProblemType) {
        self.returnProblemType(btn.titleLabel.text);
    }
}

@end

@implementation GZGAdviceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _adviceImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake([GZGApplicationTool control_wide:21], [GZGApplicationTool control_height:26], [GZGApplicationTool control_height:37], [GZGApplicationTool control_height:37]);
            imageView.image = [UIImage imageNamed:@"PersonalCenterHelpPen"];
            imageView;
        });
        
        _textView = ({
            UITextView * textView = [[UITextView alloc] init];
            textView.frame = CGRectMake([GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:23], [GZGApplicationTool control_wide:631], [GZGApplicationTool control_height:156]);
            textView.text = NSLocalizedString(@"请编辑您的意见，我们将及时改进！", nil);
            textView.textColor = [UIColor lightGrayColor];
            textView.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
            textView.returnKeyType = UIReturnKeyDone;
            textView.delegate = self;
            textView;
        });
        
        [self.contentView addSubview:self.adviceImageView];
        [self.contentView addSubview:self.textView];
    }
    return self;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        if (self.returnOpinion) {
            self.returnOpinion(textView.text);
        }
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:@""]) {
        textView.text = NSLocalizedString(@"请编辑您的意见，我们将及时改进", nil);
        textView.textColor = [UIColor lightGrayColor];
    }
    return YES;
}

@end
