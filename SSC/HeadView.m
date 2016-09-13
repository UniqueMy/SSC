//
//  HeadView.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView
{
   
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BaseGryColor;

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
    bottomLine.frame    = CGRectMake(0, Adaptive(59), viewWidth, Adaptive(1));
    bottomLine.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomLine];
    
    CGFloat labelWidth = viewWidth / 4;
    
    UILabel *timesNumberLabel = [[UILabel alloc] init];
    timesNumberLabel.frame    = CGRectMake(0, 0, labelWidth, Adaptive(60));
    timesNumberLabel.text     = @"期号";
    timesNumberLabel.textAlignment = 1;
    timesNumberLabel.textColor = [UIColor blackColor];
    timesNumberLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:timesNumberLabel];
    
    UILabel *publishLabel = [[UILabel alloc] init];
    publishLabel.frame    = CGRectMake(CGRectGetMaxX(timesNumberLabel.frame), 0, labelWidth, Adaptive(60));
    publishLabel.text     = @"开奖号码";
    publishLabel.textAlignment = 1;
    publishLabel.textColor = [UIColor blackColor];
    publishLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:publishLabel];
    
    UILabel *totalLabel = [[UILabel alloc] init];
    totalLabel.frame    = CGRectMake(CGRectGetMaxX(publishLabel.frame), 0, labelWidth, Adaptive(60));
    totalLabel.text     = @"和值";
    totalLabel.textAlignment = 1;
    totalLabel.textColor = [UIColor blackColor];
    totalLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:totalLabel];
    
    
    _YLabel = [[UILabel alloc] init];
    _YLabel.frame    = CGRectMake(CGRectGetMaxX(totalLabel.frame), Adaptive(1), labelWidth, Adaptive(28.5));
//YLabel.text = @"hahaha";
    _YLabel.textAlignment = 1;
    _YLabel.textColor = [UIColor blackColor];
    _YLabel.backgroundColor = [UIColor colorWithRed:0 green:177/255.0 blue:88/255.0 alpha:1];
    _YLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:_YLabel];
    
    
    
    
    _NLabel = [[UILabel alloc] init];
    _NLabel.frame    = CGRectMake(CGRectGetMaxX(totalLabel.frame),CGRectGetMaxY(_YLabel.frame) + Adaptive(1), labelWidth, Adaptive(28.5));
    
    _NLabel.textAlignment = 1;
    _NLabel.textColor = [UIColor blackColor];
    _NLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:_NLabel];
    
    
    
//    
    for (int a = 0; a < 3; a++) {
        UILabel *line = [[UILabel alloc] init];
        line.frame    = CGRectMake(labelWidth *(a + 1), 0, Adaptive(1), Adaptive(60));
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
    }
    
   
    
    
}



@end
