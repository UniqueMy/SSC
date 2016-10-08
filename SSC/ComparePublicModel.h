//
//  ComparePublicModel.h
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComparePublicModel : NSObject

@property (nonatomic,strong) NSString *timesNumberString; // 期数
@property (nonatomic,strong) NSString *publishString;     // 开奖结果



- (instancetype)initWithDict:(NSDictionary *)dict;

@end
