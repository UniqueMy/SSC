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
@property (nonatomic,strong) NSMutableArray  *fiveStarOddArray;
@property (nonatomic,strong) NSMutableArray  *fiveStarEvenArray;
+ (instancetype)sharedModelManager;
@end
