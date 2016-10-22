//
//  GZGGPMaternalInfantCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/29.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGPMaternalInfantCell.h"
#import "GZGUpImageDownTitleBtn.h"
#import "UIButton+WebCache.h"

static const NSInteger MaternalBtnTag = 1000;


@implementation GZGGPMaternalInfantCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    NSArray *imageMeternallImageArr = @[@"sy_mypic6.jpg",
                                        @"sy_mypic5.jpg",
                                        @"sy_mypic4.jpg",
                                        @"sy_mypic3.jpg",
                                        @"sy_mypic2.jpg",
                                        @"sy_mypic5.jpg"];
    
    NSArray *titleMaternaallTitleArraay = @[NSLocalizedString(@"a2", nil),
                                            NSLocalizedString(@"all", nil),
                                            NSLocalizedString(@"奶粉", nil),
                                            NSLocalizedString(@"xx", nil),
                                            NSLocalizedString(@"44", nil),
                                            NSLocalizedString(@"55", nil)];
    
    
    
//    CGFloat ww = SCREENWIDTH/3,hh = [GZGApplicationTool control_height:305];
    CGFloat ww = [GZGApplicationTool control_wide:132.0f],hh = [GZGApplicationTool control_height:176.0f];
//    CGFloat titleWidh = [GZGApplicationTool control_wide:41];
    CGFloat xx = SCREENWIDTH,yy = [GZGApplicationTool control_height:305];
    
    
    for (NSInteger i=0; i<imageMeternallImageArr.count; i++) {
        CGFloat xxx = 0 + i%3*(xx/3),yyy = 0 + i/3*yy;
        GZGUpImageDownTitleBtn *maternalBtn = [[GZGUpImageDownTitleBtn alloc] initWithFrame:CGRectMake(xxx, yyy, xx/3, yy)];
        maternalBtn.widhSize = ww;
        maternalBtn.heightSize = hh;
        [maternalBtn setTitle:titleMaternaallTitleArraay[i] forState:UIControlStateNormal];
        maternalBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        [maternalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [maternalBtn sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:imageMeternallImageArr[i]]];
        maternalBtn.tag = i+ MaternalBtnTag;
        [maternalBtn addTarget:self action:@selector(maternalBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:maternalBtn];
    }
    
    for (NSInteger i=0; i<2; i++) {
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(xx/3+i*(xx/3),  [GZGApplicationTool control_height:60], 0.5, yy*2 - [GZGApplicationTool control_height:60*2])];
        viewLine.backgroundColor = [UIColor grayColor];
        [self addSubview:viewLine];
    }
    
    for (NSInteger i=0; i<1; i++) {
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0,  yy+i *yy, SCREENWIDTH, 0.5)];
        viewLine.backgroundColor = [UIColor grayColor];
        [self addSubview:viewLine];
    }
    
    UIButton *moreBtn = [UIButton   buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake((SCREENWIDTH - [GZGApplicationTool control_wide:160])/2, yy * 2 + [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:160], [GZGApplicationTool control_height:50]);
    [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreBtn setTitle:NSLocalizedString(@"GZGGPMaternalInfant_CCGDSP", nil) forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
    [moreBtn addTarget:self action:@selector(moreBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    
    
}
- (void)moreBtnDown{
    [self.delegate maternalBtnIndex:GZGGPMaternalInfantCellIndex_CCGDSP];//99为TagID 便于判断
}

- (void)maternalBtnDown:(UIButton *)btn{
    [self.delegate maternalBtnIndex:btn.tag - MaternalBtnTag];
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
