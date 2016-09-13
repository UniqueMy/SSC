//
//  DMHeadView.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DMHeadView.h"

@implementation DMHeadView

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
    topLine.frame    = CGRectMake(0, 0, viewWidth, Adaptive(.5));
    topLine.backgroundColor = [UIColor grayColor];
    [self addSubview:topLine];
    
    UILabel *bottomLine = [[UILabel alloc] init];
    bottomLine.frame    = CGRectMake(0, Adaptive(59.5), viewWidth, Adaptive(.5));
    bottomLine.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomLine];
    
    // 期数
    UILabel *timesNumberLabel = [[UILabel alloc] init];
    timesNumberLabel.frame    = CGRectMake(0, 0, Adaptive(48), Adaptive(60));
    timesNumberLabel.text     = @"期数";
    timesNumberLabel.textAlignment = 1;
    timesNumberLabel.numberOfLines = 2;
    timesNumberLabel.textColor = [UIColor blackColor];
    timesNumberLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:timesNumberLabel];
    
    UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(timesNumberLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line1.backgroundColor = [UIColor grayColor];
    [self addSubview:line1];
    
    // 开奖号码
    UILabel *publishLabel = [[UILabel alloc] init];
    publishLabel.frame    = CGRectMake(CGRectGetMaxX(line1.frame), 0, Adaptive(42), Adaptive(60));
    publishLabel.text     = @"开奖码";
    publishLabel.textAlignment = 1;
    publishLabel.textColor = [UIColor blackColor];
    publishLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:publishLabel];
    
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(publishLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line2.backgroundColor = [UIColor grayColor];
    [self addSubview:line2];
    
    // 前三
    UILabel *pre_numLabel = [[UILabel alloc] init];
    pre_numLabel.frame    = CGRectMake(CGRectGetMaxX(line2.frame), 0, Adaptive(28), Adaptive(60));
    pre_numLabel.text     = @"前三";
    pre_numLabel.textAlignment = 1;
    pre_numLabel.textColor = [UIColor blackColor];
    pre_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_numLabel];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_numLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line3.backgroundColor = [UIColor grayColor];
    [self addSubview:line3];
    
    // 前三胆码
    UILabel *pre_damaLabel = [[UILabel alloc] init];
    pre_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line3.frame), 0, Adaptive(28), Adaptive(60));
    pre_damaLabel.text     = @"胆码";
    pre_damaLabel.textAlignment = 1;
    pre_damaLabel.textColor = [UIColor blackColor];
    pre_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_damaLabel];
    
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_damaLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line4.backgroundColor = [UIColor grayColor];
    [self addSubview:line4];
    
    // 前三胆码中否
    _pre_resultY = [[UILabel alloc] init];
    _pre_resultY.frame    = CGRectMake(CGRectGetMaxX(line4.frame), 0, Adaptive(37), Adaptive(30));
    _pre_resultY.textAlignment = 1;
    _pre_resultY.textColor = [UIColor blackColor];
    _pre_resultY.backgroundColor = BaseGreenColor;
    _pre_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_pre_resultY];

    
    
    
    _pre_resultN = [[UILabel alloc] init];
    _pre_resultN.frame    = CGRectMake(CGRectGetMaxX(line4.frame),
                                      CGRectGetMaxY(_pre_resultY.frame),
                                      Adaptive(37),
                                      Adaptive(30));
    _pre_resultN.textAlignment = 1;
    _pre_resultN.textColor = [UIColor blackColor];
    _pre_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_pre_resultN];
    
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_pre_resultY.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line5.backgroundColor = [UIColor grayColor];
    [self addSubview:line5];
    
    // 中三
    UILabel *mid_numLabel = [[UILabel alloc] init];
    mid_numLabel.frame    = CGRectMake(CGRectGetMaxX(line5.frame), 0, Adaptive(28), Adaptive(60));
    mid_numLabel.text     = @"中三";
    mid_numLabel.textAlignment = 1;
    mid_numLabel.textColor = [UIColor blackColor];
    mid_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_numLabel];
    
    UILabel *line6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_numLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line6.backgroundColor = [UIColor grayColor];
    [self addSubview:line6];
    
    // 中三胆码
    UILabel *mid_damaLabel = [[UILabel alloc] init];
    mid_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line6.frame), 0, Adaptive(28), Adaptive(60));
    mid_damaLabel.text     = @"胆码";
    mid_damaLabel.textAlignment = 1;
    mid_damaLabel.textColor = [UIColor blackColor];
    mid_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_damaLabel];
    
    UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_damaLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line7.backgroundColor = [UIColor grayColor];
    [self addSubview:line7];
    
    // 中三胆码中否
    _mid_resultY = [[UILabel alloc] init];
    _mid_resultY.frame    = CGRectMake(CGRectGetMaxX(line7.frame), 0, Adaptive(37), Adaptive(30));
    _mid_resultY.textAlignment = 1;
    _mid_resultY.textColor = [UIColor blackColor];
    _mid_resultY.backgroundColor = BaseGreenColor;
    _mid_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_mid_resultY];
    
    
    _mid_resultN = [[UILabel alloc] init];
    _mid_resultN.frame    = CGRectMake(CGRectGetMaxX(line7.frame),
                                      CGRectGetMaxY(_mid_resultY.frame),
                                      Adaptive(37),
                                      Adaptive(30));
    _mid_resultN.textAlignment = 1;
    _mid_resultN.textColor = [UIColor blackColor];
    _mid_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_mid_resultN];
    
    UILabel *line8 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_mid_resultY.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line8.backgroundColor = [UIColor grayColor];
    [self addSubview:line8];
    
    // 后三
    UILabel *last_numLabel = [[UILabel alloc] init];
    last_numLabel.frame    = CGRectMake(CGRectGetMaxX(line8.frame), 0, Adaptive(28), Adaptive(60));
    last_numLabel.text     = @"后三";
    last_numLabel.textAlignment = 1;
    last_numLabel.textColor = [UIColor blackColor];
    last_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_numLabel];
    
    UILabel *line9 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(last_numLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line9.backgroundColor = [UIColor grayColor];
    [self addSubview:line9];
    
    // 后三胆码
    UILabel *last_damaLabel = [[UILabel alloc] init];
    last_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line9.frame), 0, Adaptive(28), Adaptive(60));
    last_damaLabel.text     = @"胆码";
    last_damaLabel.textAlignment = 1;
    last_damaLabel.textColor = [UIColor blackColor];
    last_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_damaLabel];
    
    UILabel *line10 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(last_damaLabel.frame),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line10.backgroundColor = [UIColor grayColor];
    [self addSubview:line10];
    
    // 后三胆码中否
    _last_resultY = [[UILabel alloc] init];
    _last_resultY.frame    = CGRectMake(CGRectGetMaxX(line10.frame), 0, Adaptive(37), Adaptive(30));
    _last_resultY.textAlignment = 1;
    _last_resultY.backgroundColor = BaseGreenColor;
    _last_resultY.textColor = [UIColor blackColor];
    _last_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_last_resultY];
    
    _last_resultN = [[UILabel alloc] init];
    _last_resultN.frame    = CGRectMake(CGRectGetMaxX(line10.frame),
                                      CGRectGetMaxY(_last_resultY.frame),
                                      Adaptive(37),
                                      Adaptive(30));
    _last_resultN.textAlignment = 1;
    _last_resultN.textColor = [UIColor blackColor];
    _last_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_last_resultN];
}
@end
