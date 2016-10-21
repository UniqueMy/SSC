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
        
        [self startResolveDataWithDictionary:responseObject];
        
    }];
    
    
}

- (void)startResolveDataWithDictionary:(NSDictionary *)dict {
    
    NSArray *dataArray          = [dict objectForKey:@"result"];
    NSMutableArray *returnArray = [NSMutableArray array];
    
    int oddNumber = 0;
    
    for (NSDictionary *dict in dataArray) {
         MainModel *mainModel = [[MainModel alloc] initWithDict:dict];
        [returnArray addObject:mainModel];
        
        if (mainModel.oddOrEven == 1) {
            oddNumber ++;
        }
        
    }
    
    NSString *oddNumberString  = [NSString stringWithFormat:@"%d",oddNumber];
    NSString *evenNumberString = [NSString stringWithFormat:@"%d",(int)dataArray.count - oddNumber];
    
    
    NSDictionary *returnDict    = @{@"yes" :[dict objectForKey:@"yes"],
                                    @"no"  :[dict objectForKey:@"no"],
                                    @"odd" :oddNumberString,
                                    @"even":evenNumberString};
    
    
    self.ReturnValueDict(returnDict);
    self.returnBlock(returnArray);
    
}

@end
