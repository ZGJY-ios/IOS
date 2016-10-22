//
//  GZGCrossBorderDirectMailCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/10/8.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCrossBorderDirectMailCell.h"
#import "GZGUpImageDownTitleBtn.h"
#import "UIButton+WebCache.h"

NSInteger const CrossBorsBtnTag = 1000;

@implementation GZGCrossBorderDirectMailCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    
    NSArray *titleArr = @[NSLocalizedString(@"盛天屋 豆腐面膜 150g 美白保湿", nil),
                          NSLocalizedString(@"KAO 花王 蒸汽发热眼膜", nil),
                          NSLocalizedString(@"盛田屋 豆腐面膜", nil),
                          NSLocalizedString(@"擦。面膜好多", nil)];
    NSArray *imageArr = @[@"sy_kjpic1.jpg",@"sy_kjpic2.jpg",@"sy_kjpic3.jpg",@"sy_kjpic2.jpg"];
    
    
    CGFloat titleWidh = [GZGApplicationTool control_wide:41];
    CGFloat ww = [GZGApplicationTool control_wide:158.0f],hh = [GZGApplicationTool control_height:183.0f];
    CGFloat xx = SCREENWIDTH,yy = [GZGApplicationTool control_height:550.0f];
    
    
    for (NSInteger i=0; i<imageArr.count; i++) {
        CGFloat xxx = 0 + i%2*(xx/2),yyy = 0 + i/2*(yy/2);
        GZGUpImageDownTitleBtn *crossBorsBtn = [[GZGUpImageDownTitleBtn alloc] initWithFrame:CGRectMake(xxx, yyy, xx/2, yy/2)];
        crossBorsBtn.widhSize = ww;
        crossBorsBtn.heightSize = hh;
//        crossBorsBtn.backgroundColor = [UIColor  redColor];
        [crossBorsBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        crossBorsBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        [crossBorsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [crossBorsBtn sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:imageArr[i]]];
        crossBorsBtn.tag = i+ CrossBorsBtnTag;
        [crossBorsBtn addTarget:self action:@selector(crossBorsBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:crossBorsBtn];
        
        if (i == 0) {
            crossBorsBtn.backgroundColor = [GZGColorClass subjectGlobaCrossBorsOne];
        }else if (i == 1){
            crossBorsBtn.backgroundColor = [GZGColorClass subjectGlobaCrossBorsTow];
        }else if (i == 2){
            crossBorsBtn.backgroundColor = [GZGColorClass subjectGlobaCrossBorsFore];
        }else if (i == 3){
            crossBorsBtn.backgroundColor = [GZGColorClass subjectGlobaCrossBorsThree];
        }
    }
}
- (void)crossBorsBtnDown:(UIButton *)btn{
    [self.delegate crossBorderIndex:btn.tag - CrossBorsBtnTag];
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
