//
//  GZGYSettimeView.m
//  ZGJY
//
//  Created by YYS on 16/11/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYSettimeView.h"


// label数量
#define labelCount 4
#define separateLabelCount 3
#define padding 5
@interface GZGYSettimeView (){
    // 定时器
    NSTimer *timer;
}
@property (nonatomic,strong)NSMutableArray *timeLabelArrM;
@property (nonatomic,strong)NSMutableArray *separateLabelArrM;
// 剩余
@property (nonatomic,strong)UILabel *remainLabel;
// 小时
@property (nonatomic,strong)UILabel *hourLabel;
// 分钟
@property (nonatomic,strong)UILabel *minuesLabel;
// 秒
@property (nonatomic,strong)UILabel *secondsLabel;
@end
@implementation GZGYSettimeView
// 创建单例
+ (instancetype)shareCountDown{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GZGYSettimeView alloc] init];
    });
    return instance;
}

+ (instancetype)countDown{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.remainLabel];
        [self addSubview:self.hourLabel];
        [self addSubview:self.minuesLabel];
        [self addSubview:self.secondsLabel];
        NSArray*LabelArray = @[@":",@"时",@"分",@"秒"];
        for (NSInteger index = 0; index < separateLabelCount+1; index ++) {
            UILabel *separateLabel = [[UILabel alloc] init];
            separateLabel.text = LabelArray[index];
            separateLabel.textAlignment = NSTextAlignmentRight;
            separateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
            [self addSubview:separateLabel];
            [self.separateLabelArrM addObject:separateLabel];
        }
    }
    return self;
}

#pragma mark --- 拿到接口传来的时间戳
- (void)setTimestamp:(NSInteger)timestamp{
    _timestamp = timestamp;
    if (_timestamp != 0) {
        timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}
#pragma mark --- 计时器 时间停止后回调
-(void)timer:(NSTimer*)timerr{
    _timestamp--;
    [self getDetailTimeWithTimestamp:_timestamp];
    if (_timestamp == 0) {
        [timer invalidate];
        timer = nil;
        // 执行block回调
        self.timerStopBlock();
    }
}
#pragma mark --- 将秒数据转化为时分秒
- (void)getDetailTimeWithTimestamp:(NSInteger)timestamp{
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    
    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒
    self.remainLabel.text = [NSString stringWithFormat:@"剩余"];
    NSString*hourStr = [NSString stringWithFormat:@"%ld",hour];
    NSString*minuteStr = [NSString stringWithFormat:@"%ld",minute];
    NSString*secondStr = [NSString stringWithFormat:@"%ld",second];
    if (hourStr.length == 1) {
        self.hourLabel.text = [NSString stringWithFormat:@"0%ld",hour];
    }else{
        self.hourLabel.text = [NSString stringWithFormat:@"%ld",hour];
    }
    if (minuteStr.length == 1) {
        self.minuesLabel.text = [NSString stringWithFormat:@"0%ld",minute];
    }else{
        self.minuesLabel.text = [NSString stringWithFormat:@"%ld",minute];
    }
    if (secondStr.length == 1) {
        self.secondsLabel.text = [NSString stringWithFormat:@"0%ld",second];
    }else{
        self.secondsLabel.text = [NSString stringWithFormat:@"%ld",second];
    }
}
#pragma mark --- 计算坐标
- (void)layoutSubviews{
    [super layoutSubviews];
    // 获得view的宽、高
    CGFloat viewW = self.frame.size.width;
    CGFloat viewH = self.frame.size.height;
    // 单个label的宽高
    CGFloat labelW = viewW / labelCount-8;
    CGFloat labelH = viewH;
    self.remainLabel.frame = CGRectMake(10, 1, labelW, labelH);
    self.hourLabel.frame = CGRectMake(labelW+5, 0, labelW, labelH);
    self.minuesLabel.frame = CGRectMake(2 * labelW+5 , 0, labelW, labelH);
    self.secondsLabel.frame = CGRectMake(3 * labelW+5, 0, labelW, labelH);
    
    for (NSInteger index = 0; index < self.separateLabelArrM.count ; index ++) {
        UILabel *separateLabel = self.separateLabelArrM[index];
        separateLabel.frame = CGRectMake((labelW) * (index + 1)+5, 1, 15, labelH);
    }
}


#pragma mark - 暂时没用
- (NSMutableArray *)timeLabelArrM{
    if (_timeLabelArrM == nil) {
        _timeLabelArrM = [[NSMutableArray alloc] init];
    }
    return _timeLabelArrM;
}
#pragma mark --- 存放label
- (NSMutableArray *)separateLabelArrM{
    if (_separateLabelArrM == nil) {
        _separateLabelArrM = [[NSMutableArray alloc] init];
    }
    return _separateLabelArrM;
}
#pragma mark --- 剩余
- (UILabel *)remainLabel{
    if (_remainLabel == nil) {
        _remainLabel = [[UILabel alloc] init];
        _remainLabel.textAlignment = NSTextAlignmentRight;
        _remainLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
        //        _dayLabel.backgroundColor = [UIColor grayColor];
    }
    return _remainLabel;
}
#pragma mark --- 小时
- (UILabel *)hourLabel{
    if (_hourLabel == nil) {
        _hourLabel = [[UILabel alloc] init];
        _hourLabel.textAlignment = NSTextAlignmentRight;
        _hourLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
        _hourLabel.textColor = [UIColor redColor];
    }
    return _hourLabel;
}
#pragma mark --- 分钟
- (UILabel *)minuesLabel{
    if (_minuesLabel == nil) {
        _minuesLabel = [[UILabel alloc] init];
        _minuesLabel.textAlignment = NSTextAlignmentRight;
        _minuesLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
        _minuesLabel.textColor = [UIColor redColor];
    }
    return _minuesLabel;
}
#pragma mark --- 秒
- (UILabel *)secondsLabel{
    if (_secondsLabel == nil) {
        _secondsLabel = [[UILabel alloc] init];
        _secondsLabel.textAlignment = NSTextAlignmentRight;
        _secondsLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:30]];
        _secondsLabel.textColor = [UIColor redColor];
    }
    return _secondsLabel;
}
@end
