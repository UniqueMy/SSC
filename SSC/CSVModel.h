//
//  CSVModel.h
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSVModel : NSObject

@property (nonatomic,strong) NSMutableArray  *fiveStarArray;
@property (nonatomic,strong) NSMutableArray  *threeStarArray;
@property (nonatomic,strong) NSMutableArray  *groupThreeArray;
+ (instancetype)sharedModelManager;
@end
