//
//  GZGYSpellgroupViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/10.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSpellgroupViewController.h"
#import "GZGYSpellSegView.h"
#import "GZGYSpellView.h"
#import "GZGYSpellgroupTableViewCell.h"
@interface GZGYSpellgroupViewController ()<UITableViewDelegate,UITableViewDataSource,SpellsegDelegeteClickProtocol>
@property(nonatomic, strong)UITableView * ytableView;
@property(nonatomic, strong)UIView * headerSegView;
@property(nonatomic, strong)GZGYSpellView * spellView;
@property(nonatomic, strong)GZGYSpellSegView * segView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSArray * nameArray;
@property(nonatomic, strong)NSMutableArray * tableArray;
@end

@implementation GZGYSpellgroupViewController
-(NSMutableArray *)tableArray
{
    if (_tableArray == nil) {
        _tableArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _tableArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"火力拼团";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self creatleftBtnWithTitle:nil normalImage:@"NavBar_Returnimage" highlightedImage:nil frame:CGRectMake(0,0 + [GZGApplicationTool control_height:10], [GZGApplicationTool control_wide:45], [GZGApplicationTool control_height:45]) action:@selector(back)];
    _nameArray = @[@"人气单品",@"面部护理",@"营养肌肤",@"洗发护发",@"全球正品",@"越团越惠"];
    [self scrollInterface];
    [self headerViewInterface];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    self.navBarView.hidden = NO;
}
#pragma mark --- 左侧按钮事件
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --- 左侧按钮
-(void)creatleftBtnWithTitle:(NSString*)title normalImage:(NSString*)normalImage highlightedImage:(NSString*)highlightedImage frame:(CGRect)frame action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [btn setFrame:frame];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
}
#pragma mark --- headerView界面
-(void)headerViewInterface
{
    self.headerSegView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:730])];
    [self.view addSubview:self.headerSegView];
    self.spellView = [[GZGYSpellView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:630])];
    self.spellView.backgroundColor = [UIColor colorWithDisplayP3Red:148/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    [self.headerSegView addSubview:self.spellView];
    self.segView = [[GZGYSpellSegView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:630], SCREENWIDTH, [GZGApplicationTool control_height:100]) NameArray:_nameArray];
    self.segView.delegate = self;
    self.segView.backgroundColor = [UIColor whiteColor];
    [self.headerSegView addSubview:self.segView];
    [self addTableViewToScrollView:self.scrollView count:_nameArray.count frame:CGRectZero];
    
    UIPanGestureRecognizer* singleTap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [self.headerSegView addGestureRecognizer:singleTap];
}
-(void)handleSingleTap
{
    [UIView animateWithDuration: 0.1 animations: ^{
        CGRect frame = self.headerSegView.frame;
        frame.origin.y = [GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:630];
        self.headerSegView.frame = frame;
        CGRect frame1 = self.scrollView.frame;
        frame1.origin.y = [GZGApplicationTool control_height:100]+[GZGApplicationTool navBarAndStatusBarSize];
        frame1.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize];
        self.scrollView.frame = frame1;
        for (int i = 0; i<_tableArray.count; i++) {
            UITableView * tableView = _tableArray[i];
            NSLog(@"%f",tableView.frame.size.height);
            CGRect frame2 = tableView.frame;
            frame2.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize];
            tableView.frame = frame2;
            NSLog(@"%f",tableView.frame.size.height);
        }
    } completion: nil];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH * i, 0 , SCREENWIDTH, scrollView.frame.size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        tableView.backgroundColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
        [self.tableArray addObject:tableView];
        [self.scrollView addSubview:tableView];
    }
}
#pragma mark --- 定义tableview
-(void)scrollInterface
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,[GZGApplicationTool navBarAndStatusBarSize]+ [GZGApplicationTool control_height:730], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:730])];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH * self.nameArray.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 1) {
        return [GZGApplicationTool control_height:20];
    }
    return [GZGApplicationTool control_height:365];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [GZGApplicationTool control_height:20];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 1;
    }
    return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:20])];
    colorView.backgroundColor = [UIColor colorWithDisplayP3Red:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
    return colorView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    if (indexPath.row%2 == 1) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.backgroundColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
        return cell;
    }else{
        GZGYSpellgroupTableViewCell* cell = (GZGYSpellgroupTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYSpellgroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.backgroundColor = [UIColor colorWithRed:149/255.0 green:208/255.0 blue:227/255.0 alpha:1.0];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --- seg点击事件--delegate
-(void)SpellsegBtnDelegate:(NSInteger)sender
{
    [self.scrollView setContentOffset:CGPointMake(SCREENWIDTH * sender, 0) animated:YES];
    float xx = SCREENWIDTH * (sender - 1) * (0.2) - SCREENWIDTH/5;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat imageH = self.segView.frame.size.height+[GZGApplicationTool navBarAndStatusBarSize];
    //获取偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f,%f",imageH,offsetY);
    if (offsetY>imageH) {
        [UIView animateWithDuration: 0.1 animations: ^{
            CGRect frame = self.headerSegView.frame;
            frame.origin.y = [GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:630];
            self.headerSegView.frame = frame;
            CGRect frame1 = self.scrollView.frame;
            frame1.origin.y = [GZGApplicationTool control_height:100]+[GZGApplicationTool navBarAndStatusBarSize];
            frame1.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize];
            self.scrollView.frame = frame1;
            for (int i = 0; i<_tableArray.count; i++) {
                UITableView * tableView = _tableArray[i];
                NSLog(@"%f",tableView.frame.size.height);
                CGRect frame2 = tableView.frame;
                frame2.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:100]-[GZGApplicationTool navBarAndStatusBarSize];
                tableView.frame = frame2;
                NSLog(@"%f",tableView.frame.size.height);
            }
        } completion: nil];
    }
    if (offsetY < -[GZGApplicationTool control_height:100]){
        [UIView animateWithDuration: 0.35 animations: ^{
            CGRect frame = self.headerSegView.frame;
            frame.origin.y = [GZGApplicationTool navBarAndStatusBarSize];
            self.headerSegView.frame = frame;
            CGRect frame1 = self.scrollView.frame;
            frame1.origin.y = [GZGApplicationTool control_height:730]+[GZGApplicationTool navBarAndStatusBarSize];
            frame1.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:730]-[GZGApplicationTool navBarAndStatusBarSize];
            self.scrollView.frame = frame1;
            for (int i = 0; i<_tableArray.count; i++) {
                UITableView * tableView = _tableArray[i];
                CGRect frame2 = tableView.frame;
                frame2.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:730]-[GZGApplicationTool navBarAndStatusBarSize];
                tableView.frame = frame2;
            }
        } completion: nil];
    }
}

- (void)changeView:(float)x {
    float xx = x*(1.0f/5.0f);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        float xx = scrollView.contentOffset.x * (0.2) - SCREENWIDTH/5;
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, SCREENWIDTH, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / SCREENWIDTH);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    self.ytableView = _tableArray[index];
    CGRect frame = self.ytableView.frame;
    frame.origin.x = SCREENWIDTH * index;
    [self.ytableView setFrame:frame];
    [self.ytableView reloadData];
}

@end
