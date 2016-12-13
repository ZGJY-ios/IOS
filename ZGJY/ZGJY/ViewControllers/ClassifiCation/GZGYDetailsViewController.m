//
//  GZGYDetailsViewController.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsViewController.h"
#import "GZGYNavView.h"
#import "GZGYBbtnView.h"
#import "GZGYChoiceView.h"
#import "GZGYEvaluationTableViewCell.h"
#import "GZGYEvaluaImgTableViewCell.h"
#import "GZGYOrderViewController.h"
#import "GZGYDetailsModel.h"
#import "GZGYPhotoViewController.h"
#import "UIScrollView+JYPaging.h"
#import "GZGYImgScrollView.h"
#import "GZGYDetailsTableViewCell.h"
#import "GZGYSelectedTableViewCell.h"
@interface GZGYDetailsViewController ()<NavDelegeteClickProtocol,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate,ChoiceDelegeteClickProtocol,ImgDelegeteClickProtocol>
{
    NSInteger heightNum;
    CGFloat minY;
    CGFloat maxY;
    // 图文详情开关，
    BOOL isShowDetail;
    NSArray*nameArray;
    GZGYBbtnView * btnView;
    CGPoint center;
    GZGYChoiceView * choiceView;
    UIView * alphaiView;
    NSInteger number;
    NSString * introduction;
    NSString * countNumber;
}
@property(nonatomic, strong)NSArray<GZGYDetailsModel *> * model;
@property(nonatomic, strong)UIView * allView;
@property(nonatomic, strong)GZGYImgScrollView * goodsImgScro;
@property(nonatomic, strong)UILabel * footView;
@property(nonatomic, strong)GZGYNavView * segView;
@property(nonatomic, strong)UILabel * titleView;
@property(nonatomic, strong)UIScrollView * mainScroll;
@property(nonatomic, strong)UITableView * detailsView;
@property(nonatomic, strong)UIScrollView * twoScroll;
@property(nonatomic, strong)UITableView * etableView;
@property(nonatomic, strong)UILabel * bottomMsgLabel;//下拉返回商品详情
@property(nonatomic, strong)UIScrollView * webScrollView;//图文详情
@end


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
@implementation GZGYDetailsViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navBarView.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [GZGColorClass gzgNavBarBackColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    nameArray = @[@"商品",@"详情",@"评价"];
    [self creatleftBtnWithTitle:nil normalImage:@"NavBar_Returnimage" highlightedImage:nil frame:CGRectMake(0,0, [GZGApplicationTool control_wide:45], [GZGApplicationTool control_height:45]) action:@selector(pop)];
    [self ScrollViewInterface];
    [self webViewInterface];
    //nav
    [self NavViewInterface];
    //btnview
    [self BtnInterface];
    //choiceView
    //    [self ChoiceViewInterface];
    //数据
    [self ClasstionData];
    // Do any additional setup after loading the view.
}
#pragma mark --- 数据
-(void)ClasstionData
{
    NSDictionary * dict;
    switch (self.gDetails) {
        case GoodsDetailsMaternalAndInfant:
        {
            dict = @{@"productCategoryId":self.productCategoryId,@"id":self.shopID};
            break;
        }
        case GoodsDetailsKorea:
        {
            dict = @{@"taglds":@"8",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
            break;
        }
        case GoodsDetailsJapan:
        {
            dict = @{@"taglds":@"7",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
            break;
        }
        case GoodsDetailsEurope:
        {
            dict = @{@"taglds":@"11",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
            break;
        }
        case GoodsDetailsAussie:
        {
            dict = @{@"taglds":@"12",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
            break;
        }
        case GoodsDetailsWashProtect:
        {
            dict = @{@"taglds":@"5",@"id":self.shopID};
            break;
        }
        case GoodsDetailsLimited:
        {
            dict = @{@"taglds":@"5",@"id":self.shopID};
            break;
        }
        case GoodsDetailsFireAlsoGroup:
        {
            dict = @{@"taglds":@"5",@"id":self.shopID};
            break;
        }
        default:
            break;
    }
    [[GZGYAPIHelper shareAPIHelper]DetailssTimeSaleCountries:self.gDetails Dict:dict Finsh:^(NSArray * dataArray){
        NSLog(@"你猜%@",dataArray);
        self.model = [GZGYDetailsModel mj_objectArrayWithKeyValuesArray:dataArray];
        NSDictionary * dictionary = dataArray[0];
        introduction = dictionary[@"introduction"];
        [_detailsView reloadData];
        [self ChoiceViewInterface];
    }];
}
// 添加购物车
- (void)requestDataWithAddCart {
    
    NSDictionary * dict = @{@"id":self.shopID,@"quantity":choiceView.countField.text};
    [[GZGYAPIHelper shareAPIHelper] addToCartURL:@"appCart/add" Dict:dict Finished:^(NSArray *carts) {
        NSLog(@"添加成功");
    } failed:^(NSError *error) {
        NSLog(@"添加失败");
    }];
}
#pragma mark --- Nav
-(void)NavViewInterface
{
    self.segView = [[GZGYNavView alloc]initWithFrame:CGRectMake(SCREENWIDTH/4, [GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:75], SCREENWIDTH/2, [GZGApplicationTool control_height:85]) NameArray:nameArray];
    self.segView.delegate = self;
    [self.navigationItem setTitleView:self.segView];
    
    _titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:40])];
    _titleView.text = @"图文详情";
    _titleView.textColor = [UIColor whiteColor];
    [self addTableViewToScrollView:self.mainScroll count:nameArray.count frame:CGRectZero];
    
    UIButton * sharebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    sharebutton.frame = CGRectMake([GZGApplicationTool control_wide:575], [GZGApplicationTool control_height:30]+20, [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    [sharebutton setImage:[[UIImage imageNamed:@"share.png"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [sharebutton addTarget:self action:@selector(sharebutttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton * rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame = CGRectMake([GZGApplicationTool control_wide:680], [GZGApplicationTool control_height:30]+20, [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    [rightbutton setImage:[[UIImage imageNamed:@"etc.png"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(rightbuttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc]initWithCustomView:sharebutton];
    UIBarButtonItem *anotherButton1 = [[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: anotherButton,anotherButton1,nil]];
}
#pragma mark --- scrollview
-(void)ScrollViewInterface
{
    self.allView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, (SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize])*2)];
    [self.view addSubview:self.allView];
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize])];
    self.mainScroll.delegate = self;
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.bounces = NO;
    self.mainScroll.contentSize = CGSizeMake(SCREENWIDTH * nameArray.count, self.mainScroll.frame.size.height);
    self.mainScroll.backgroundColor = [UIColor whiteColor];
    [self.allView addSubview:self.mainScroll];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (self.detailsView == nil) {
        self.detailsView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.mainScroll.frame.size.height)];
        self.detailsView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        self.detailsView.delegate = self;
        self.detailsView.dataSource = self;
        [self.mainScroll addSubview:self.detailsView];
        [self ImgScorllInterface];
        self.detailsView.tableHeaderView = self.goodsImgScro;
        self.detailsView.tableFooterView = self.footView;
    }
    if (self.twoScroll == nil) {
        self.twoScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT-64)];
        [self.mainScroll addSubview:self.twoScroll];
    }
    if (self.etableView == nil) {
        self.etableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, self.mainScroll.frame.size.height)];
        self.etableView.delegate = self;
        self.etableView.dataSource = self;
        [self.mainScroll addSubview:self.etableView];
    }
}
#pragma mark --- 图文详情
-(void)webViewInterface
{
    self.webScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-[GZGApplicationTool tabBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize])];
    self.webScrollView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    self.webScrollView.delegate = self;
    self.webScrollView.backgroundColor = [UIColor whiteColor];
    [self.allView addSubview:self.webScrollView];
    _bottomMsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -[GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:80])];
    _bottomMsgLabel.font = [UIFont systemFontOfSize:13.0f];
    _bottomMsgLabel.textAlignment = NSTextAlignmentCenter;
    _bottomMsgLabel.text = @"下拉返回商品详情";
    [self.webScrollView addSubview:_bottomMsgLabel];
}
#pragma mark --- webView数据
-(void)webViewData:(NSInteger)sender
{
    //字符串转变为数组1
    NSMutableString * str=[[NSMutableString alloc]initWithFormat:@"%@",introduction];
    //字符串转变为数组2
    NSMutableArray * ImageArr = [NSMutableArray arrayWithArray:[str   componentsSeparatedByString:@"<img src="]];
    [ImageArr removeObjectAtIndex:0];
    NSString * contentString = introduction;
    NSMutableArray * imgArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i<ImageArr.count; i++) {
        NSRange startRange = [contentString rangeOfString:@"upload"];
        NSRange endRange = [contentString rangeOfString:@".jpg"];
        NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
        NSString *result = [contentString substringWithRange:range];
        NSString * imgString = [NSString stringWithFormat:@"upload%@.jpg",result];
        [imgArray addObject:imgString];
        contentString = [contentString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"upload%@.jpg",result] withString:@""];
    }
    for (int i = 0; i<imgArray.count; i++) {
        switch (self.gDetails) {
            case GoodsDetailsMaternalAndInfant:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsKorea:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsJapan:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsEurope:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsAussie:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsWashProtect:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsLimited:
            {
                heightNum = 160;
                break;
            }
            case GoodsDetailsFireAlsoGroup:
            {
                heightNum = 1100;
                break;
            }
            default:
                break;
        }   
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:heightNum]*i, SCREENWIDTH, [GZGApplicationTool control_height:heightNum])];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString * urlString = [NSString stringWithFormat:@"http://192.168.0.110:8080/%@",imgArray[i]];
            [imgView setHeader:urlString];
        });
        if (sender == 100) {
            [self.webScrollView addSubview:imgView];
        }else{
            [self.twoScroll addSubview:imgView];
        }
        
        switch (sender) {
            case 100:
                if ([GZGApplicationTool control_height:heightNum] * imgArray.count >SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize]) {
                    self.webScrollView.contentSize = CGSizeMake(SCREENWIDTH, [GZGApplicationTool control_height:heightNum] * imgArray.count);
                }else{
                    self.webScrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize]+[GZGApplicationTool control_height:10]);
                }
                break;
            case 101:
                if ([GZGApplicationTool control_height:heightNum] * imgArray.count >SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize]) {
                    self.twoScroll.contentSize = CGSizeMake(SCREENWIDTH, [GZGApplicationTool control_height:heightNum] * imgArray.count);
                }else{
                    self.twoScroll.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool tabBarSize]+[GZGApplicationTool control_height:10]);
                }
                break;
            default:
                break;
        }
    }
}
#pragma mark --- 头视图与尾视图
-(void)ImgScorllInterface
{
    NSArray * imageArr = @[_shopImg];
    _goodsImgScro = [[GZGYImgScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:750]) andImageArr:imageArr];
    _goodsImgScro.delegete = self;
    
    _footView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:80])];
    _footView.text = @"继续拖动,查看图文详情";
    _footView.font = [UIFont systemFontOfSize:15];
    _footView.textAlignment = NSTextAlignmentCenter;
    _footView.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
}
#pragma mark --- btnview
-(void)BtnInterface
{
    btnView = [[GZGYBbtnView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-[GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:100])];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
    [btnView.serviceBtn addTarget:self action:@selector(Service:) forControlEvents:UIControlEventTouchUpInside];
    [btnView.focusBtn addTarget:self action:@selector(Focus:) forControlEvents:UIControlEventTouchUpInside];
    [btnView.cartBtn addTarget:self action:@selector(Cart:) forControlEvents:UIControlEventTouchUpInside];
    [btnView.addBtn addTarget:self action:@selector(Receipt:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark --- ChoiceView
-(void)ChoiceViewInterface
{
    alphaiView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    alphaiView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    alphaiView.alpha = 0.0;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize])];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [alphaiView addSubview:btn];
    [self.view addSubview:alphaiView];
    
    choiceView = [[GZGYChoiceView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, [GZGApplicationTool control_height:715])];
    choiceView.backgroundColor = [UIColor whiteColor];
    choiceView.model = self.model[0];
    choiceView.delegate = self;
    choiceView.alpha = 0.0;
    [self.view addSubview:choiceView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.detailsView]) {
        return 2;
    }
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.detailsView]) {
        if (indexPath.section == 0) {
            return [GZGApplicationTool control_height:350];
        }
        return [GZGApplicationTool control_height:80];
    }else{
        if (indexPath.section == 0) {
            return [GZGApplicationTool control_height:360];
        }
        return [GZGApplicationTool control_height:235];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([tableView isEqual:self.detailsView]) {
        if (section == 0) {
            return 0;
        }
        return [GZGApplicationTool control_height:10];
    }
    return [GZGApplicationTool control_height:20];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    if ([tableView isEqual:self.detailsView]) {
        if (indexPath.section == 0) {
            GZGYDetailsTableViewCell* cell = (GZGYDetailsTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击cell无高亮
            cell.model = self.model[indexPath.section];
            return cell;
        }else{
            GZGYSelectedTableViewCell* cell = (GZGYSelectedTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYSelectedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            if (countNumber.length == 0) {
                cell.countLabel.text = @"1个";
            }else{
                cell.countLabel.text = [NSString stringWithFormat:@"%@个",countNumber];
            }
            return cell;
        }
    }else{
        if (indexPath.section == 0) {
            GZGYEvaluaImgTableViewCell* cell = (GZGYEvaluaImgTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYEvaluaImgTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            return cell;
        }else{
            GZGYEvaluationTableViewCell* cell = (GZGYEvaluationTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell = [[GZGYEvaluationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            return cell;
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        [self specifications];
    }
}


- (void)changeView:(float)x {
    float xx = x*(1.0f/6.0f);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    //只要滚动了就会触发
    if (scrollView == self.detailsView) {
        // 重新赋值，就不会有淘宝用力拖拽时的回弹
        self.goodsImgScro.scro.contentOffset = CGPointMake(self.goodsImgScro.scro.contentOffset.x, 0);
        if (self.detailsView.contentOffset.y >= 0 &&  self.detailsView.contentOffset.y <= self.goodsImgScro.frame.size.height) {
            self.goodsImgScro.scro.contentOffset = CGPointMake(self.goodsImgScro.scro.contentOffset.x, -offset / 2.0f);
        } else if (self.detailsView.contentOffset.y < 0) {
            GZGLog(@"淘宝下拉弹出的界面，暂时没有");
        } else {
            GZGLog(@"拖拽超过轮播图的高");
        }
    }else if (scrollView == self.webScrollView){
        // WebView中的ScrollView
        if (offset <= -[GZGApplicationTool control_height:100]) {
            _bottomMsgLabel.text = @"释放返回商品详情";
        } else {
            _bottomMsgLabel.text = @"下拉返回商品详情";
        }
    }else
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        [self changeView:scrollView.contentOffset.x];
        
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {
        CGFloat offset = scrollView.contentOffset.y;
        if (scrollView == self.detailsView) {
            if (offset < 0) {
                minY = MIN(minY, offset);
            } else {
                maxY = MAX(maxY, offset);
            }
        } else {
            minY = MIN(minY, offset);
        }
        // 滚到图文详情
        if (maxY >= self.detailsView.contentSize.height - SCREENHEIGHT+[GZGApplicationTool control_height:100] + [GZGApplicationTool tabBarSize]+[GZGApplicationTool navBarAndStatusBarSize]) {
            isShowDetail = NO;
            [UIView animateWithDuration:0.4 animations:^{
                self.allView.transform = CGAffineTransformTranslate(self.allView.transform, 0, - (SCREENHEIGHT - [GZGApplicationTool tabBarSize]));
            } completion:^(BOOL finished) {
                maxY = 0.0f;
                isShowDetail = YES;
                [self webViewData:100];
            }];
            self.navigationItem.titleView = self.titleView;
        }
        
        // 滚到商品详情
        if (minY <= -[GZGApplicationTool control_height:100] && isShowDetail) {
            [UIView animateWithDuration:0.4 animations:^{
                self.allView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                minY = 0.0f;
                isShowDetail = NO;
                _bottomMsgLabel.text = @"下拉返回商品详情";
            }];
            self.navigationItem.titleView = self.segView;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        [self webViewData:101];
        float xx = scrollView.contentOffset.x * (0.5) - SCREENWIDTH/2;
        NSLog(@"%f",xx);
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH/2, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / SCREENWIDTH);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    if (index == 0) {
        CGRect frame = CGRectMake(0, 0, SCREENWIDTH, self.mainScroll.frame.size.height);
        frame.origin.x = 0;
        [self.detailsView setFrame:frame];
    }else if (index == 1){
        CGRect frame = CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.mainScroll.frame.size.height);
        frame.origin.x = SCREENWIDTH;
        [self.twoScroll setFrame:frame];
    }else{
        CGRect frame = CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, self.mainScroll.frame.size.height);
        frame.origin.x = SCREENWIDTH*2;
        [self.twoScroll setFrame:frame];
    }
}
#pragma mark --- 导航栏事件
-(void)NavBtnDelegate:(NSInteger)sender
{
    if (sender == 1) {
        [self webViewData:101];
    }
    [self.mainScroll setContentOffset:CGPointMake(SCREENWIDTH * sender, 0) animated:YES];
    float xx = SCREENWIDTH * (sender - 1) * (1/3) - SCREENWIDTH/3;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH/2, self.segView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}
#pragma mark --- 右侧消息监听
-(void)rightbuttonAction
{
    NSLog(@"点你妹呀");
}
#pragma mark --- 右侧分享监听
-(void)sharebutttonAction
{
    NSLog(@"点你大爷");
}
#pragma mark --- 规格事件监听
-(void)specifications
{
    [self open];
}
#pragma mark --- 叉号按钮事件
-(void)ChoiceBtnDelegate:(NSInteger)sender
{
    [self dismiss];
}
#pragma mark --- 弹出规格界面
-(void)open
{
    center = self.detailsView.center;
    center.y -= 64;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        alphaiView.alpha = 1.0;
        choiceView.alpha = 1.0;
        btnView.alpha = 0.0;
        self.detailsView.center = center;
        self.detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        choiceView.frame =CGRectMake(0, SCREENHEIGHT-[GZGApplicationTool control_height:715], SCREENWIDTH, [GZGApplicationTool control_height:715]);
    } completion: nil];
}
#pragma mark --- 收回规格界面
-(void)dismiss
{
    center.y += 64;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        alphaiView.alpha = 0.0;
        choiceView.alpha = 0.0;
        btnView.alpha = 1.0;
        choiceView.frame =CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, [GZGApplicationTool control_height:715]);
        self.detailsView.center = center;
        self.detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    } completion: nil];
}
#pragma mark --- 减少事件
-(void)ReductBtnDelegate:(NSInteger)sender
{
    number = [choiceView.countField.text integerValue];
    number--;
    if (number>1) {
        choiceView.countField.text = [NSString stringWithFormat:@"%ld",number];
    }else{
        choiceView.countField.text = @"1";
    }
}
#pragma mark --- 增加事件
-(void)AddBtnDelegate:(NSInteger)sender
{
    number = [choiceView.countField.text integerValue];
    number++;
    choiceView.countField.text = [NSString stringWithFormat:@"%ld",number];
}
#pragma mark --- Choice加入收藏
-(void)CollectionBtnDelegate:(NSInteger)sender
{
    countNumber = choiceView.countField.text;
    [self dismiss];
    [_detailsView reloadData];
    GZGLog(@"加入收藏");
}
#pragma mark --- Choice加入进货单
-(void)ReceiptBtnDelegate:(NSInteger)sender
{
    countNumber = choiceView.countField.text;
    NSLog(@"%@",countNumber);
    [self dismiss];
    [_detailsView reloadData];
    GZGLog(@"加入进货单");
}
//#pragma mark --- 减少事件监听
//-(void)reduce
//{
//    number = [detailsView.countField.text integerValue];
//    number--;
//    if (number>1) {
//        detailsView.countField.text = [NSString stringWithFormat:@"%ld",number];
//    }else{
//        detailsView.countField.text = @"1";
//    }
//}
//#pragma mark --- 增加事件监听
//-(void)add
//{
//    number = [detailsView.countField.text integerValue];
//    number++;
//    detailsView.countField.text = [NSString stringWithFormat:@"%ld",number];
//}

#pragma mark --- 客服事件监听
-(void)Service:(UIButton *)sender
{
    GZGLog(@"客服");
}
#pragma mark --- 关注事件监听
-(void)Focus:(UIButton *)sender
{
    GZGLog(@"关注");
}
#pragma mark --- 购物车事件监听
-(void)Cart:(UIButton *)sender
{
    GZGLog(@"购物车");
}
#pragma mark --- 加入进货单事件监听
-(void)Receipt:(UIButton *)sender
{
    GZGLog(@"加入进货单");
    [self requestDataWithAddCart];
}
-(void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    self.navBarView.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
