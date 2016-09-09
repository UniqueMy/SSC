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
    UILabel *YLabel;
    UILabel *NLabel;
}
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
    
    
    YLabel = [[UILabel alloc] init];
    YLabel.frame    = CGRectMake(CGRectGetMaxX(totalLabel.frame), Adaptive(1), labelWidth, Adaptive(28.5));
   
    YLabel.textAlignment = 1;
    YLabel.textColor = [UIColor blackColor];
    YLabel.backgroundColor = [UIColor colorWithRed:0 green:177/255.0 blue:88/255.0 alpha:1];
    YLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:YLabel];
    
    
    
    
    NLabel = [[UILabel alloc] init];
    NLabel.frame    = CGRectMake(CGRectGetMaxX(totalLabel.frame),CGRectGetMaxY(YLabel.frame) + Adaptive(1), labelWidth, Adaptive(28.5));
    
    NLabel.textAlignment = 1;
    NLabel.textColor = [UIColor blackColor];
    NLabel.font      = [UIFont systemFontOfSize:Adaptive(14)];
    [self addSubview:NLabel];
    
    
    
//    NSArray *textArray = @[@"开奖号码",@"和值",@"Y(120)/N(120)"];
//    
    for (int a = 0; a < 3; a++) {
        UILabel *line = [[UILabel alloc] init];
        line.frame    = CGRectMake(labelWidth *(a + 1), 0, Adaptive(1), Adaptive(60));
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
    }
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
     YLabel.text     = [NSString stringWithFormat:@"Y:%d",_successNumber];
    NLabel.text     = [NSString stringWithFormat:@"N:%d",240 - _successNumber];
}

@end
