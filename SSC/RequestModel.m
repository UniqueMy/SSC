//
//  RequestModel.m
//  SSC
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "RequestModel.h"
#import "MainModel.h"


@implementation RequestModel

- (void)startRequestDataWithCQSSCWithUrl:(NSString *)url {
    
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
       // NSLog(@"responseObject %@",responseObject);
        
        [self startResolveDataWithDictionary:responseObject];
        
    }];
    
    
}

- (void)startResolveDataWithDictionary:(NSDictionary *)dict {
    
    NSArray *dataArray          = [dict objectForKey:@"result"];
    NSMutableArray *returnArray = [NSMutableArray array];
    NSDictionary *returnDict    = @{@"turn":[dict objectForKey:@"yes"],
                                    @"false":[dict objectForKey:@"no"]};
    
    
    for (NSDictionary *dict in dataArray) {
         MainModel *mainModel = [[MainModel alloc] initWithDict:dict];
        [returnArray addObject:mainModel];
    }
    
    self.returnBlock(returnArray,returnDict);
    
}

@end
