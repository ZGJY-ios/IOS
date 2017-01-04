//
//  ZGApplicationTool.m
//  ZGJY
//
//  Created by 刘亚栋 on 16/8/4.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGApplicationTool.h"
#import "sys/utsname.h"
@implementation GZGApplicationTool

@end
@implementation GZGApplicationTool (Sizes)
/**
 *NavigationBar高度
 */
+ (CGFloat)navigationBarSize{
    UINavigationController *nav = [[UINavigationController alloc] init];
    NSInteger  rectNav = nav.navigationBar.frame.size.height;
    return rectNav;
}
/**
 *TabBar高度
 */
+ (CGFloat)tabBarSize{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSInteger tab =  tabBarController.tabBar.frame.size.height;
    return tab;
}
/**
 *状态栏高度
 */
+ (CGFloat)statusBarSize{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectStatus.size.height;
}
/**
 *navBar+StatusBar 的高度
 */
+ (CGFloat)navBarAndStatusBarSize{
    UINavigationController *nav = [[UINavigationController alloc] init];
    NSInteger  rectNav = nav.navigationBar.frame.size.height;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectNav+rectStatus.size.height;
}
/**
 *系统屏幕的宽
 */

+ (CGFloat)screenWide {return [UIScreen mainScreen].bounds.size.width;}
/**
 *系统屏幕的高
 */
+ (CGFloat)screenHeight {return [UIScreen mainScreen].bounds.size.height;}
+ (CGFloat)proportion_wide{return [self screenWide]/750.0f;}
+ (CGFloat)Proportion_height{return [self screenHeight]/1334.0f;}
/**
 *设计图适配的宽  以6为基准
 */

+ (CGFloat)control_wide:(CGFloat)wide{return wide * [self proportion_wide];}
/**
 *设计图适配的高  以6为基准
 */

+ (CGFloat)control_height:(CGFloat)height{return height * [self Proportion_height];}
/**
 *根据文字多少计算文本的Size
 */

+ (CGSize)textSize:(NSString *)text font:(UIFont *)font size:(CGFloat)size{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize questionSize = [text boundingRectWithSize:CGSizeMake(size, MAXFLOAT)  options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return questionSize;
}
/**
 *等比例 屏幕大小压缩图片
 * @param  image  图片
 */
+ (CGSize)compressImageSize:(UIImage *)image{
    CGSize imageSize = image.size;
    if (image.size.height/[self screenHeight]-[self navBarAndStatusBarSize] && image.size.width<[self screenWide]) {
        imageSize.height = imageSize.height;
        imageSize.width = imageSize.width;
    }else{
        if (image.size.height/([self screenHeight]-[self navBarAndStatusBarSize]) > (image.size.width/[self screenWide]) ) {
            imageSize.height = [self screenHeight]-[self navBarAndStatusBarSize];
            imageSize.width = ((([self screenHeight]-[self navBarAndStatusBarSize])/image.size.height)*image.size.width);
        }else if (image.size.height/([self screenHeight] - [self navBarAndStatusBarSize]) <= image.size.width/[self screenWide]){
            imageSize.height = ([self screenWide]/image.size.width)*image.size.height;
            imageSize.width = [self screenWide];
        }
    }
    return imageSize;
}
@end

@implementation GZGApplicationTool (BooLs)
/**
 *  正则手机号
 *
 *  @param phone 手机号
 *
 */
+(BOOL)PhoteFormat:(NSString *)phone{
    NSString *phoneFormat = @"\\b(1)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneFormat];
    BOOL isMatch = [pred evaluateWithObject:phone];
    return isMatch;
    return YES;
}
/**
 *  返回你的手机型号
 */
+(NSString *)Judgingdevice{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return platform;
}
@end

@implementation GZGApplicationTool (Edition)
/**
 *判断项目Version版本
 */
+(NSString *)theCurrentEditionVersion{
    return  [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
}
/**
 *判断Build版本
 */
+(NSString *)theCurrnetEditionBuild{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
/**
 *跳转到AppStory评分
 */
+ (void)jumpAppStoreScore{[[UIApplication sharedApplication] openURL:[NSURL URLWithString:APP_Story_URL]];}

@end

@implementation GZGApplicationTool (date)
/**
 *计算当月的第一天在周几
 */
+(NSInteger)getWeekofFirstInDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay:1];
    NSDate *firstDate = [calendar dateFromComponents:components];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday fromDate:firstDate];
    return firstComponents.weekday - 1;
}
/**
 *计算现在是多少年
 */
+(NSInteger)whatYears:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    return [components year];
}
/**
 *计算现在是多少月
 */
+(NSInteger)whatMonths:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    return [components month];
}
/**
 *计算现在是多少日
 */
+(NSInteger)whatDays:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    return [components day];
}
/**
 *计算本月的时间
 */
+(NSDate*)whatMonth:(NSDate *)date timeDay:(NSInteger)day{
    /*
     * day + 0                                  当月时间
     * day + 1                                  下个月时间
     * day - 1                                  上个月时间
     */
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = + day;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
/**
 *一个月有多少天
 */
+(NSInteger)totalDaysInMonth:(NSDate *)date{
    NSRange daysInOnMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOnMonth.length;
}
/**
 *查看当前日期在周几
 */
+(NSInteger)currentDayWeek:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour |NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:date];
    return [comps weekday];
}

+(NSString *)datePickerTransformationYearDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}

+(NSString *)datePickerTransformationTextDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationCorss:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationYearOrMonth:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationCorssPoint:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationCorssPointMothDay:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationCorssCorssMothDay:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM.dd"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationStr:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationYearAndMonth:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMM"];
    NSString *formatDate = [formatter stringFromDate:date];
    return formatDate;
}
+(NSString *)datePickerTransformationVacancyTime:(NSInteger)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd  HH:mm"];
    NSString *formatDate = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time/1000]];
    return formatDate;
}
+(NSDate *)dateTransformationStr:(NSString *)str{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *inputDate = [inputFormatter dateFromString:str];
    return inputDate;
}
+(NSDate *)dateTransformationStringWhiffletree:(NSString *)str{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *inputDate = [inputFormatter dateFromString:str];
    return inputDate;
}

+(NSString *)timestampTransformationTime:(int64_t)timestamp{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [dateFormatter stringFromDate:date];
}
+(NSInteger)dateCompareDateCurrentDate:(NSDate *)currentDate afferentDate:(NSDate *)afferentDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:currentDate];
    NSString *anotherDayStr = [dateFormatter stringFromDate:afferentDate];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //当前时间大于比较的时间
        return 1;
    }
    else if (result == NSOrderedAscending){
        //当前时间小于比较的时间
        return -1;
    }
    //当前时间等于比较的时间
    return 0;
}
/**
 * currentDate 你想重什么时候开始的天数  afferentDate 要比较的天数
 */
+(NSInteger)dateInteverCurrentDate:(NSDate *)currentDate afferentDate:(NSDate *)afferentDate{
    NSTimeInterval time = [currentDate timeIntervalSinceDate:afferentDate];
    NSInteger intervals = (NSInteger)time/(3600*24);
    return intervals;
}
@end


@implementation GZGApplicationTool (UIImages)
/**
 *生成二维码
 */
+ (CIImage *)createQRForString:(NSString *)qrString{
    // Need to convert the string to a UTF-8 encoded NSData object
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // Create the filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    // Send the image back
    return qrFilter.outputImage;
}
/**
 *把CIImage转成Image
 */

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // create a bitmap image that we'll draw into a bitmap context at the desired size;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // Create an image with the contents of our bitmap
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}
/**
 * 修改二维码颜色 待优化
 */

+ (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    // create context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // traverse pixe
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900){
            // change color
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = red; //0~255
            ptr[2] = green;
            ptr[1] = blue;
        }else{
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
    }
    // context to image
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    // release
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}
/**
 *压缩图片
 * @param  image  要压缩的图片
 * @param  size 要压缩的尺寸
 */
+ (UIImage *)compressFinishIsImages:(UIImage *)image scaledToSize:(CGSize)size{
    //    创建一个图形图像上下文
    UIGraphicsBeginImageContext(size);
    //    把图片换成新的尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //    得到新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 * 创建毛玻璃
 * @param  imageView  要做图片的毛玻璃
 */
+ (UIVisualEffectView *)woolGlassEatablishImage:(UIImageView *)imageView{
    //创建需要的毛玻璃特效类型
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    //毛玻璃的View试图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    //添加毛玻璃
    effectView.frame = imageView.bounds;
    effectView.alpha = 1;
    return effectView;
}

@end

@implementation GZGApplicationTool (NSArrays)
/**
 * 截取字符串
 * @param text 内容
 * @param interceptCharacter 要截取的字符串
 */

+ (NSArray *)interceptText:(NSString *)text interceptCharacter:(NSString *)interceptCharacter{
    NSArray *array = [text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:interceptCharacter]];
    return array;
}
/**
 * 转换字符为十六进制，在转为byte
 * @param str 要转换的字符  一定要等于两位字符，否则补足
 */

+ (Byte)byteTransformationTextSixteenByteStr:(NSString *)str{
    unsigned long red1 = strtoul([[str substringWithRange:NSMakeRange(0, str.length)] UTF8String],0,16);
    Byte byte =  (Byte) ((0xff & red1) );//( Byte) 0xff&iByte;
    return byte;
}
/**
 * 字符串拼接
 * @param strArr 要拆开拼接的字符串
 * @param mosiacSymbolStr 要连接在一起的字符
 * @param index 每次重第几个开始
 */

+ (NSMutableString *)stringMosiac:(NSString *)strArr mosiacSymbolStr:(NSString *)mosiacSybolStr index:(NSInteger)index{
    NSMutableString *string = [NSMutableString string];
    for (NSInteger i=0; i<strArr.length; i+=index) {
        NSString *str = [strArr substringWithRange: NSMakeRange(i, index)];
        if (i==strArr.length - index) {
            [string appendFormat:@"%@",str];
        }else{
            [string appendFormat:@"%@%@",str,mosiacSybolStr];
        }
    }
    return string;
}
/**
 * 字典转JSON
 */
+ (NSString *)jsonDataTransString:(NSDictionary *)dic{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
}
@end


