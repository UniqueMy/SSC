//
//  ComparePublicModel.m
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ComparePublicModel.h"

@implementation ComparePublicModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        _timesNumberString = [dict objectForKey:@"predata"];
        _publishString     = [dict objectForKey:@"number"];
        
    }
    return self;
}


@end
