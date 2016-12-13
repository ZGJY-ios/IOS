//
//  TheShoppingCartViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGTheShoppingCartViewController.h"
#import "GZGConfirmOrderViewController.h"
#import "GZGYDetailsViewController.h"
#import "GZGShoppingCartCell.h"
#import "GZGShoppingCartReusableView.h"
#import "GZGShoppingCartSettlementView.h"
#import "GZGHotRecommendedCell.h"
#import "ZGNetWork.h"
#import "GZGYLoginViewController.h"
#import "GZGSpecialPerformanceModel.h"

@interface UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end

@implementation UIImage (PersonalCenter)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end

@interface GZGTheShoppingCartViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSString * blockId;
}
@property (nonatomic, strong) UIButton * editorBtn; // 编辑按钮
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, assign) CGFloat collectionViewHeight;
@property (nonatomic, strong) GZGShoppingCartSettlementView * settlementView;
@property (nonatomic, strong) NSMutableArray * mutables;
@property (nonatomic) BOOL isFutureGenerations; // 是否全选
@end

@implementation GZGTheShoppingCartViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self requestData];
}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    [self requestData];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles.text = NSLocalizedString(@"购物车", nil);
    self.isFutureGenerations = NO;
    [self.leftBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.rightBtn setImage:[[UIImage imageNamed:@"TheShoppingCartPushMessage"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    _editorBtn = ({
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.rightBtn.frame.origin.x - [GZGApplicationTool control_wide:110], self.rightBtn.frame.origin.y, [GZGApplicationTool control_wide:90], self.rightBtn.frame.size.height);
        [btn setTitle:NSLocalizedString(@"编辑", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:33]];
        [btn addTarget:self action:@selector(editorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.navBarView addSubview:self.editorBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navBarView.frame.size.height, [GZGApplicationTool screenWide], [GZGApplicationTool screenHeight] - self.navBarView.frame.size.height - self.tabBarController.tabBar.frame.size.height - [GZGApplicationTool control_height:100]) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionFooterHeight = [GZGApplicationTool control_height:20];
    [self.view addSubview:self.tableView];
    
    [self addHeaderView];
    
    self.settlementView = [[GZGShoppingCartSettlementView alloc] initWithOriginY:[GZGApplicationTool screenHeight] - self.tabBarController.tabBar.frame.size.height - [GZGApplicationTool control_height:100] Height:100];
    self.settlementView.backgroundColor = [UIColor whiteColor];
    __weak GZGTheShoppingCartViewController * weak = self;
    [self.settlementView setButtonClick:^(UIButton * btn) {
        switch (btn.tag) {
            case 0: {
                btn.selected = !btn.isSelected;
//                for (GZGShoppingCartCell * cell in [weak tableViewCells]) {
//                    cell.cartRedio.selected = btn.isSelected;
//                }
                weak.isFutureGenerations = btn.isSelected;
                if (btn.isSelected) {
                    weak.settlementView.combinedPriceTitle.text = [NSString stringWithFormat:@"%.2f",[weak calculateTotalPrice]];
                } else {
                    weak.settlementView.combinedPriceTitle.text = [NSString stringWithFormat:@"0.00"];
                }
                [weak.tableView reloadData];
            }
                break;
            case 1: {
                GZGConfirmOrderViewController * confirmOrderVC = [[GZGConfirmOrderViewController alloc] init];
                confirmOrderVC.totalPrice = weak.settlementView.combinedPriceTitle.text.floatValue;
                confirmOrderVC.hidesBottomBarWhenPushed = YES;
                [weak.navigationController pushViewController:confirmOrderVC animated:YES];
            }
                break;
        }
    }];
    [self.view addSubview:self.settlementView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData {
    
    if (!_mutables) {
        _mutables = [NSMutableArray array];
    } else {
        [_mutables removeAllObjects];
    }
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userID = [userDefaults objectForKey:@"USERID"];
    if (userID != nil) {
        NSDictionary * dict = @{@"memberId":userID};
        [[GZGYAPIHelper shareAPIHelper] cartListURL:@"appCart/list" dict:dict finished:^(NSArray *goods) {
            NSLog(@"购物车列表:%@",goods);
            
            for (int i = 0; i < goods.count; i++) {
                NSDictionary * dic = goods[i];
                GZGSpecialPerformanceModel * model = [GZGSpecialPerformanceModel specialPerformanceWithDict:dic];
                [_mutables addObject:model];
            }
            [_tableView reloadData];
        } failed:^(NSError *error) {
            NSLog(@"购物车列表失败:%@",error);
        }];
    } else {
        if ([blockId isEqualToString:@"1"]) {
            NSInteger tabbarId = [[[NSUserDefaults standardUserDefaults]objectForKey:@"TABBARID"] integerValue];
            self.tabBarController.selectedIndex = tabbarId;
        }else{
            GZGYLoginViewController * logisticsVC = [[GZGYLoginViewController alloc] init];
            logisticsVC.TbabarLogin = ^(NSString * backId){
                blockId = backId;
            };
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:logisticsVC];
            [self presentViewController:nav animated:YES completion:nil];
        }
        blockId = @"";
    }
}
// 添加购物车
- (void)requestDataWithAddCartID:(NSString *)shopID number:(NSString *)number {
    
    NSDictionary * dict = @{@"id":shopID,@"quantity":number};
    [[GZGYAPIHelper shareAPIHelper] addToCartURL:@"appCart/add" Dict:dict Finished:^(NSArray *carts) {
        // 添加成功 刷新购物车列表
        [self requestData];
    } failed:^(NSError *error) {
        NSLog(@"添加失败");
    }];
}
// 删除购物车
- (void)requestDataWithDeleteCartID:(NSString *)shopID number:(NSString *)number {
    
//    NSDictionary * dict = @{@"id":shopID,@"quantity":number};
    NSDictionary * dict = @{@"id":shopID};
    [[GZGYAPIHelper shareAPIHelper] deleteToCartURL:@"appCart/delete" Dict:dict Finished:^(NSArray *carts) {
        // 删除成功 刷新购物车列表
        [self requestData];
    } failed:^(NSError *error) {
        GZGLog(@"删除失败");
    }];
}
#pragma mark - 自己的方法
- (void)rightBtnDown{
    NSLog(@"信息");
}
- (void)editorBtnClick:(UIButton *)btn {
    
    // 修改editing属性的值，进入或退出编辑模式
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) {
        [btn setTitle:NSLocalizedString(@"完成", nil) forState:UIControlStateNormal];
        NSLog(@"编辑");
    } else {
        [btn setTitle:NSLocalizedString(@"编辑", nil) forState:UIControlStateNormal];
        NSLog(@"完成");
    }
}
- (UIView *)addHeaderView {
    
    if (self.collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake([GZGApplicationTool control_wide:355], [GZGApplicationTool control_height:477]);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:20], [GZGApplicationTool screenWide], [GZGApplicationTool control_height:100]) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
            _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[GZGShoppingCartReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionView registerClass:[GZGShoppingCartReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [_collectionView registerClass:[GZGHotRecommendedCell class] forCellWithReuseIdentifier:@"HotRecommendedCell"];
        _collectionViewHeight = _collectionView.frame.size.height;
    }
    
    return _collectionView;
}
// 获取所有cell
- (NSArray *)tableViewCells {
    
    NSMutableArray * cells = [NSMutableArray arrayWithCapacity:_mutables.count];
    for (NSInteger i = 0; i < _mutables.count; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        GZGShoppingCartCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [cells addObject:cell];
    }
    return cells;
}
// 合计购物车总价格
- (CGFloat)calculateTotalPrice {
    
    CGFloat totalPrice = 0;
    
    for (NSInteger i = 0; i < _mutables.count; i++) {
        GZGSpecialPerformanceModel * model = _mutables[i];
        totalPrice += model.price*model.quantity;
    }
    return totalPrice;
}
#pragma mark - 系统的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GZGApplicationTool control_height:230];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _mutables.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"CartCell";
    GZGShoppingCartCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GZGShoppingCartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    GZGSpecialPerformanceModel * model = _mutables[indexPath.row];
    
    __weak GZGTheShoppingCartViewController * weakSelf = self;
    __weak GZGShoppingCartCell * weakCell = cell;
    void (^calculateTotalPrice)(GZGSpecialPerformanceModel*) = ^(GZGSpecialPerformanceModel * model){
        CGFloat totalPrice = [weakSelf.settlementView.combinedPriceTitle.text floatValue] + (weakCell.cartRedio.isSelected ? (model.price * weakCell.cartNumber.text.integerValue) : (- model.price * weakCell.cartNumber.text.integerValue));
        weakSelf.settlementView.combinedPriceTitle.text = [NSString stringWithFormat:@"%.2f",totalPrice];
    };
    void (^calculateNumberPrice)(GZGSpecialPerformanceModel*,BOOL, BOOL) = ^(GZGSpecialPerformanceModel * model, BOOL addOrSub, BOOL isSelected) {
        
        CGFloat totalPrice;
        if (isSelected) {
            totalPrice = [weakSelf.settlementView.combinedPriceTitle.text floatValue] + (addOrSub ? model.price : - model.price);
        } else {
            totalPrice = [weakSelf.settlementView.combinedPriceTitle.text floatValue] + model.price * cell.cartNumber.text.integerValue;
        }
        
        weakSelf.settlementView.combinedPriceTitle.text = [NSString stringWithFormat:@"%.2f",totalPrice];
        if (addOrSub) {
            // 添加
            [weakSelf requestDataWithAddCartID:[NSString stringWithFormat:@"%ld",model.product_id] number:@"1"];
        } else {
            // 删除
            [weakSelf requestDataWithDeleteCartID:[NSString stringWithFormat:@"%ld",model.product_id] number:@"1"];
        }
    };
    void (^isSelectedFutureGenerations)() = ^() {
        NSInteger i = 0;
        for (GZGShoppingCartCell * tmpCell in weakSelf.tableView.visibleCells) {
            if (!tmpCell.cartRedio.isSelected) {
                weakSelf.isFutureGenerations = NO;
                weakSelf.settlementView.futureGenerationsItem.selected = weakSelf.isFutureGenerations;
            } else {
                i++;
            }
        }
        if (i == [weakSelf tableViewCells].count) {
            weakSelf.isFutureGenerations = YES;
//            [weakSelf.tableView reloadData];
            weakSelf.settlementView.futureGenerationsItem.selected = weakSelf.isFutureGenerations;
        }
    };
    
    cell.cartTitle.text = NSLocalizedString(model.name, nil);
    if (self.isFutureGenerations) {
        // 全选状态
        cell.cartRedio.selected = self.isFutureGenerations;
    } else {
        // 不是全选状态
        if (weakSelf.settlementView.combinedPriceTitle.text.floatValue == 0) {
            cell.cartRedio.selected = self.isFutureGenerations;
        }
    }
    [cell.cartImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    cell.cartNumber.text = [NSString stringWithFormat:@"%ld",model.quantity];
    cell.cartPrice.text = [NSString stringWithFormat:@"￥%.2f",model.price];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setButtonClick:^(UIButton * button) {
        switch (button.tag) {
            case 0: {
                // 选中
                button.selected = !button.isSelected;
                calculateTotalPrice(model);
                isSelectedFutureGenerations();
            }
                break;
            case 1: {
                // 商品减少
                NSInteger number = [weakCell.cartNumber.text integerValue];
                if (number > 1) {
                    weakCell.cartNumber.text = [NSString stringWithFormat:@"%ld",--number];
                    // 按钮选中
                    if (weakCell.cartRedio.isSelected) {
                        calculateNumberPrice(model,NO, YES);
                    } else {
                        weakCell.cartRedio.selected = YES;
                        calculateNumberPrice(model,NO, NO);
                    }
                }
                isSelectedFutureGenerations();
            }
                break;
            case 2: {
                // 商品添加
                NSInteger number = [weakCell.cartNumber.text integerValue];
                weakCell.cartNumber.text = [NSString stringWithFormat:@"%ld",++number];
                // 按钮选中
                if (weakCell.cartRedio.isSelected) {
                    calculateNumberPrice(model, YES, YES);
                } else {
                    weakCell.cartRedio.selected = YES;
                    calculateNumberPrice(model, YES, NO);
                }
                isSelectedFutureGenerations();
            }
                break;
        }
    }];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return self.collectionView.frame.size.height;
    }
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [self addHeaderView];
    }
    return nil;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GZGSpecialPerformanceModel * model = _mutables[indexPath.row];
    UITableViewRowAction * deleteRow = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"删除", nil) handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        // 执行的方法
        [self.mutables removeObject:model];
        [self requestDataWithDeleteCartID:model.ID number:@"1"];
    }];
    //
    UITableViewRowAction * collectRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"收藏" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }];
    collectRowAction.backgroundColor = [GZGColorClass subjectShoppingCartCollectionBackgroundColor];
    return @[deleteRow, collectRowAction];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GZGYDetailsViewController * detailsVC = [[GZGYDetailsViewController alloc] init];
    detailsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

////////======
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    if (self.collectionView.frame.size.height != collectionView.contentSize.height) {
        _collectionView.frame = CGRectMake(0, 0, collectionView.contentSize.width, collectionView.contentSize.height);
        [self.tableView reloadData];
    }
    GZGHotRecommendedCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotRecommendedCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake([GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:10], [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:10]);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
    
        GZGShoppingCartReusableView * collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        collectionReusableView.backgroundColor = [UIColor whiteColor];
        collectionReusableView.title = @"热门推荐";
        return collectionReusableView;
    }
    GZGShoppingCartReusableView * collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
    collectionReusableView.title = @"查看更多...";
    return collectionReusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake([GZGApplicationTool screenWide], [GZGApplicationTool control_height:65]);
    }
    return CGSizeMake([GZGApplicationTool screenWide], [GZGApplicationTool control_height:1]);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake([GZGApplicationTool screenWide], [GZGApplicationTool control_height:65]);
    }
    return CGSizeMake([GZGApplicationTool screenWide], [GZGApplicationTool control_height:1]);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"开发中..." message:@"此功能正在开发中......" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

@end
