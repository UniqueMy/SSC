//
//  CSVModel.m
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CSVModel.h"

@implementation CSVModel

+ (instancetype)sharedModelManager {
    static dispatch_once_t onceToken;
    static CSVModel* model;
    
    dispatch_once(&onceToken, ^{
        model = [[CSVModel alloc] init];
    });
    
    return model;
}

@end
