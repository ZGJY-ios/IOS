//
//  GZGShoppingCartModel.h
//  ZGJY
//
//  Created by HX on 2016/12/7.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "JSONModel.h"

@interface GZGShoppingCartModel : JSONModel

@end

@interface GZGCartModel : JSONModel
@property (nonatomic, copy) NSString *ids;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger quantity;
+ (instancetype)cartWithDict:(NSDictionary *)dict;
@end

@interface GZGOrderModel : JSONModel
@property (nonatomic, assign) CGFloat amount_paid;
@property (nonatomic, assign) CGFloat coupon_discount;
@property (nonatomic, assign) CGFloat fee;
@property (nonatomic, assign) CGFloat freight;  // 运费
@property (nonatomic) BOOL is_invoice;
@property (nonatomic, assign) CGFloat member_id;
@property (nonatomic, copy) NSString * memo;
@property (nonatomic, assign) CGFloat offset_amount;
@property (nonatomic, assign) CGFloat order_status;
@property (nonatomic, assign) CGFloat payment_status;
@property (nonatomic, assign) CGFloat point;
@property (nonatomic, assign) CGFloat promotion_discount;
@property (nonatomic, assign) CGFloat shipping_status;
@property (nonatomic, assign) CGFloat tax;
+ (instancetype)orderWithDict:(NSDictionary *)dict;
@end

@interface GZGCourierModel : JSONModel
@property (nonatomic, assign) CGFloat continue_price;
@property (nonatomic, assign) CGFloat continue_weight;
@property (nonatomic, copy) NSString * create_by;
@property (nonatomic, copy) NSString * creation_date;
@property (nonatomic, assign) CGFloat default_delivery_corp_id;
@property (nonatomic) BOOL delete_flag;
@property (nonatomic, copy) NSString * description;
@property (nonatomic, assign) CGFloat first_price;
@property (nonatomic, assign) CGFloat first_weight;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * ids;
@property (nonatomic, copy) NSString * last_updated_by;
@property (nonatomic, copy) NSString * last_updated_date;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) CGFloat orders;
+ (instancetype)courierWithDict:(NSDictionary *)dict;
@end
@interface GZGPayModel : JSONModel
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * create_by;
@property (nonatomic, copy) NSString * creation_date;
@property (nonatomic) BOOL delete_flag;
@property (nonatomic, copy) NSString * description;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * ids;
@property (nonatomic, copy) NSString * last_updated_by;
@property (nonatomic, copy) NSString * last_updated_date;
@property (nonatomic, assign) CGFloat method;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) CGFloat orders;
@property (nonatomic, assign) CGFloat timeout;
+ (instancetype)payWithDict:(NSDictionary *)dict;
@end
