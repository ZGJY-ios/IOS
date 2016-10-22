//
//  GZGSearchViewController.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGSearchViewController.h"

static NSInteger const BtnTag = 1000;


@interface GZGSearchViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *textfield;
@property(nonatomic, strong) UIButton *cancleBtn;
@end

@implementation GZGSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prefersStatusBarHidden];
    [self buildUI];
    self.navBarView.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark 方法
- (void)buildUI{

    _textfield = [[UITextField alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20],
                                                             [GZGApplicationTool control_height:18],
                                                             [GZGApplicationTool control_wide:625],
                                                             [GZGApplicationTool control_height:58])];
    _textfield.delegate = self;
    _textfield.placeholder = @"中港会员日，特惠来袭！";
    _textfield.borderStyle=UITextBorderStyleRoundedRect;
    _textfield.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIImageView *imageTextFiled = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:29])];
    imageTextFiled.image = [UIImage imageNamed:@"QQG_Search_FDJ"];
    _textfield.leftView = imageTextFiled;
    _textfield.leftViewMode = UITextFieldViewModeAlways;
    _textfield.backgroundColor = [GZGColorClass gzgBackClolor];
    [self.view addSubview:_textfield];
    
    _cancleBtn = [UIButton  buttonWithType:UIButtonTypeRoundedRect];
    _cancleBtn.frame = CGRectMake(SCREENWIDTH - [GZGApplicationTool control_wide:35] - [GZGApplicationTool control_wide:64], ([GZGApplicationTool navBarAndStatusBarSize] - [GZGApplicationTool control_height:30])/2, [GZGApplicationTool control_wide:64], [GZGApplicationTool control_height:30]);
    [_cancleBtn setTitle:NSLocalizedString(@"GZG_Commonly_Cancle", nil) forState:UIControlStateNormal];
    _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]];
    [_cancleBtn setTitleColor:[GZGColorClass subjectSearchTextColor] forState:UIControlStateNormal];
    [_cancleBtn addTarget:self action:@selector(cancleBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancleBtn];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:1])];
    line.backgroundColor = [GZGColorClass gzgBackClolor];;
    [self.view addSubview:line];
    
    
    
    [self searchBtnUI];
    
}
- (void)searchBtnUI{
    
    
    CGSize searchTextSize = [GZGApplicationTool textSize: NSLocalizedString(@"GZG_Commonly_EveryoneSearch", nil) font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]] size:SCREENWIDTH];
    
    
    UILabel *searchLab = [[UILabel alloc] initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool navBarAndStatusBarSize] + [GZGApplicationTool control_height:20], searchTextSize.width, searchTextSize.height)];
    searchLab.text = NSLocalizedString(@"GZG_Commonly_EveryoneSearch", nil);
    searchLab.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
    searchLab.textColor = [UIColor blackColor];
    [self.view addSubview:searchLab];
    
    
    
    
    
    NSArray *arrText = @[@"奶粉",@"MAC电脑",@"MacPro电脑",@"鸡窝",@"啦啦啦德玛西亚",@"什么，我就测试下",@"恩号的",@"机械键盘，海盗船长",@"液晶电视，我曹，真特么好看",@"LOL",@"跑跑卡丁车抱枕",@"你好我好大家好",@"好吧，我是再来测试的",@"你测试呗",@"恩，好的",@"原谅我真不知道说什么了",@"准备",@"完毕"];
    
    NSInteger numSize = 0;//文字宽度
    CGFloat numCount = 0;//叠加计算文字长度
    NSInteger jj = 0;//文字起始高度的位置
    CGFloat interval = [GZGApplicationTool control_wide:20];//间隔
    CGFloat heightCount = 0;//高度累加
    
    for (NSInteger i=0; i<arrText.count; i++) {
        //计算每段文字的宽度
        CGSize textSize = [GZGApplicationTool textSize:arrText[i] font:[UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]] size:SCREENWIDTH];
        //文字宽度见间隔累加
        CGFloat widthCount = textSize.width + [GZGApplicationTool control_wide:20 * 2] + interval;
        numCount += widthCount;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.tag = BtnTag + i;
        [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
        //是否大于屏幕
        if (numCount<=SCREENWIDTH) {
            
            btn.frame = CGRectMake([GZGApplicationTool control_wide:20]+numSize,
                                   searchLab.onTheOffset + [GZGApplicationTool control_height:20] + heightCount,
                                   textSize.width + [GZGApplicationTool control_wide:20 * 2],
                                   textSize.height + [GZGApplicationTool control_wide:20]);
            
            [btn setTitle:arrText[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]];
            btn.layer.cornerRadius = 5;
            btn.backgroundColor =  [GZGColorClass gzgBackClolor];
            
            [self.view addSubview:btn];
            //累加起始宽度
            numSize+=textSize.width + [GZGApplicationTool control_wide:20 * 2] + [GZGApplicationTool control_wide:20];
            
        }else{
            jj += 1;//文字高度起始点
            heightCount = jj *(textSize.height + [GZGApplicationTool control_wide:20] + [GZGApplicationTool control_wide:20]);//高度累加
            numCount = 0;//重置叠加计算文字长度
            numSize = 0;//重置文字宽度
            btn.frame = CGRectMake([GZGApplicationTool control_wide:20]+numSize,
                                   searchLab.onTheOffset + [GZGApplicationTool control_height:20] + heightCount,
                                   textSize.width + [GZGApplicationTool control_wide:20 * 2],
                                   textSize.height + [GZGApplicationTool control_wide:20]);
            
            [btn setTitle:arrText[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:26]];
            btn.layer.cornerRadius = 5;
            btn.backgroundColor =  [GZGColorClass gzgBackClolor];
            [self.view addSubview:btn];
            
            numCount += widthCount;//同上
            numSize+=textSize.width + [GZGApplicationTool control_wide:20 * 2] + [GZGApplicationTool control_wide:20];//同上
        }
 
    }
}

#pragma mark 系统代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"开始搜索");
    return YES;
}
#pragma mark 自己的代理

#pragma mark 自己的方法
- (void)cancleBtnDown{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)btnDown:(UIButton *)btn{
    NSLog(@"%@",btn.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
