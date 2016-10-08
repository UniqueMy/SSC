//
//  CompareModel.m
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CompareModel.h"
#import "ComparePublicModel.h"

@implementation CompareModel


- (void)startRequestDataWithCQSSCWithUrl:(NSString *)url {
    
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        [self startResolveDataWithArray:responseObject];
        
    }];
    
    
}

- (void)startResolveDataWithArray:(NSArray *)array {
    
   
    NSMutableArray *returnArray = [NSMutableArray array];
        
    for (NSDictionary *dict in array) {
        ComparePublicModel *mainModel = [[ComparePublicModel alloc] initWithDict:dict];
        [returnArray addObject:mainModel];
    }
    
   
    self.returnBlock(returnArray);
    
}


@end
