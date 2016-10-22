//
//  GZGGPGlobalSelectCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGPGlobalSelectCell.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
static const NSInteger SmallBtnTag = 1000;
@interface GZGGPGlobalSelectCell()
@property(nonatomic, strong) UIButton *bigBtn;

@end

@implementation GZGGPGlobalSelectCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    
    return self;
}

- (void)buildUI{
    
    CGFloat ww = [GZGApplicationTool control_wide:415.0f],hh = [GZGApplicationTool control_height:400.0f];
    
    
    _bigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _bigBtn.frame = CGRectMake(0, 0, ww, hh);
    [_bigBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"sy_qqpic1.jpg"]];
    [_bigBtn addTarget:self action:@selector(bigBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bigBtn];
    
    NSArray *imageArr = @[@"sy_qqpic2.JPG",@"sy_qqpic3.jpg"];
    
    for (NSInteger i=0; i<imageArr.count; i++) {
        UIButton *smallBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        smallBtn.frame = CGRectMake(ww, 0+i*(hh/2), SCREENWIDTH - ww, hh/2);
        [smallBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:imageArr[i]]];
        smallBtn.tag = i+ SmallBtnTag;
        [smallBtn addTarget:self action:@selector(smallBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:smallBtn];
    }
}

- (void)bigBtnDown{
    [self.delegate gpGpobalSelectCellIndex:0];
}

- (void)smallBtnDown:(UIButton *)btn{
    [self.delegate gpGpobalSelectCellIndex:btn.tag - SmallBtnTag +1];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
