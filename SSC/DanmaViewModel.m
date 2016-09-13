//
//  DanmaViewModel.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DanmaViewModel.h"

@implementation DanmaViewModel

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock Dict:(ReturnValueDict)ReturnValueDict{
    
    _returnBlock     = returnBlock;
    _ReturnValueDict = ReturnValueDict;
}


@end
