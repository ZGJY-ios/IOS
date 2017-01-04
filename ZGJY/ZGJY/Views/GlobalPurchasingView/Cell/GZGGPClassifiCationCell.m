//
//  GZGGPClassifiCationCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/28.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGGPClassifiCationCell.h"
#import "GZGUpImageDownTitleBtn.h"
#import "UIButton+WebCache.h"

@interface GZGGPClassifiCationCell ()
@property(nonatomic,strong)NSMutableArray *arrerImage;
@end


static const NSInteger classifiCationBtnTag = 1000;

@implementation GZGGPClassifiCationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _arrerImage = [NSMutableArray  array];
        
        
        
        NSArray *btnImage = @[@"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG",
                              @"GZG_Placeholder_Square_IMG"];
        
        
        
        [_arrerImage addObjectsFromArray:btnImage];
        
        
        NSLog(@"%@",_arrerImage);
        
        
        
        [self buildUI:_arrerImage titleArr:nil];
    }
    return self;
}
- (void)buildUI:(NSArray *)imgarray titleArr:(NSArray *)titleArr{

    
    CGFloat ww = [GZGApplicationTool control_wide:71+41+16], hh = [GZGApplicationTool control_wide:71+41+16];
    CGFloat xx = SCREENWIDTH, yy = [GZGApplicationTool control_height:300];
    
    for (NSInteger i = 0 ; i<imgarray.count; i++) {
        CGFloat xxx = (xx/4 - ww)/2 + i%4*(xx/4),yyy = (yy/2 - hh)/2 + i/4 * (yy/2);
        GZGUpImageDownTitleBtn *cakssufuCationBtn = [[GZGUpImageDownTitleBtn alloc] initWithFrame:CGRectMake(xxx, yyy, ww, hh)];
        cakssufuCationBtn.widhSize = [GZGApplicationTool control_wide:71.0f];
        cakssufuCationBtn.heightSize = [GZGApplicationTool control_wide:71.0f];
        [cakssufuCationBtn sd_setImageWithURL:[NSURL URLWithString:imgarray[i]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"GZG_Placeholder_Square_IMG"]];
        
        if (titleArr.count==0) {
            [cakssufuCationBtn setTitle:@"" forState:UIControlStateNormal];
        }else{
            [cakssufuCationBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        }
        cakssufuCationBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:20]];
        [cakssufuCationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cakssufuCationBtn.tag = classifiCationBtnTag + i;
        [cakssufuCationBtn addTarget:self action:@selector(cakssufuCationBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cakssufuCationBtn];
    }
    
}

- (void)loadData:(NSArray *)array{
    
    //    [self remove];
    
    NSArray *subviews = [[NSArray alloc] initWithArray:self.subviews];
    for(UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    
    
    NSMutableArray *arrImg = [NSMutableArray array];
    NSMutableArray *arrtitle = [NSMutableArray array];
    for (NSInteger i=0; i<array.count; i++) {
        [arrImg addObject:[array[i] objectForKey:@"icon"]];
        [arrtitle addObject:[array[i] objectForKey:@"name"]];
    }
    
    if (array.count==0) {
        [self buildUI:_arrerImage titleArr:nil];
    }else{
        [self buildUI:arrImg titleArr:arrtitle];
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
