//
//  GZGYEvaluationTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYEvaluationTableViewCell.h"

@implementation GZGYEvaluationTableViewCell
@synthesize iconView,nameLabel,addressLabel,dateLabel,timeLabel,lineLabel,starView,contentLabel,praiseBtn,numberLabel,commentsBtn,comnumberLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55])];
        iconView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        iconView.layer.cornerRadius = iconView.frame.size.width/2;
        iconView.layer.borderColor = [UIColor whiteColor].CGColor;
        iconView.layer.borderWidth = 0;
        [iconView.layer setMasksToBounds:YES];
        [self addSubview:iconView];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:35])];
        nameLabel.text = @"哈撒给";
        [self addSubview:nameLabel];
        addressLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:230], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35])];
        addressLabel.text = @"北京";
        [self addSubview:addressLabel];
        dateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:480], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
        dateLabel.text = @"2016-9-08";
        dateLabel.font = [UIFont systemFontOfSize:14];
        dateLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:dateLabel];
        timeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:650], [GZGApplicationTool control_height:35], SCREENWIDTH-[GZGApplicationTool control_wide:650], [GZGApplicationTool control_height:35])];
        timeLabel.text = @"12:35";
        timeLabel.font = [UIFont systemFontOfSize:14];
        timeLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [self addSubview:timeLabel];
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:85], SCREENWIDTH-[GZGApplicationTool control_wide:40], 2)];
        lineLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [self addSubview:lineLabel];
        
        NSInteger num = 4;
        
        for (int i = 0; i<5; i++) {
            starView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85]+i*[GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:100], [GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20])];
            if (i<num) {
                starView.image = [UIImage imageNamed:@"hxiocn_2x67"];
            }else{
                starView.image = [UIImage imageNamed:@"hxiocn_2x68"];
            }
            [self addSubview:starView];
        }
        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85], [GZGApplicationTool control_height:140], [GZGApplicationTool control_wide:SCREENWIDTH-[GZGApplicationTool control_wide:85]], [GZGApplicationTool control_height:35])];
        contentLabel.text = @"非常好用!";
        [self addSubview:contentLabel];
        
        NSInteger praise = 1;
        
        praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        praiseBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        if (praise > 0) {
            [praiseBtn setImage:[UIImage imageNamed:@"select-praise"] forState:UIControlStateNormal];
        }else{
            [praiseBtn setImage:[UIImage imageNamed:@"no-praise"] forState:UIControlStateNormal];
        }
        [self addSubview:praiseBtn];
        numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:545], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:35])];
        numberLabel.text = [NSString stringWithFormat:@"%ld",praise];
        if (praise>0) {
            numberLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        }else{
            numberLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        }
        [self addSubview:numberLabel];
        
        commentsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        commentsBtn.frame = CGRectMake([GZGApplicationTool control_wide:610], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        if (praise > 0) {
            [commentsBtn setImage:[UIImage imageNamed:@"select-leave-word"] forState:UIControlStateNormal];
        }else{
            [commentsBtn setImage:[UIImage imageNamed:@"no-leave-word"] forState:UIControlStateNormal];
        }
        [self addSubview:commentsBtn];
        comnumberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:655], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:35])];
        comnumberLabel.text = [NSString stringWithFormat:@"%ld",praise];
        if (praise>0) {
            comnumberLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        }else{
            comnumberLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        }
        [self addSubview:comnumberLabel];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
