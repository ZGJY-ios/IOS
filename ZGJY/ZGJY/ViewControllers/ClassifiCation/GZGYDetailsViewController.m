//
//  GZGYDetailsViewController.m
//  ZGJY
//
//  Created by YYS on 16/10/21.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDetailsViewController.h"
#import "GZGYNavView.h"
#import "GZGYDetailsView.h"
#import "GZGYBbtnView.h"
#import "GZGYChoiceView.h"
#import "GZGYEvaluationTableViewCell.h"
#import "GZGYEvaluaImgTableViewCell.h"
#import "GZGYOrderViewController.h"
#import "GZGYDetailsModel.h"
#import "GZGYPhotoViewController.h"
#import "UIScrollView+JYPaging.h"
@interface GZGYDetailsViewController ()<NavDelegeteClickProtocol,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate,ChoiceDelegeteClickProtocol>
{
    NSArray*nameArray;
    GZGYDetailsView * detailsView;
    GZGYBbtnView * btnView;
    CGPoint center;
    GZGYChoiceView * choiceView;
    NSInteger number;
    NSString * introduction;
}
@property(nonatomic, strong)NSArray<GZGYDetailsModel *> * model;
@property(nonatomic, strong)GZGYNavView *segView;
@property(nonatomic,strong)UIScrollView*mainScroll;
@property(nonatomic,strong)UIScrollView*oneScroll;
@property(nonatomic,strong)UIScrollView*twoScroll;
@property(nonatomic,strong)UITableView*etableView;
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

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.view.backgroundColor = [UIColor whiteColor];
    nameArray = @[@"商品",@"详情",@"评价"];
    NSLog(@"%@",self.shopID);
//    [self Animation];
    [self ScrollViewInterface];
    //nav
    [self NavViewInterface];
    //onescroll界面
    [self DetailsInterface];
    //btnview
    [self BtnInterface];
    //choiceView
    [self ChoiceViewInterface];
    //数据
    [self ClasstionData];
    // Do any additional setup after loading the view.
}
#pragma mark --- 数据
-(void)ClasstionData
{
    NSDictionary * dict;
    NSString * url;
    if (self.gDetails == GoodsDetailsMaternalAndInfant) {
        // 母婴
        dict = @{@"productCategoryId":self.productCategoryId,@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/baby";
    } else if (self.gDetails == GoodsDetailsKorea) {
        dict = @{@"taglds":@"8",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/Korea";
    } else if (self.gDetails == GoodsDetailsJapan) {
        // 日本馆
        dict = @{@"taglds":@"7",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/Janpan";
    } else if (self.gDetails == GoodsDetailsEurope) {
        // 欧洲
        dict = @{@"taglds":@"11",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/Europe";
    } else if (self.gDetails == GoodsDetailsAussie) {
        // 澳洲
        dict = @{@"taglds":@"12",@"productCategoryId":self.productCategoryId,@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/Europe";
    }
    else {
        dict = @{@"taglds":@"5",@"id":self.shopID};
        url = @"http://192.168.0.110:8080/appTopic/Limitshop";
    }
    
    
    [[GZGYAPIHelper shareAPIHelper]DetailssTimeSaleURL:url Dict:dict Finsh:^(NSArray * dataArray){
        self.model = [GZGYDetailsModel mj_objectArrayWithKeyValuesArray:dataArray];
        detailsView.model = self.model[0];
        NSDictionary * dictionary = dataArray[0];
        introduction = dictionary[@"introduction"];
        GZGYPhotoViewController *photo = [[GZGYPhotoViewController alloc] init];
        photo.introduction = introduction;
        [self addChildViewController:photo];
        if (photo.view != nil) {
            self.oneScroll.secondScrollView = photo.scrollView;
        }
    }];
}
// 添加购物车
- (void)requestDataWithAddCart {
    
    NSDictionary * dict = @{@"id":self.shopID};
    [[GZGYAPIHelper shareAPIHelper] addToCartURL:@"http://192.168.0.110:8080/appCart/add" Dict:dict Finished:^(NSArray *carts) {
        NSLog(@"添加成功");
    } failed:^(NSError *error) {
        NSLog(@"添加失败");
    }];
}
#pragma mark --- 波纹动画
-(void)Animation
{
    CATransition * tran=[CATransition animation];
    tran.delegate =self;
    tran.duration = 1;
    tran.type = @"rippleEffect";
    tran.subtype = @"fromRight";
    UIView *view = self.navigationController.view;
    [view.layer addAnimation:tran forKey:@"vbdb"];
}
#pragma mark --- Nav
-(void)NavViewInterface
{
    
   
    
    
    self.segView = [[GZGYNavView alloc]initWithFrame:CGRectMake(SCREENWIDTH/4, [GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:75], SCREENWIDTH/2, [GZGApplicationTool control_height:75]) NameArray:nameArray];
    self.segView.delegate = self;
    self.navBarView = self.segView;
    [self.view addSubview: self.segView];
    [self addTableViewToScrollView:self.mainScroll count:nameArray.count frame:CGRectZero];
    
    UIButton * sharebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    sharebutton.frame = CGRectMake([GZGApplicationTool control_wide:575], [GZGApplicationTool control_height:30]+20, [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    [sharebutton setImage:[[UIImage imageNamed:@"share.png"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [sharebutton addTarget:self action:@selector(sharebutttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton * rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame = CGRectMake([GZGApplicationTool control_wide:680], [GZGApplicationTool control_height:30]+20, [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    [rightbutton setImage:[[UIImage imageNamed:@"etc.png"] imageWithTintColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(rightbuttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sharebutton];
    [self.view addSubview:rightbutton];
}
#pragma mark --- scrollview
-(void)ScrollViewInterface
{
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize])];
    self.mainScroll.delegate = self;
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.bounces = NO;
    self.mainScroll.contentSize = CGSizeMake(SCREENWIDTH * nameArray.count, self.mainScroll.frame.size.height);
    self.mainScroll.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScroll];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (self.oneScroll == nil) {
        self.oneScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.mainScroll.frame.size.height+[GZGApplicationTool control_height:70])];
        self.oneScroll.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        self.oneScroll.contentSize = CGSizeMake(SCREENWIDTH, self.oneScroll.frame.size.height+[GZGApplicationTool control_height:70]);
        [self.mainScroll addSubview:self.oneScroll];
    }
    if (self.twoScroll == nil) {
        self.twoScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT-64)];
        self.twoScroll.contentSize = CGSizeMake(SCREENWIDTH, self.twoScroll.frame.size.height+10);
        self.twoScroll.backgroundColor = [UIColor redColor];
        [self.mainScroll addSubview:self.twoScroll];
    }
    if (self.etableView == nil) {
        self.etableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, self.mainScroll.frame.size.height)];
        self.etableView.delegate = self;
        self.etableView.dataSource = self;
        [self.mainScroll addSubview:self.etableView];
    }
}
-(void)DetailsInterface
{
    NSArray * arrayImg = @[self.shopImg];
    detailsView = [[GZGYDetailsView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.oneScroll.frame.size.height) andImageArr:arrayImg];
//    detailsView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    detailsView.shopName.text = self.shopName;
    [self.oneScroll addSubview:detailsView];
    [detailsView.reduceButton addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    [detailsView.addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark --- btnview
-(void)BtnInterface
{
    btnView = [[GZGYBbtnView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-[GZGApplicationTool control_height:100], SCREENWIDTH, [GZGApplicationTool control_height:100])];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
}
#pragma mark --- ChoiceView
-(void)ChoiceViewInterface
{
    choiceView = [[GZGYChoiceView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT)];
    choiceView.delegate = self;
    [self.view addSubview:choiceView];
    choiceView.hidden = YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [GZGApplicationTool control_height:360];
    }
    return [GZGApplicationTool control_height:235];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [GZGApplicationTool control_height:20];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)changeView:(float)x {
    float xx = x*(1.0f/6.0f);
    NSLog(@"~~~~~~~~%f",xx);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        [self changeView:scrollView.contentOffset.x];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
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
        [self.oneScroll setFrame:frame];
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

-(void)NavBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
    //    _NameTitle = _NameArray[sender];
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
    choiceView.hidden = NO;
    center = detailsView.center;
    center.y -= 64;
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        
        detailsView.center = center;
        detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        
        choiceView.frame =CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        btnView.alpha = 0;
    } completion: nil];
}
-(void)ChoiceBtnDelegate:(NSInteger)sender
{
    center.y += 64;
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choiceView.frame =CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT);
        detailsView.center = center;
        detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        btnView.alpha = 1;
    } completion: nil];
}
#pragma mark --- 半透明或叉号按钮事件监听
-(void)dismiss
{
    center.y += 64;
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choiceView.frame =CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT);
        detailsView.center = center;
        detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    } completion: nil];
    
}
#pragma mark --- 配送事件监听
-(void)distribution
{
    
}
#pragma mark --- 配送时间事件监听
-(void)disTime
{
    
}
#pragma mark --- 减少事件监听
-(void)reduce
{
    number = [detailsView.countField.text integerValue];
    number--;
    if (number>1) {
        detailsView.countField.text = [NSString stringWithFormat:@"%ld",number];
    }else{
        detailsView.countField.text = @"1";
    }
}
#pragma mark --- 增加事件监听
-(void)add
{
    number = [detailsView.countField.text integerValue];
    number++;
    detailsView.countField.text = [NSString stringWithFormat:@"%ld",number];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
