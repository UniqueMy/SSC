//
//  MainModel.m
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        _timesNumberString = [dict objectForKey:@"predata"];
        _totalString       = [dict objectForKey:@"num"];
        _publishString     = [dict objectForKey:@"result"];
        _trueOrFalse       = [[dict objectForKey:@"compare_result"] boolValue];
        
    }
    return self;
}


@end
