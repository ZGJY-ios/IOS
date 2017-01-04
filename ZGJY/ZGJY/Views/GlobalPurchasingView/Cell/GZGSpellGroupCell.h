//
//  SpellGroupCell.h
//  ZGJY
//
//  Created by HX on 16/9/27.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  拼团

#import <UIKit/UIKit.h>

@interface GZGSpellGroupCell : UITableViewCell

+ (instancetype)dequeueReusableCellWithIdentifier:(NSString *)reuseIdentifier withTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

- (void)setModel:(UIImage *)imagex;

@property (nonatomic, copy) void(^GZGSpellGroupCellBlock)(UIButton * button);

@end
