//
//  RequestViewModel.m
//  SSC
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "RequestViewModel.h"

@implementation RequestViewModel


-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock Dict:(ReturnValueDict)ReturnValueDict{
    
    _returnBlock     = returnBlock;
    _ReturnValueDict = ReturnValueDict;
}

@end
