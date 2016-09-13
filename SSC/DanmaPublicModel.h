//
//  DanmaPublicModel.h
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DanmaPublicModel : NSObject

@property (nonatomic,strong) NSString *timesNumberString;
@property (nonatomic,strong) NSString *publishString;

@property (nonatomic,strong) NSString *pre_num;
@property (nonatomic,strong) NSString *pre_danma;
@property (nonatomic,strong) NSString *pre_result;

@property (nonatomic,strong) NSString *mid_num;
@property (nonatomic,strong) NSString *mid_danma;
@property (nonatomic,strong) NSString *mid_result;

@property (nonatomic,strong) NSString *last_num;
@property (nonatomic,strong) NSString *last_danma;
@property (nonatomic,strong) NSString *last_result;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
