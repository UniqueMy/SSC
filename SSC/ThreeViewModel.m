//
//  ThreeViewModel.m
//  SSC
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ThreeViewModel.h"

@implementation ThreeViewModel

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock Dict:(ReturnValueDict)ReturnValueDict{
    
    _returnBlock     = returnBlock;
    _ReturnValueDict = ReturnValueDict;
}

@end
