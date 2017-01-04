//
//  GZGShoppingCartReusableView.m
//  ZGJY
//
//  Created by HX on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGShoppingCartReusableView.h"

@interface GZGShoppingCartReusableView ()
@property (nonatomic, strong) UIButton * hotRecommendedButton;
@end

@implementation GZGShoppingCartReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _hotRecommendedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hotRecommendedButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [_hotRecommendedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.hotRecommendedButton];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    [_hotRecommendedButton setTitle:NSLocalizedString(title, nil) forState:UIControlStateNormal];
}
- (void)setImage:(UIImage *)image {
    [_hotRecommendedButton setImage:image forState:UIControlStateNormal];
}

@end
