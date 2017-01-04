//
//  GZGADDAddressView.m
//  ZGJY
//
//  Created by 刘亚栋 on 2016/10/31.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGADDAddressView.h"
#import "GZGADDAddressViewCell.h"

#define TextFont [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]]
#define SELECTTEXT NSLocalizedString(@"GZGADDress_ADDAddress_text", nil)
static const NSInteger CITYBTNTAG = 2000;
@interface GZGADDAddressView()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UITableView *provinceTableView;
@property(nonatomic, strong) UITableView *theCityTableView;
@property(nonatomic, strong) UITableView *areaTableView;
@property(nonatomic, strong) NSMutableArray *provinceDataArray;
@property(nonatomic, strong) NSMutableArray *theCityDataArray;
@property(nonatomic, strong) NSMutableArray *areaDataArray;
@property(nonatomic ,strong) UIView *lines;

@end
@implementation GZGADDAddressView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _provinceDataArray = [NSMutableArray array];
        _theCityDataArray = [NSMutableArray array];
        _areaDataArray = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
        [self cityLoadData];
        [self buildUI];
        [self buildUIBtn];
    }
    return self;
}
- (void)generterBtn:(CGRect)frame text:(NSString *)text tag:(NSInteger)tag{
    UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cityBtn.frame = frame;
    [cityBtn setTitle:text forState:UIControlStateNormal];
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:25]];
    cityBtn.tag = tag;
    [self addSubview:cityBtn];
    
    
    
}

- (NSDictionary *)readCity{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"city" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *provinceLise = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return provinceLise;
}

- (void)cityLoadData{
    NSDictionary *provinceDic = [self readCity];
    [_provinceDataArray addObjectsFromArray:[provinceDic objectForKey:@"citylist"]];
}



- (void)buildUI{
    CGFloat hh = [GZGApplicationTool control_height:583],yy = [GZGApplicationTool control_height:0];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:159], SCREENWIDTH, hh)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    
    _provinceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, yy, SCREENWIDTH, hh)];
    _provinceTableView.delegate = self;
    _provinceTableView.dataSource = self;
    _provinceTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_scrollView addSubview:_provinceTableView];
    
    _theCityTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREENWIDTH, yy, SCREENWIDTH, hh)];
    _theCityTableView.delegate = self;
    _theCityTableView.dataSource = self;
    _theCityTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_scrollView addSubview:_theCityTableView];
    
    _areaTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 2, yy, SCREENWIDTH, hh)];
    _areaTableView.delegate = self;
    _areaTableView.dataSource = self;
    _areaTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_scrollView addSubview:_areaTableView];
  
}

- (void)buildUIBtn{
    
    UILabel *labText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:100])];
    labText.text = @"所在地区";
    labText.textColor = [UIColor lightGrayColor];
    labText.font = [UIFont systemFontOfSize:[GZGApplicationTool control_wide:30]];
    labText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labText];
    
    
    for (NSInteger i=0; i<3; i++) {
        UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        cityBtn.titleLabel.font = TextFont;
        cityBtn.tag  = CITYBTNTAG + i;
        [cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cityBtn addTarget:self action:@selector(cityBtnDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cityBtn];
    }
    
    CGSize btnSize = [GZGApplicationTool textSize:SELECTTEXT font:TextFont size:SCREENWIDTH];
    
    UIButton *btn = (UIButton *)[self viewWithTag:CITYBTNTAG + 0];
    btn.frame = CGRectMake([GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:100], btnSize.width, btnSize.height);
    [btn setTitle:SELECTTEXT forState:UIControlStateNormal];
    
    UIView *lineGays = [[UIView alloc] initWithFrame:CGRectMake(0, btn.onTheOffset + [GZGApplicationTool control_height:20], SCREENWIDTH, 0.5)];
    lineGays.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineGays];
    
    _lines = [[UIView alloc] initWithFrame:CGRectMake(btn.edgnSidePosition, btn.onTheOffset + [GZGApplicationTool control_height:20], btnSize.width, 0.5)];
    _lines.backgroundColor = [UIColor redColor];
    [self addSubview:_lines];
    
    
    
}

#pragma mark 系统代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _provinceTableView) {
        return _provinceDataArray.count;
    }else if (tableView ==  _theCityTableView){
        return  _theCityDataArray.count;
    }else{
        return _areaDataArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GZGApplicationTool control_height:70];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _provinceTableView) {
        static NSString *provinceTableViewStrCell = @"provinceTableViewStrCell";
        GZGADDAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:provinceTableViewStrCell];
        if (!cell) {
            cell = [[GZGADDAddressViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:provinceTableViewStrCell];
        }
        
        NSString *provinceStr = [_provinceDataArray[indexPath.row] objectForKey:@"p"];
        cell.cellCityLab.text = provinceStr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (tableView == _theCityTableView){
        static NSString *theCityTableViewStrCell = @"theCityTableViewStrCell";
        GZGADDAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theCityTableViewStrCell];
        if (!cell) {
            cell = [[GZGADDAddressViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theCityTableViewStrCell];
        }
        NSString *provinceStr = [_theCityDataArray[indexPath.row] objectForKey:@"n"];
        cell.cellCityLab.text = provinceStr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (tableView == _areaTableView){
        static NSString *areaTableViewViewStrCell = @"areaTableViewViewStrCell";
        GZGADDAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:areaTableViewViewStrCell];
        if (!cell) {
            cell = [[GZGADDAddressViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:areaTableViewViewStrCell];
        }
        NSString *provinceStr = [_areaDataArray[indexPath.row] objectForKey:@"s"];
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.cellCityLab.text = provinceStr;
        return cell;
    }
    
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIButton *provinceBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 0];
    UIButton *theCityBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 1];
    UIButton *areaBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 2];
    CGSize btnSize = [GZGApplicationTool textSize:SELECTTEXT font:TextFont size:SCREENWIDTH];
    
    CGFloat xx = [GZGApplicationTool control_wide:50],yy = [GZGApplicationTool control_height:100], ww = [GZGApplicationTool control_wide:40],hh = [GZGApplicationTool control_height:20];
    
    
    
    if (tableView == _provinceTableView) {
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH * 2, 0);
        [_theCityDataArray removeAllObjects];
        [_areaDataArray removeAllObjects];
        [_theCityDataArray addObjectsFromArray:[_provinceDataArray[indexPath.row] objectForKey:@"c"]];
        
        NSString *textStr = [_provinceDataArray[indexPath.row] objectForKey:@"p"];
        CGSize textSize = [GZGApplicationTool textSize:textStr font:TextFont size:SCREENWIDTH];
        [provinceBtn setTitle:textStr forState:UIControlStateNormal];
        provinceBtn.frame = CGRectMake(xx, yy,textSize.width,  textSize.height);
        {
            theCityBtn.frame = CGRectMake(provinceBtn.edgnSideOffset + ww, yy, btnSize.width, btnSize.height);
            [theCityBtn setTitle:SELECTTEXT forState:UIControlStateNormal];
            
        }
        
        {
            areaBtn.frame = CGRectMake(0, 0, 0, 0);
            
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = CGPointMake(SCREENWIDTH * 1, 0);
            _lines.frame = CGRectMake(theCityBtn.edgnSidePosition, provinceBtn.onTheOffset + hh, btnSize.width, 1);
        }];
        
        
        
    }else if (tableView == _theCityTableView){
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH * 3, 0);
        [_areaDataArray removeAllObjects];
        [_areaDataArray addObjectsFromArray:[_theCityDataArray[indexPath.row] objectForKey:@"a"]];
        
        NSString *textStr = [_theCityDataArray[indexPath.row] objectForKey:@"n"];
        CGSize textSize = [GZGApplicationTool textSize:textStr font:TextFont size:SCREENWIDTH];
        [theCityBtn setTitle:textStr forState:UIControlStateNormal];
        theCityBtn.frame = CGRectMake(provinceBtn.edgnSideOffset + ww, yy,textSize.width, textSize.height);
        
        {
            areaBtn.frame = CGRectMake(theCityBtn.edgnSideOffset + ww, yy, btnSize.width, btnSize.height);
            [areaBtn setTitle:SELECTTEXT forState:UIControlStateNormal];
            
        }
        
        
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = CGPointMake(SCREENWIDTH * 2, 0);
            _lines.frame = CGRectMake(areaBtn.edgnSidePosition  , theCityBtn.onTheOffset + hh, btnSize.width, 1);
        }];
    }else{
        NSString *textStr = [_areaDataArray[indexPath.row] objectForKey:@"s"];
        CGSize textSize = [GZGApplicationTool textSize:textStr font:TextFont size:SCREENWIDTH];
        [areaBtn setTitle:textStr forState:UIControlStateNormal];
        areaBtn.frame = CGRectMake(theCityBtn.edgnSideOffset + ww, yy,textSize.width, textSize.height);
        
        [UIView animateWithDuration:0.5 animations:^{
            _lines.frame = CGRectMake(areaBtn.edgnSidePosition , areaBtn.onTheOffset + hh, textSize.width, 1);
        }];
        
        if (self.cityAddressText) {
            self.cityAddressText ([NSString stringWithFormat:@"%@%@%@",provinceBtn.titleLabel.text,theCityBtn.titleLabel.text,areaBtn.titleLabel.text]);
        }
    }
    
    [_theCityTableView reloadData];
    [_areaTableView reloadData];
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
 
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UIButton *provinceBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 0];
    UIButton *theCityBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 1];
    UIButton *areaBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 2];
    CGFloat  hh = [GZGApplicationTool control_height:20];
    if (scrollView.contentOffset.x >=0 && scrollView.contentOffset.x < SCREENWIDTH) {
        _lines.frame = CGRectMake(provinceBtn.edgnSidePosition, provinceBtn.onTheOffset + hh, provinceBtn.viewWidth, 1);
    }else if (scrollView.contentOffset.x >= SCREENWIDTH && scrollView.contentOffset.x < SCREENWIDTH * 2){
        _lines.frame = CGRectMake(theCityBtn.edgnSidePosition, theCityBtn.onTheOffset + hh, theCityBtn.viewWidth , 1);
    }else if (scrollView.contentOffset.x >= SCREENWIDTH * 2){
        _lines.frame = CGRectMake(areaBtn.edgnSidePosition, areaBtn.onTheOffset + hh, areaBtn.viewWidth, 1);
    }
}

- (void)cityBtnDown:(UIButton *)btn{
    
    UIButton *provinceBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 0];
    UIButton *theCityBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 1];
    UIButton *areaBtn = (UIButton *)[self viewWithTag:CITYBTNTAG + 2];
    CGFloat  hh = [GZGApplicationTool control_height:20];
    switch (btn.tag) {
        case CITYBTNTAG + 0:{
            [UIView animateWithDuration:0.5 animations:^{
                _scrollView.contentOffset = CGPointMake(0, 0);
                _lines.frame = CGRectMake(btn.edgnSidePosition, btn.onTheOffset + hh, btn.viewWidth, 1);
            }];
        }
            break;
        case CITYBTNTAG + 1:{
            [UIView animateWithDuration:0.5 animations:^{
                _scrollView.contentOffset = CGPointMake(SCREENWIDTH, 0);
                _lines.frame = CGRectMake(btn.edgnSidePosition, btn.onTheOffset + hh, btn.viewWidth, 1);
            }];
        }
            break;
        case CITYBTNTAG + 2:{
            [UIView animateWithDuration:0.5 animations:^{
                _scrollView.contentOffset = CGPointMake(SCREENWIDTH * 2, 0);
                _lines.frame = CGRectMake(btn.edgnSidePosition, btn.onTheOffset + hh, btn.viewWidth, 1);
            }];
            
            
            
        }
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
