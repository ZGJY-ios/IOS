//
//  GZGYImgScrollView.h
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImgDelegeteClickProtocol <NSObject>

- (void)ImgDelegeteClick:(id)sender;

@end
@interface GZGYImgScrollView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)id <ImgDelegeteClickProtocol>delegete;
@property(nonatomic, retain)UIScrollView *scro;
@property(nonatomic, retain)UIPageControl *pageControl;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
@end
