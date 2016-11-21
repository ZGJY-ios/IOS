//
//  GZGSpecialPerformanceModel.h
//  ZGJY
//
//  Created by HX on 2016/11/15.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//  专场 Model

#import "JSONModel.h"

@interface GZGSpecialPerformanceModel : JSONModel
@property (nonatomic, copy) NSString * allocated_stock;
@property (nonatomic, copy) NSString * attribute_value0;
@property (nonatomic, copy) NSString * attribute_value1;
@property (nonatomic, copy) NSString * attribute_value10;
@property (nonatomic, copy) NSString * attribute_value11;
@property (nonatomic, copy) NSString * attribute_value12;
@property (nonatomic, copy) NSString * attribute_value13;
@property (nonatomic, copy) NSString * attribute_value14;
@property (nonatomic, copy) NSString * attribute_value15;
@property (nonatomic, copy) NSString * attribute_value16;
@property (nonatomic, copy) NSString * attribute_value17;
@property (nonatomic, copy) NSString * attribute_value18;
@property (nonatomic, copy) NSString * attribute_value19;
@property (nonatomic, copy) NSString * attribute_value2;
@property (nonatomic, copy) NSString * attribute_value3;
@property (nonatomic, copy) NSString * attribute_value4;
@property (nonatomic, copy) NSString * attribute_value5;
@property (nonatomic, copy) NSString * attribute_value6;
@property (nonatomic, copy) NSString * attribute_value7;
@property (nonatomic, copy) NSString * attribute_value8;
@property (nonatomic, copy) NSString * attribute_value9;
@property (nonatomic, assign) NSInteger brand_id;  // 品牌ID
@property (nonatomic, copy) NSString * cost;
@property (nonatomic, copy) NSString * create_by;
@property (nonatomic, copy) NSString * creation_date;
@property (nonatomic) BOOL delete_flag;
@property (nonatomic, copy) NSString * full_name;
@property (nonatomic, assign) NSInteger goods_id; // 商品ID
@property (nonatomic, assign) NSInteger hits;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * introduction;
@property (nonatomic) BOOL is_gift;
@property (nonatomic) BOOL is_list;
@property (nonatomic) BOOL is_marketable;
@property (nonatomic) BOOL is_top;
@property (nonatomic, copy) NSString * keyword;
@property (nonatomic, copy) NSString * last_updated_by;
@property (nonatomic, copy) NSString * last_updated_date;
@property (nonatomic, assign) CGFloat market_price;
@property (nonatomic, copy) NSString * memo;
@property (nonatomic, assign) NSInteger month_hits;
@property (nonatomic, copy) NSString * month_hits_date;
@property (nonatomic, assign) NSInteger month_sales;
@property (nonatomic, copy) NSString * month_sales_date;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger point;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger product_category_id;
@property (nonatomic, copy) NSString * qprice;
@property (nonatomic, copy) NSString * qsum;
@property (nonatomic, assign) NSInteger sales;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger score_count;
@property (nonatomic, copy) NSString * seo_description;
@property (nonatomic, copy) NSString * seo_keywords;
@property (nonatomic, copy) NSString * seo_title;
@property (nonatomic, copy) NSString * sn;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, copy) NSString * stock_memo;
@property (nonatomic, assign) NSInteger total_score;
@property (nonatomic, copy) NSString * unit;
@property (nonatomic, assign) NSInteger week_hits;
@property (nonatomic, copy) NSString * week_hits_date;
@property (nonatomic, assign) NSInteger week_sales;
@property (nonatomic, copy) NSString * week_sales_date;
@property (nonatomic, assign) CGFloat weight;

+ (instancetype)specialPerformanceWithDict:(NSDictionary *)dict;
@end
