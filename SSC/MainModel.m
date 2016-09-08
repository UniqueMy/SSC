//
//  MainModel.m
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        _timesNumberString     = [NSString stringWithFormat:@"%@%@",array[0],array[2]];
        NSArray *separateArray = [array[3] componentsSeparatedByString:@","];
        
       
        NSString *publish = @"";
        int total         = 0;
        
        for (NSString *string in separateArray)
        {
            int number = [string intValue];
            total = total + number;
            publish = [NSString stringWithFormat:@"%@%@",publish,string];
        }
        
        _totalString   = [NSString stringWithFormat:@"%d",total];
        _publishString = publish;
        _number = array[2];
        
    }
    return self;
}


@end
