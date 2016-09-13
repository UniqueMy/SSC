//
//  DanmaModel.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DanmaModel.h"
#import "DanmaPublicModel.h"
@implementation DanmaModel

- (void)startRequestDataWithDanMaWithUrl:(NSString *)url {
    
    [HttpTool postWithUrl:url params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        [self startResolveDataWithDictionary:responseObject];
        
    }];
    
    
}

- (void)startResolveDataWithDictionary:(NSDictionary *)dict {
    
    NSArray *dataArray          = [dict objectForKey:@"data"];
    NSMutableArray *returnArray = [NSMutableArray array];
    
    NSDictionary *returnDict    = @{@"pre_yes":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"pre"] objectForKey:@"yes"]],
                                    @"pre_no":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"pre"] objectForKey:@"no"]],
                                    @"mid_yes":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"mid"] objectForKey:@"yes"]],
                                    @"mid_no":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"mid"] objectForKey:@"no"]],
                                    @"last_yes":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"last"] objectForKey:@"yes"]],
                                    @"last_no":[NSString stringWithFormat:@"%@",[[dict objectForKey:@"last"] objectForKey:@"no"]]};
    
    
    for (NSDictionary *dict in dataArray) {
        
        DanmaPublicModel *publicModel = [[DanmaPublicModel alloc] initWithDict:dict];
        [returnArray addObject:publicModel];
    }
    
    self.returnBlock(returnArray);
    self.ReturnValueDict(returnDict);
    
}


@end
