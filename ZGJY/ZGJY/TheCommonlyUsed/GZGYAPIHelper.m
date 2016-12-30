//
//  GZGYAPIHelper.m
//  ZGJY
//
//  Created by YYS on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAPIHelper.h"
#import "GZGYDetailsModel.h"
@implementation GZGYAPIHelper
+ (instancetype)shareAPIHelper{
    static GZGYAPIHelper *help = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        help = [[GZGYAPIHelper alloc]init];
    });
    return help;
}
#pragma mark --首页banner
- (void)homeBannerDatazSuccess:(void (^)(NSDictionary *dict))result{
    NSString *url = @"app/FindList";
    [ZGNetWork GETRequestMethodUrl:url parameters:nil success:^(id responseObject, NSInteger task) {
        result(responseObject);
    } failure:^(NSError *failure, NSInteger task) {
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --首页pageIcon
- (void)homePageIconDataSuccess:(void (^)(NSDictionary *dict))result{
    NSString *url = @"app/Index";
    [ZGNetWork GETRequestMethodUrl:url parameters:nil success:^(id responseObject, NSInteger task) {
        result(responseObject);
    } failure:^(NSError *failure, NSInteger task) {
        GZGLog(@"%@",failure);
    }];
}

#pragma mark ---限时特卖
- (void)LimitedTimeSaleDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    NSString *url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"LimitsIndex"];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"限时特卖%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
- (void)AllLimitedTimeSaleDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    NSString *url = [NSString stringWithFormat:@"%@",DetailsTopic];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"所有限时特卖%@",responseObject);
        NSArray * limitArray = responseObject[@"page"][@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
#pragma mark --- 火力拼团
-(void)SpellGroupDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    [SVProgressHUD show];
    
    NSString *url = @"app/SpellGrouipIndex";
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"火力拼团%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
//母婴用品接口
- (void)specialPerformanceDict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed {
    
    NSString *url = @"appTopic/baby";
    
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        NSDictionary * dict = [NSDictionary dictionaryWithDictionary:responseObject[@"page"]];
        NSArray * array = dict[@"list"];
        result(array);
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
    }];
}


//国家馆接口
- (void)pavilionCountries:(NSInteger)countries dict:(NSDictionary *)dict finish:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed {
//    http://192.168.0.110:8080/appTopic/App?tagIds=3&&productCategoryId=0
    NSString *url = @"appTopic/App";;
//    switch (countries) {
//        case CountriesEnterThe_SouthKorea: {
//            // 韩国
//            url = [NSString stringWithFormat:@"appTopic/App"];
//        }
//            break;
//        case CountriesEnterThe_Japan: {
//            // 日本
//            url = [NSString stringWithFormat:@"appTopic/App"];
//        }
//            break;
//        case CountriesEnterThe_Australia: {
//            // 澳大利亚
//            url = [NSString stringWithFormat:@"appTopic/Aussie"];
//        }
//            break;
//        case CountriesEnterThe_TheEuropean: {
//            // 欧洲
//            url = [NSString stringWithFormat:@"appTopic/Europe"];
//        }
//            break;
//
//        default:
//            break;
//    }
    
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        NSDictionary * dict = [NSDictionary dictionaryWithDictionary:responseObject[@"page"]];
        NSArray * array = dict[@"list"];
        result(array);
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
    }];
}
#pragma mark - 搜索列表
// 搜索列表
- (void)searchDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"appTopic/AppSearch";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject[@"page"][@"list"]);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
// 购物车列表
- (void)cartListURL:(NSString *)url dict:(NSDictionary *)dict finished:(void(^)(NSArray * goods))result failed:(void(^)(NSError * error))failed {
    
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        NSArray * array = responseObject[@"cart"];
        result(array);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark --- 商品详情接口
- (void)DetailssTimeSaleCountries:(NSInteger)countries Dict:(NSDictionary *)dict Finsh:(void (^)(NSArray * dataArray))result
{
    NSString *url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppFindProduct"];
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"商品详情%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
// 添加到购物车
- (void)addToCartURL:(NSString *)url Dict:(NSDictionary *)dict Finished:(void(^)(NSArray * carts))result failed:(void(^)(NSError * error))failed {
    
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        GZGLog(@"添加到购物车：%@",responseObject);
        result(nil);
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        GZGLog(@"添加购物车失败:%@",failure);
    }];
}
// 删除购物车商品
- (void)deleteToCartURL:(NSString *)url Dict:(NSDictionary *)dict Finished:(void(^)(NSArray * carts))result failed:(void(^)(NSError * error))failed {
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        GZGLog(@"删除购物车商品content:%@",responseObject[@"message"][@"content"]);
        GZGLog(@"删除购物车商品type:%@",responseObject[@"message"][@"type"]);
        result(nil);
    } failure:^(NSError *failure, NSInteger task) {
        GZGLog(@"删除购物车商品失败:%@",failure);
    }];
}
#pragma mark --- 检查用户名接口
-(void)UserNameDict:(NSDictionary *)dict Finsh:(void (^)(NSString * string,NSString * contentString))result
{
    
    NSString *url = @"appRegister/checkUsername";
    
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"检查用户名%@",responseObject);
        NSString * nameString= [NSString stringWithFormat:@"%@",responseObject[@"content"]];
        NSString * typeString = [NSString stringWithFormat:@"%@",responseObject[@"type"]];
        result(nameString,typeString);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --- 检查邮箱接口
-(void)EmailsDict:(NSDictionary *)dict Finsh:(void (^)(NSString * string,NSString * contentString))result
{
    NSString *url = @"appRegister/checkEmail";
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"检查邮箱%@",responseObject);
        NSString * nameString= [NSString stringWithFormat:@"%@",responseObject[@"content"]];
        NSString * typeString = [NSString stringWithFormat:@"%@",responseObject[@"type"]];
        result(nameString,typeString);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --- 邮箱注册接口
-(void)EmailsRegisterDict:(NSDictionary *)dict Finsh:(void (^)(NSString * idString,NSString * typeString,NSString * content))result
{
    NSString *url = @"appRegister/submit";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"邮箱注册%@",responseObject);
        NSString * IDstring = [NSString stringWithFormat:@"%@",responseObject[@"id"]];
        NSString * TypeString = [NSString stringWithFormat:@"%@",responseObject[@"type"]];
        NSString * contentString = [NSString stringWithFormat:@"%@",responseObject[@"content"]];
        result(IDstring,TypeString,contentString);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}
#pragma mark --- 登录接口
-(void)LoginDict:(NSDictionary *)dict Between:(NSString *)line Finsh:(void (^)(NSString * string,NSString * typeString,NSString * content,NSString * username,NSString * password))result
{
    NSString *url = @"appLogin/submit";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        GZGLog(@"登录%@",responseObject);
        NSString * idString = [NSString stringWithFormat:@"%@",responseObject[@"id"]];
        NSString * TypeString = [NSString stringWithFormat:@"%@",responseObject[@"type"]];
        NSString * contentString = [NSString stringWithFormat:@"%@",responseObject[@"content"]];
        NSString * nameString = [NSString stringWithFormat:@"%@",responseObject[@"username"]];
        NSString *password = [NSString stringWithFormat:@"%@",responseObject[@"password"]];
        result(idString,TypeString,contentString,nameString,password);
    } failure:^(NSError *failure, NSInteger task) {
        if ([line isEqualToString:@"0"]) {
            GZGLog(@"%@",failure);
        }else{
            [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
            GZGLog(@"%@",failure);
        }
    }];
}
#pragma mark - 添加地址
// 添加地址
- (void)addAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appReceiver/save";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 编辑地址
// 编辑地址
- (void)editorAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appReceiver/edit";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 更新地址
// 更新地址
- (void)updateAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appReceiver/update";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 地址列表
// 地址列表
- (void)addressListDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appReceiver/list";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject[@"page"][@"list"]);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 删除地址
// 删除地址
- (void)deleteAddressDict:(NSDictionary *)dict Finsh:(void (^)(NSArray *array))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appReceiver/delete";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 确认订单
// 确认订单
- (void)makeSureOrderDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appOrder/info";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 提交订单
// 提交订单
- (void)submitOrderDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appOrder/create";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 确认支付
// 确认支付
- (void)confirmPaymentDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appOrder/payment";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 添加收藏
// 添加收藏
- (void)addCollectionDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appFavorite/add";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - 收藏列表
// 收藏列表
- (void)collectionListDict:(NSDictionary *)dict Finsh:(void (^)(id responseObject))result failed:(void(^)(NSError * error))failed {
    NSString * url = @"member/appFavorite/list";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSError *failure, NSInteger task) {
        failed(failure);
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - 健康保健   居家日用 护肤美妆 母婴专区
- (void)homeCategoryIconData:(NSString *)cateS result:(void (^)(NSDictionary *dict))result{
    NSString *url = [NSString stringWithFormat:@"app/%@",cateS];
    [ZGNetWork GETRequestMethodUrl:url parameters:nil success:^(id responseObject, NSInteger task) {
        result(responseObject);
    } failure:^(NSError *failure, NSInteger task) {
        GZGLog(@"%@",failure);
    }];
}



#pragma mark --- 删除收藏
- (void)delegateCollectionListDict:(NSDictionary *)dict Finsh:(void (^)(NSString * dataString))result
{
    NSString * url = @"member/appFavorite/delete";
    [SVProgressHUD show];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        result(responseObject);
        [SVProgressHUD dismiss];
//        [SVProgressHUD setStatus:@"删除成功"];
        NSLog(@"删除收藏%@",responseObject);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        GZGLog(@"%@",failure);
    }];
}

#pragma mark --- 一级分类
- (void)oneClassificationDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * listArray))result
{
    [SVProgressHUD show];
    NSString *url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppProductCategory2"];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"一级分类%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
#pragma mark --- 二级分类
-(void)secondClassificationDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * listArray))result
{
    [SVProgressHUD show];
    NSString *url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppProductCategory3"];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"二级分类%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
#pragma mark --- 品牌
- (void)brandListDict:(NSDictionary *)dict Finsh:(void (^)(NSArray * listArray))result
{
    [SVProgressHUD show];
    NSString *url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppfindBrand"];
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
//        GZGLog(@"品牌%@",responseObject);
        NSLog(@"品牌%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];
}
#pragma mark --- 商品列表
- (void)shopListDict:(NSDictionary *)dict ClassOrBrand:(NSString *)stateString Finsh:(void (^)(NSArray * listArray))result
{
    [SVProgressHUD show];
    NSString *url;
    if ([stateString isEqualToString:@"分类"]) {
        url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppProduct"];
    }else{
        url = [NSString stringWithFormat:@"%@%@",CountriesTopic,@"AppfindBrandProduct"];
    }
    [ZGNetWork POSTRequestMethodUrl:url parameters:dict success:^(id responseObject, NSInteger task) {
        [SVProgressHUD dismiss];
        GZGLog(@"列表%@",responseObject);
        NSArray * limitArray = responseObject[@"list"];
        result(limitArray);
    } failure:^(NSError *failure, NSInteger task) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
        NSLog(@"%@",failure);
    }];

}
@end
