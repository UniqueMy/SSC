//
//  RequestViewModel.h
//  SSC
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ReturnValueDict) (NSDictionary *dict);

@interface RequestViewModel : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ReturnValueDict  ReturnValueDict;
- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock Dict:(ReturnValueDict)ReturnValueDict;

@end
