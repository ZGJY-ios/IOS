//
//  GZGYEvaluationTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/23.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYEvaluationTableViewCell.h"
@implementation GZGYEvaluationTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.lineLabel];
        
        NSInteger num = 4;
        
        for (int i = 0; i<5; i++) {
            _starView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85]+i*[GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:100], [GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20])];
            if (i<num) {
                _starView.image = [UIImage imageNamed:@"hxiocn_2x67"];
            }else{
                _starView.image = [UIImage imageNamed:@"hxiocn_2x68"];
            }
            [self addSubview:self.starView];
        }
        [self addSubview:self.contentLabel];
        [self addSubview:self.praiseBtn];
        [self addSubview:self.numberLabel];
        [self addSubview:self.commentsBtn];
        [self addSubview:self.comnumberLabel];
    }
    return self;
}
-(UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:20], [GZGApplicationTool control_wide:55], [GZGApplicationTool control_height:55])];
        _iconView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
        _iconView.layer.cornerRadius = _iconView.frame.size.width/2;
        _iconView.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconView.layer.borderWidth = 0;
        [_iconView.layer setMasksToBounds:YES];
    }
    return _iconView;
}
-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:110], [GZGApplicationTool control_height:35])];
        _nameLabel.text = @"哈撒给";
    }
    return _nameLabel;
}
-(UILabel *)addressLabel
{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:230], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:100], [GZGApplicationTool control_height:35])];
        _addressLabel.text = @"北京";
    }
    return _addressLabel;
}
-(UILabel *)dateLabel
{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:480], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
        _dateLabel.text = @"2016-9-08";
        _dateLabel.font = [UIFont systemFontOfSize:14];
        _dateLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    }
    return _dateLabel;
}
-(UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:650], [GZGApplicationTool control_height:35], SCREENWIDTH-[GZGApplicationTool control_wide:650], [GZGApplicationTool control_height:35])];
        _timeLabel.text = @"12:35";
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    }
    return _timeLabel;
}
-(UILabel *)lineLabel
{
    if (_lineLabel == nil) {
        _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:85], SCREENWIDTH-[GZGApplicationTool control_wide:40], 2)];
        _lineLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    }
    return _lineLabel;
}
-(UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:85], [GZGApplicationTool control_height:140], [GZGApplicationTool control_wide:SCREENWIDTH-[GZGApplicationTool control_wide:85]], [GZGApplicationTool control_height:35])];
        _contentLabel.text = @"非常好用!";
    }
    return _contentLabel;
}
-(UIButton *)praiseBtn
{
    if (_praiseBtn == nil) {
        NSInteger praise = 1;
        
        _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _praiseBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        if (praise > 0) {
            [_praiseBtn setImage:[UIImage imageNamed:@"select-praise"] forState:UIControlStateNormal];
        }else{
            [_praiseBtn setImage:[UIImage imageNamed:@"no-praise"] forState:UIControlStateNormal];
        }

    }
    return _praiseBtn;
}
-(UILabel *)numberLabel
{
    if (_numberLabel == nil) {
        NSInteger praise = 1;
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:545], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:35])];
        _numberLabel.text = [NSString stringWithFormat:@"%ld",praise];
        if (praise>0) {
            _numberLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        }else{
            _numberLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        }

    }
    return _numberLabel;
}
-(UIButton *)commentsBtn
{
    if (_commentsBtn == nil) {
        NSInteger praise = 1;
        _commentsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentsBtn.frame = CGRectMake([GZGApplicationTool control_wide:610], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:30]);
        if (praise > 0) {
            [_commentsBtn setImage:[UIImage imageNamed:@"select-leave-word"] forState:UIControlStateNormal];
        }else{
            [_commentsBtn setImage:[UIImage imageNamed:@"no-leave-word"] forState:UIControlStateNormal];
        }
    }
    return _commentsBtn;
}
-(UILabel *)comnumberLabel
{
    if (_comnumberLabel == nil) {
        NSInteger praise = 1;
        _comnumberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:655], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:70], [GZGApplicationTool control_height:35])];
        _comnumberLabel.text = [NSString stringWithFormat:@"%ld",praise];
        if (praise>0) {
            _comnumberLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        }else{
            _comnumberLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        }
    }
    return _comnumberLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
