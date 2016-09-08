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
@property (nonatomic,strong) NSString *timesNumberString;
@property (nonatomic,strong) NSString *totalString;
@property (nonatomic,strong) NSString *publishString;
@property (nonatomic,strong) NSString *number;

- (instancetype)initWithArray:(NSArray *)array;
@end
