//
//  GZGGPClassifiCationCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGPClassifiCationCell.h"
#import "GZGUpImageDownTitleBtn.h"

static const NSInteger classifiCationBtnTag = 1000;

@implementation GZGGPClassifiCationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    NSArray *btnTitle = @[NSLocalizedString(@"GZGGPClassifiCationCell_QQJX", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_XSTM", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_HLPT", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_KJZY", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_HGG", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_RBG", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_ADLYG", nil),
                          NSLocalizedString(@"GZGGPClassifiCationCell_OZG", nil)];
    NSArray *btnImage = @[@"QQG_QQJX",
                          @"QQG_XSTM",
                          @"QQG_HLPT",
                          @"QQG_KJZY",
                          @"QQG_G_HGG",
                          @"QQG_G_RBG",
                          @"QQG_G_QDLYG",
                          @"QQG_OZG"];

    
    CGFloat ww = [GZGApplicationTool control_wide:71+41+16], hh = [GZGApplicationTool control_wide:71+41+16];
    CGFloat xx = SCREENWIDTH, yy = [GZGApplicationTool control_height:300];

    for (NSInteger i = 0 ; i<btnTitle.count; i++) {
        CGFloat xxx = (xx/4 - ww)/2 + i%4*(xx/4),yyy = (yy/2 - hh)/2 + i/4 * (yy/2);
        GZGUpImageDownTitleBtn *cakssufuCationBtn = [[GZGUpImageDownTitleBtn alloc] initWithFrame:CGRectMake(xxx, yyy, ww, hh)];
        cakssufuCationBtn.widhSize = [GZGApplicationTool control_wide:71.0f];
        cakssufuCationBtn.heightSize = [GZGApplicationTool control_wide:71.0f];
        [cakssufuCationBtn setImage:[UIImage imageNamed:btnImage[i]] forState:UIControlStateNormal];
        [cakssufuCationBtn setTitle:btnTitle[i] forState:UIControlStateNormal];
        cakssufuCationBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        [cakssufuCationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cakssufuCationBtn.tag = classifiCationBtnTag + i;
        [cakssufuCationBtn addTarget:self action:@selector(cakssufuCationBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cakssufuCationBtn];

    }
}
- (void)cakssufuCationBtnDown:(UIButton *)btn{
    [self.delegate classifiCationBtnIndex:btn.tag - classifiCationBtnTag];
}

#pragma mark delegate

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
