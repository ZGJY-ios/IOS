//
//  GZGYAPIHelper.h
//  ZGJY
//
//  Created by YYS on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,CountriesEnterThe) {
    CountriesEnterThe_SouthKorea = 0,                       //韩国
    CountriesEnterThe_Japan,                                //日本
    CountriesEnterThe_Australia,                            //澳大利亚
    CountriesEnterThe_TheEuropean                           //欧洲
};

typedef NS_ENUM(NSInteger, GoodsDetails) {
    GoodsDetailsMaternalAndInfant,  // 母婴
    GoodsDetailsWashProtect, // 洗护
    GoodsDetailsLimited, // 限时抢购
    GoodsDetailsFireAlsoGroup, // 火力拼团
    GoodsDetailsKorea, // 韩国馆
    GoodsDetailsJapan, // 日本馆
    GoodsDetailsEurope, // 欧洲馆
    GoodsDetailsAussie, // 澳洲馆
};


@interface GZGYAPIHelper : NSObject
+ (instancetype)shareAPIHelper;
//限时特卖接口
- (void)LimitedTimeSaleDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//火力拼团接口
-(void)SpellGroupDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//母婴用品接口
- (void)specialPerformanceDict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed;
//国家馆接口
- (void)pavilionCountries:(NSInteger)countries dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed;
// 购物车列表
- (void)cartListURL:(NSString *)url dict:(NSDictionary *)dict finished:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed;
// 添加到购物车
- (void)addToCartURL:(NSString *)url Dict:(NSDictionary *)dict Finished:(void(^)(NSArray * carts))result failed:(void(^)(NSError * error))failed;
// 删除购物车商品
- (void)deleteToCartURL:(NSString *)url Dict:(NSDictionary *)dict Finished:(void(^)(NSArray * carts))result failed:(void(^)(NSError * error))failed;
//商品详情接口
- (void)DetailssTimeSaleCountries:(NSInteger)countries Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result;
//检查用户名接口
-(void)UserNameDict:(NSDictionary *)dict Finsh:(void (^)(NSString * string,NSString * contentString))result;
//检查邮箱接口
-(void)EmailsDict:(NSDictionary *)dict Finsh:(void (^)(NSString * string,NSString * contentString))result;
//邮箱注册接口
-(void)EmailsRegisterDict:(NSDictionary *)dict Finsh:(void (^)(NSString * idString,NSString * typeString,NSString * content))result;
//登录接口
-(void)LoginDict:(NSDictionary *)dict Between:(NSString *)line Finsh:(void (^)(NSString * string,NSString * typeString,NSString * content,NSString * username,NSString * password))result;
// 地址列表
- (void)addressListDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed;
// 编辑地址
- (void)editorAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed;
// 添加地址
- (void)addAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed;
// 更新地址
- (void)updateAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed;
// 删除地址
- (void)deleteAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed;
// 确认订单
- (void)makeSureOrderDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed;
// 提交订单
- (void)submitOrderDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed;
// 添加收藏
- (void)addCollectionDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed;
// 收藏列表
- (void)collectionListDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed;
@end
