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
@interface GZGYDetailsViewController ()<NavDelegeteClickProtocol,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate,ChoiceDelegeteClickProtocol>
{
    NSArray*nameArray;
    GZGYDetailsView * detailsView;
    GZGYBbtnView * btnView;
    CGPoint center;
    GZGYChoiceView * choiceView;
}
@property(nonatomic, strong)GZGYNavView *segView;
@property(nonatomic,strong)UIScrollView*mainScroll;
@property(nonatomic,strong)UIScrollView*oneScroll;
@property(nonatomic,strong)UIScrollView*twoScroll;
@property(nonatomic,strong)UITableView*etableView;
@end

@implementation GZGYDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    nameArray = @[@"商品",@"详情",@"评价"];
    [self Animation];
    [self ScrollViewInterface];
    //nav
    [self NavViewInterface];
    //onescroll界面
    [self DetailsInterface];
    //btnview
    [self BtnInterface];
    //choiceView
    [self ChoiceViewInterface];
    // Do any additional setup after loading the view.
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
    self.segView = [[GZGYNavView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth/2, [GZGApplicationTool control_height:75]) NameArray:nameArray];
    self.segView.delegate = self;
    [self.navigationItem setTitleView:self.segView];
    [self addTableViewToScrollView:self.mainScroll count:nameArray.count frame:CGRectZero];
    
    UIButton * sharebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    sharebutton.frame = CGRectMake(0, 0, 20, 20);
    [sharebutton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [sharebutton addTarget:self action:@selector(sharebutttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithCustomView:sharebutton];
    UIButton * rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame = CGRectMake(10, 0, 20, 20);
    [rightbutton setImage:[UIImage imageNamed:@"etc.png"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(rightbuttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    NSArray *buttonItem = @[right,share];
    self.navigationItem.rightBarButtonItems = buttonItem;
}
#pragma mark --- scrollview
-(void)ScrollViewInterface
{
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, KScreenHeight-64)];
    self.mainScroll.delegate = self;
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.bounces = NO;
    self.mainScroll.contentSize = CGSizeMake(KScreenWigth * nameArray.count, self.mainScroll.frame.size.height);
    self.mainScroll.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScroll];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (self.oneScroll == nil) {
        self.oneScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, self.mainScroll.frame.size.height+[GZGApplicationTool control_height:200])];
        self.oneScroll.contentSize = CGSizeMake(KScreenWigth, self.oneScroll.frame.size.height+[GZGApplicationTool control_height:450]);
//        self.oneScroll.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self.mainScroll addSubview:self.oneScroll];
    }
    if (self.twoScroll == nil) {
        self.twoScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(KScreenWigth, 0, KScreenWigth, KScreenHeight-64)];
        self.twoScroll.contentSize = CGSizeMake(KScreenWigth, self.twoScroll.frame.size.height+10);
        self.twoScroll.backgroundColor = [UIColor redColor];
        [self.mainScroll addSubview:self.twoScroll];
    }
    if (self.etableView == nil) {
        self.etableView = [[UITableView alloc]initWithFrame:CGRectMake(KScreenWigth*2, 0, KScreenWigth, self.mainScroll.frame.size.height)];
        self.etableView.delegate = self;
        self.etableView.dataSource = self;
        [self.mainScroll addSubview:self.etableView];
    }
}
-(void)DetailsInterface
{
    NSArray * arrayImg = @[@"sy_hlpic1.jpg",@"sy_hlpic2.jpg",@"sy_hlpic3.jpg"];
    detailsView = [[GZGYDetailsView alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, self.oneScroll.frame.size.height) andImageArr:arrayImg];
    [self.oneScroll addSubview:detailsView];
    [detailsView.speButton addTarget:self action:@selector(specifications) forControlEvents:UIControlEventTouchUpInside];
    [detailsView.disButton addTarget:self action:@selector(distribution) forControlEvents:UIControlEventTouchUpInside];
    [detailsView.disTimeBtn addTarget:self action:@selector(disTime) forControlEvents:UIControlEventTouchUpInside];
    [detailsView.reduceButton addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    [detailsView.addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];


}
#pragma mark --- btnview
-(void)BtnInterface
{
    btnView = [[GZGYBbtnView alloc]initWithFrame:CGRectMake(0, KScreenHeight-64-[GZGApplicationTool control_height:100], KScreenWigth, [GZGApplicationTool control_height:100])];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
}
#pragma mark --- ChoiceView
-(void)ChoiceViewInterface
{
    choiceView = [[GZGYChoiceView alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWigth, KScreenHeight)];
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
        float xx = scrollView.contentOffset.x * (0.5) - KScreenWigth/2;
        NSLog(@"%f",xx);
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth/2, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / KScreenWigth);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    if (index == 0) {
        CGRect frame = CGRectMake(0, 0, KScreenWigth, self.mainScroll.frame.size.height);
        frame.origin.x = 0;
        [self.oneScroll setFrame:frame];
    }else if (index == 1){
        CGRect frame = CGRectMake(KScreenWigth, 0, KScreenWigth, self.mainScroll.frame.size.height);
        frame.origin.x = KScreenWigth;
        [self.twoScroll setFrame:frame];
    }else{
        CGRect frame = CGRectMake(KScreenWigth*2, 0, KScreenWigth, self.mainScroll.frame.size.height);
        frame.origin.x = KScreenWigth*2;
        [self.twoScroll setFrame:frame];
    }
}

-(void)NavBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
    //    _NameTitle = _NameArray[sender];
    [self.mainScroll setContentOffset:CGPointMake(KScreenWigth * sender, 0) animated:YES];
    float xx = KScreenWigth * (sender - 1) * (1/3) - KScreenWigth/3;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth/2, self.segView.frame.size.height) animated:YES];
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
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        
        detailsView.center = center;
        detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        
        choiceView.frame =CGRectMake(0, 0, KScreenWigth, KScreenHeight);
        btnView.alpha = 0;
    } completion: nil];
}
-(void)ChoiceBtnDelegate:(NSInteger)sender
{
    center.y += 64;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choiceView.frame =CGRectMake(0, KScreenHeight, KScreenWigth, KScreenHeight);
        detailsView.center = center;
        detailsView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        btnView.alpha = 1;
    } completion: nil];
}
#pragma mark --- 半透明或叉号按钮事件监听
-(void)dismiss
{
    center.y += 64;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choiceView.frame =CGRectMake(0, KScreenHeight, KScreenWigth, KScreenHeight);
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
    
}
#pragma mark --- 增加事件监听
-(void)add
{
    GZGYOrderViewController * orders= [[GZGYOrderViewController alloc]init];
    [self.navigationController pushViewController:orders animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
