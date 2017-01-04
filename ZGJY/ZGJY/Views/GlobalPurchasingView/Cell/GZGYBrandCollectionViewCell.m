//
//  GZGYBrandCollectionViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYBrandCollectionViewCell.h"

@implementation GZGYBrandCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imgView];
        [self addSubview:self.nameLabel];
    }
    return self;
}
-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:110], self.frame.size.width, [GZGApplicationTool control_height:30])];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
    }
    return _nameLabel;
}
-(UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, [GZGApplicationTool control_height:100])];
        _imgView.image = [UIImage imageNamed:@"sy_hlpic2.jpg"];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 5.0;
        _imgView.layer.borderWidth = 1.0;
        _imgView.layer.borderColor = [[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0] CGColor];
    }
    return _imgView;
}
-(void)setModel:(GZGYBrandModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString;
        if([self.model.logo rangeOfString:[ZGNetWork mobileAPIBaseURL]].location != NSNotFound)
        {
            urlString = [self.model.logo stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        }
        else
        {
            NSString * logoString = [NSString stringWithFormat:@"%@%@",[ZGNetWork mobileAPIBaseURL],self.model.logo];
            urlString = [logoString stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        }
        [_imgView setHeader:urlString];
    });
    _nameLabel.text = [NSString stringWithFormat:@"%@",self.model.name];
}
@end
