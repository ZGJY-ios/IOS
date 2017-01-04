//
//  GZGLogisticsCell.m
//  ZGJY
//
//  Created by HX on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGLogisticsCell.h"

@implementation GZGLogisticsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _verticalLineTopView = ({
            UIView * view = [[UIView alloc] init];
            view.backgroundColor = [UIColor grayColor];
            view;
        });
        _verticalLineBottomView = ({
            UIView * view = [[UIView alloc] init];
            view.backgroundColor = [UIColor grayColor];
            view;
        });
        _timeImageView = ({
            int dotViewRadius = 5;
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, dotViewRadius * 2, dotViewRadius * 2)];
            imageView.backgroundColor = [GZGColorClass subjectShoppingCartPriceColor];
            imageView.layer.cornerRadius = dotViewRadius;
            imageView;
        });
        _titleLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:0], [GZGApplicationTool control_wide:533], [GZGApplicationTool control_height:47]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:29]];
            label.numberOfLines = 0;
            label;
        });
        _timeLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.frame = CGRectMake([GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:103], [GZGApplicationTool control_wide:533], [GZGApplicationTool control_height:20]);
            label.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:18]];
            label;
        });
        [self.contentView addSubview:self.verticalLineTopView];
        [self.contentView addSubview:self.verticalLineBottomView];
        [self.contentView addSubview:self.timeImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}
- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    self.timeImageView.center = CGPointMake([GZGApplicationTool control_wide:20], frame.size.height / 2);
    CGFloat cutHeight = self.timeImageView.frame.size.height/2.0 - 2;
    self.verticalLineTopView.frame = CGRectMake([GZGApplicationTool control_wide:20] - [GZGApplicationTool control_wide:1], 0, [GZGApplicationTool control_wide:2], self.timeImageView.center.y - cutHeight);
    self.verticalLineBottomView.frame = CGRectMake([GZGApplicationTool control_wide:20] - [GZGApplicationTool control_wide:1], self.timeImageView.center.y + cutHeight, [GZGApplicationTool control_wide:2], frame.size.height - (self.timeImageView.center.y + cutHeight));
}
- (void)setTitle:(NSString *)string {
    
    self.titleLabel.frame = CGRectMake([GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:20], [GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:60], [GZGLogisticsCell cellHeightWithString:string isContentHeight:YES]);
    self.titleLabel.text = string;
    
    CGRect rect = self.timeLabel.frame;
    rect.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + [GZGApplicationTool control_height:2];
    self.timeLabel.frame = rect;
}
+ (CGFloat)cellHeightWithString:(NSString *)string isContentHeight:(BOOL)isBool {
    
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:[GZGApplicationTool control_height:29]]};
    CGFloat height = [string boundingRectWithSize:CGSizeMake([GZGApplicationTool screenWide] - [GZGApplicationTool control_wide:60], 100) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.height;
    return (isBool ? height : (height + [GZGApplicationTool control_height:60])) + [GZGApplicationTool control_height:30];
}

@end
