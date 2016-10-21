//
//  MainModel.h
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

// 重庆
@property (nonatomic,strong) NSString *timesNumberString; // 期数
@property (nonatomic,strong) NSString *totalString;       // 和值
@property (nonatomic,strong) NSString *publishString;     // 开奖结果
@property (nonatomic)        BOOL      trueOrFalse;       // 中与没中
@property (nonatomic)        BOOL      oddOrEven;         // 奇数和还是偶数和

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
