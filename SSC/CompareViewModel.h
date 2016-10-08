//
//  CompareViewModel.h
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);



@interface CompareViewModel : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;

- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock;

@end
