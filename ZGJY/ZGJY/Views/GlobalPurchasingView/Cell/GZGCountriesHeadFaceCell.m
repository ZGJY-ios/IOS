//
//  GZGCountriesHeadFaceCell.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGCountriesHeadFaceCell.h"
#import "YDTopTitleRolling.h"
@interface GZGCountriesHeadFaceCell()<YDTopTitleRollingDelegate>

@end
@implementation GZGCountriesHeadFaceCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    NSArray *titleArr = @[@"面部护理",@"营养肌肤",@"洗发护发",@"彩妆修颜",@"我在测试",@"我还测试",@"123",@"真特么不知道写什么了"];

    
    YDTopTitleRolling *ydView = [[YDTopTitleRolling alloc] initWithFrame:
                                 CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:94])
                                                           topTitleArray:titleArr
                                                             selectColor:[GZGColorClass subjectCountriesHeadFaceSelectTitleColor]
                                                            defauleColor:[GZGColorClass subjectCountriesHeadFaceCancleSelectTitleColor]
                                                               titleFont:[UIFont systemFontOfSize:13]
                                                            titleSpacing:10.0f
                                                               lineWidth:2.0f
                                 ];
    ydView.delegate = self;
    
    [self addSubview:ydView];
    
}

- (void)titleRollingIndex:(NSInteger)index{
    NSLog(@"点了第%ld文字",index);
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
