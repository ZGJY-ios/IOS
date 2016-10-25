//
//  GZGDropDownMenu.h
//  ZGJY
//
//  Created by HX on 16/10/20.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZGIndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
// 0 左边   1 右边
@property (nonatomic, assign) NSInteger leftOrRight;
// 左边行
@property (nonatomic, assign) NSInteger leftRow;
// 右边行
@property (nonatomic, assign) NSInteger row;

- (instancetype)initWithColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;
+ (instancetype)indexPathWithCol:(NSInteger)col leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;

@end

#pragma mark - data source protocol
@class GZGDropDownMenu;
@protocol GZGDropDownMenuDataSource <NSObject>

@required
- (NSInteger)menu:(GZGDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow;
- (NSString *)menu:(GZGDropDownMenu *)menu titleForRowAtIndexPath:(GZGIndexPath *)indexPath;
- (NSString *)menu:(GZGDropDownMenu *)menu titleForColumn:(NSInteger)column;
/**
 * 表视图显示时，左边表显示比例
 */
- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column;
/**
 * 表视图显示时，是否需要两个表显示
 */
- (BOOL)haveRightTableViewInColumn:(NSInteger)column;

/**
 * 返回当前菜单左边表选中行
 */
- (NSInteger)currentLeftSelectedRow:(NSInteger)column;

@optional
//default value is 1
- (NSInteger)numberOfColumnsInMenu:(GZGDropDownMenu *)menu;

/**
 * 是否需要显示为UICollectionView 默认为否
 */
- (BOOL)displayByCollectionViewInColumn:(NSInteger)column;

@end

#pragma mark - delegate
@protocol GZGDropDownMenuDelegate <NSObject>
@optional
- (void)menu:(GZGDropDownMenu *)menu didSelectRowAtIndexPath:(GZGIndexPath *)indexPath;
@end

@interface GZGDropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) id <GZGDropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <GZGDropDownMenuDelegate> delegate;

@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIColor *textNormalColor;
@property (nonatomic, strong) UIColor *textSelectedColor;
@property (nonatomic, strong) UIColor *separatorColor;
/**
 *  the width of menu will be set to screen width defaultly
 *
 *  @param origin the origin of this view's frame
 *  @param height menu's height
 *
 *  @return menu
 */
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
- (NSString *)titleForRowAtIndexPath:(GZGIndexPath *)indexPath;
@end
