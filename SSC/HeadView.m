//
//  HeadView.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:217/255.0 green:223/255.0 blue:231/255.0 alpha:1];
        [self createMainView];
    }
    return self;
}

- (void)createMainView {
    
    UILabel *topLine = [[UILabel alloc] init];
    topLine.frame    = CGRectMake(0, 0, viewWidth, Adaptive(1));
    topLine.backgroundColor = [UIColor grayColor];
    [self addSubview:topLine];
    
    UILabel *bottomLine = [[UILabel alloc] init];
    bottomLine.frame    = CGRectMake(0, Adaptive(29), viewWidth, Adaptive(1));
    bottomLine.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomLine];
    
    CGFloat labelWidth = (viewWidth - Adaptive(100)) / 4;
    
    UILabel *timesNumberLabel = [[UILabel alloc] init];
    timesNumberLabel.frame    = CGRectMake(0, 0, Adaptive(100), Adaptive(30));
    timesNumberLabel.text     = @"期号";
    timesNumberLabel.textAlignment = 1;
    timesNumberLabel.textColor = [UIColor blackColor];
    timesNumberLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:timesNumberLabel];
    
    NSArray *textArray = @[@"开奖号码",@"和值",@"Y/N",@"240"];
    
    for (int a = 0; a < 4; a++) {
        UILabel *line = [[UILabel alloc] init];
        line.frame    = CGRectMake(Adaptive(100) + labelWidth *a, 0, Adaptive(1), Adaptive(30));
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame    = CGRectMake(Adaptive(100) + labelWidth *a, 0,labelWidth, Adaptive(30));
        label.text     = textArray[a];
        label.textColor= [UIColor blackColor];
        label.textAlignment = 1;
        label.font = [UIFont systemFontOfSize:Adaptive(14)];
        [self addSubview:label];
    }
    
    
}
@end
