//
//  ZGApplicationTool.h
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/4.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZGApplicationTool : NSObject
@end

@interface ZGApplicationTool (Sizes)
/**
*  NavigationBar Size
*
*  @return size
*/
+ (CGFloat)navigationBarSize;
/**
 *  TabBar Size
 *
 *  @return Size
 */
+ (CGFloat)tabBarSize;
/**
 *  State Size
 *
 *  @return Size
 */
+ (CGFloat)statusBarSize;
/**
 *  navBar+StatusBar
 *
 *  @return navBar+StatusBar  Size
 */
+ (CGFloat)navBarAndStatusBarSize;
/**
 *  系统屏幕的宽
 *
 *  @return Size
 */
+ (CGFloat)screenWidth;
/**
 *  系统屏幕的高
 *
 *  @return Size
 */
+ (CGFloat)screenHeight;
+ (CGFloat)proportion_weight;
+ (CGFloat)Proportion_height;
/**
 *  UI设计给的宽
 *
 *  @param weight 你填写的宽
 *
 *  @return 返回计算的宽
 */
+ (CGFloat)control_weight:(CGFloat)weight;
/**
 *  UI设计给的高
 *
 *  @param height 你填写的宽
 *
 *  @return 返回计算的高
 */
+ (CGFloat)control_height:(CGFloat)height;

/**
 *  根据文字多少计算文本的Size
 *
 *  @param text Text
 *  @param font [UIFont Font]
 *  @param size Size
 *
 *  @return Size
 */
+ (CGSize)textSize:(NSString *)text font:(UIFont *)font size:(CGFloat)size;
/**
 *  等比例 屏幕大小压缩图片
 *
 *  @param image Image
 *
 *  @return Size
 */
+ (CGSize)compressImageSize:(UIImage *)image;
@end

@interface ZGApplicationTool (BooLs)
/**
*  正则手机号
*
*  @param phone your phone number
*
*  @return BOOL
*/
+(BOOL)PhoteFormat:(NSString *)phone;
/**
 *  返回是什么手机
 *
 *  @return String
 */
+(NSString *)Judgingdevice;
@end

@interface ZGApplicationTool (Edition)
/**
*  判断项目Version版本
*
*  @return String
*/
+(NSString *)theCurrentEditionVersion;
/**
 *  判断Build版本
 *
 *  @return String
 */
+(NSString *)theCurrnetEditionBuild;
/**
 *  跳转到AppStory评分
 */
+ (void)jumpAppStoreScore;
@end

@interface ZGApplicationTool (date)
/**
*  计算当月的第一天在周几
*
*  @param date NSDate
*
*  @return NSInteger
*/
+(NSInteger)getWeekofFirstInDate:(NSDate *)date;
/**
 *  计算现在是多少年
 *
 *  @param date NSDate
 *
 *  @return NSInteger
 */
+(NSInteger)whatYears:(NSDate *)date;

/**
 *  计算现在是多少月
 *
 *  @param date NSDate
 *
 *  @return NSInteger
 */
+(NSInteger)whatMonths:(NSDate *)date;
/**
 *  计算现在是多少日
 *
 *  @param date NSDate
 *
 *  @return NSInteger
 */
+(NSInteger)whatDays:(NSDate *)date;
/**
 *  计算本月的时间
 *  day 0 是本月 -1 上月 +1 下月 依次计算
 *
 *  @param date NSDate
 *  @param day  NSInteger
 *
 *  @return NSInteger
 */
+(NSDate*)whatMonth:(NSDate *)date timeDay:(NSInteger)day;
/**
 *  一个月有多少天
 *
 *  @param date NSDate
 *
 *  @return NSInteger
 */
+(NSInteger)totalDaysInMonth:(NSDate *)date;
/**
 *  查看当前日期在周几
 *
 *  @param date NSDate
 *
 *  @return NSInteger
 */
+(NSInteger)currentDayWeek:(NSDate *)date;
/**
 *  2015-01-01-00-00-00
 *
 *  @param date NSDate
 *
 *  @return String
 */
+(NSString *)datePickerTransformationYearDate:(NSDate *)date;
/**
 *2015年01月01日 格式
 */
+(NSString *)datePickerTransformationTextDate:(NSDate *)date;
/**
 *2015-01-01  格式
 */
+(NSString *)datePickerTransformationCorss:(NSDate *)date;
/**
 * 2015-01  格式：只有年和月
 */
+(NSString *)datePickerTransformationYearOrMonth:(NSDate *)date;

/**
 *2015.01.01  格式
 */
+(NSString *)datePickerTransformationCorssPoint:(NSDate *)date;
/**
 *01-01 格式
 */
+(NSString *)datePickerTransformationCorssPointMothDay:(NSDate *)date;
/**
 *01.01 格式
 */
+(NSString *)datePickerTransformationCorssCorssMothDay:(NSDate *)date;
/**
 * 12/23  11:11 格式
 */
+(NSString *)datePickerTransformationVacancyTime:(NSInteger)time;
/**
 *20150101格式
 */
+(NSString *)datePickerTransformationStr:(NSDate *)date;
/**
 *201512 只有年和月格式
 */
+(NSString *)datePickerTransformationYearAndMonth:(NSDate *)date;
/**
 *字符串转Date   字符串格式   20150101
 */
+(NSDate *)dateTransformationStr:(NSString *)str;
/**
 *字符串转Date   字符串格式   2015-01-01
 */
+(NSDate *)dateTransformationStringWhiffletree:(NSString *)str;
/**
 *时间戳转时间
 */
+(NSString *)timestampTransformationTime:(int64_t)timestamp;
/**
 * 时间大小比较
 *   1                      大于比较的时间
 *  -1                      小于比较的时间
 *   0                      等于比较的时间
 */
+(NSInteger)dateCompareDateCurrentDate:(NSDate *)currentDate afferentDate:(NSDate *)fiierentDate;
/**
 * currentDate 你想重什么时候开始的天数  afferentDate 要比较的天数
 */
+(NSInteger)dateInteverCurrentDate:(NSDate *)currentDate afferentDate:(NSDate *)afferentDate;

@end

@interface ZGApplicationTool (UIImages)
/**
 *生成二维码
 */
+ (CIImage *)createQRForString:(NSString *)qrString;
/**
 *把CIImage转成Image
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;
/**
 * 修改二维码颜色 待优化
 */
+ (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;
/**
 *压缩图片
 * @param  image  要压缩的图片
 * @param  size 要压缩的尺寸
 */
+ (UIImage *)compressFinishIsImages:(UIImage *)image scaledToSize:(CGSize)size;
/**
 * 创建毛玻璃
 * @param  imageView  要做图片的毛玻璃
 */
+ (UIVisualEffectView *)woolGlassEatablishImage:(UIImageView *)imageView;
@end

@interface ZGApplicationTool (NSArrays)
/**
 * 截取字符串
 * @param text 内容
 * @param interceptCharacter 要截取的字符串
 */
+ (NSArray *)interceptText:(NSString *)text interceptCharacter:(NSString *)interceptCharacter;
/**
 * 转换字符为十六进制，在转为byte
 * @param str 要转换的字符  一定要等于两位字符，否则补足
 */
+ (Byte)byteTransformationTextSixteenByteStr:(NSString *)str;
/**
 * 字符串拼接
 * @param strArr 要拆开拼接的字符串
 * @param mosiacSymbolStr 要连接在一起的字符
 * @param index 每次重第几个开始
 */
+ (NSMutableString *)stringMosiac:(NSString *)strArr mosiacSymbolStr:(NSString *)mosiacSybolStr index:(NSInteger)index;
/**
 * 字典转JSON
 */
+ (NSString *)jsonDataTransString:(NSDictionary *)dic;
@end

