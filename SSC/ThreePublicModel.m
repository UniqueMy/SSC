//
//  ThreePublicModel.m
//  SSC
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ThreePublicModel.h"

@implementation ThreePublicModel

- (instancetype)initWithDict:(NSDictionary *)dict;
{
    self = [super init];
    if (self) {
     
        _pre_num     = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"pre_num"] objectForKey:@"number"]];
        _pre_result  = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"pre_num"] objectForKey:@"result"]];
        
        _mid_num     = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"mid_num"] objectForKey:@"number"]];
        _mid_result  = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"mid_num"] objectForKey:@"result"]];
        
        _last_num    = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"last_num"] objectForKey:@"number"]];
        _last_result = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"last_num"] objectForKey:@"result"]];
        
        
    }
    return self;
}


@end
