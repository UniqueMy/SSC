//
//  ThreeHeadView.m
//  SSC
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ThreeHeadView.h"

@implementation ThreeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        [self createMainView];
        
    }
    return self;
}

- (void)createMainView {
    
    UILabel *topLine = [[UILabel alloc] init];
    topLine.frame    = CGRectMake(0, 0, viewWidth, Adaptive(.5));
    topLine.backgroundColor = [UIColor blackColor];
    [self addSubview:topLine];
    
    UILabel *bottomLine = [[UILabel alloc] init];
    bottomLine.frame    = CGRectMake(0, Adaptive(59.5), viewWidth, Adaptive(.5));
    bottomLine.backgroundColor = [UIColor blackColor];
    [self addSubview:bottomLine];
    
    
      CGFloat Width = viewWidth / 6;
    
    // 前三
    UILabel *pre_numLabel = [[UILabel alloc] init];
    pre_numLabel.frame    = CGRectMake(0, 0, Width, Adaptive(60));
    pre_numLabel.text     = @"前三";
    pre_numLabel.textAlignment = 1;
    pre_numLabel.textColor = [UIColor blackColor];
    pre_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_numLabel];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(60))];
    line3.backgroundColor = [UIColor blackColor];
    [self addSubview:line3];

    
    // 前三胆码中否
    _pre_resultY = [[UILabel alloc] init];
    _pre_resultY.frame    = CGRectMake(CGRectGetMaxX(line3.frame), Adaptive(0.5), Width, Adaptive(29));
    _pre_resultY.textAlignment = 1;
    _pre_resultY.textColor = [UIColor blackColor];
    _pre_resultY.backgroundColor = BaseGreenColor;
    _pre_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_pre_resultY];
    
    
    UILabel *preLine = [[UILabel alloc] init];
    preLine.frame    = CGRectMake(CGRectGetMaxX(line3.frame),
                                  CGRectGetMaxY(_pre_resultY.frame),
                                  Width,
                                  Adaptive(.5));
    preLine.backgroundColor = [UIColor blackColor];
    [self addSubview:preLine];
    
    _pre_resultN = [[UILabel alloc] init];
    _pre_resultN.frame    = CGRectMake(CGRectGetMaxX(line3.frame),
                                       CGRectGetMaxY(preLine.frame),
                                       Width,
                                       Adaptive(29));
    _pre_resultN.textAlignment = 1;
    _pre_resultN.textColor = [UIColor blackColor];
    _pre_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_pre_resultN];
    
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_pre_resultY.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line5.backgroundColor = [UIColor blackColor];
    [self addSubview:line5];

    // 中三
    UILabel *mid_numLabel = [[UILabel alloc] init];
    mid_numLabel.frame    = CGRectMake(CGRectGetMaxX(line5.frame), 0, Width, Adaptive(60));
    mid_numLabel.text     = @"中三";
    mid_numLabel.textAlignment = 1;
    mid_numLabel.textColor = [UIColor blackColor];
    mid_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_numLabel];
    
    UILabel *line6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line6.backgroundColor = [UIColor blackColor];
    [self addSubview:line6];

    // 中三胆码中否
    _mid_resultY = [[UILabel alloc] init];
    _mid_resultY.frame    = CGRectMake(CGRectGetMaxX(line6.frame), Adaptive(0.5),Width, Adaptive(29));
    _mid_resultY.textAlignment = 1;
    _mid_resultY.textColor = [UIColor blackColor];
    _mid_resultY.backgroundColor = BaseGreenColor;
    _mid_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_mid_resultY];
    
    
    UILabel *midLine = [[UILabel alloc] init];
    midLine.frame    = CGRectMake(CGRectGetMaxX(line6.frame),
                                  CGRectGetMaxY(_mid_resultY.frame),
                                  Width,
                                  Adaptive(.5));
    midLine.backgroundColor = [UIColor blackColor];
    [self addSubview:midLine];
    
    _mid_resultN = [[UILabel alloc] init];
    _mid_resultN.frame    = CGRectMake(CGRectGetMaxX(line6.frame),
                                       CGRectGetMaxY(midLine.frame),
                                       Width,
                                       Adaptive(29));
    _mid_resultN.textAlignment = 1;
    _mid_resultN.textColor = [UIColor blackColor];
    _mid_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_mid_resultN];
    
    UILabel *line8 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_mid_resultY.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line8.backgroundColor = [UIColor blackColor];
    [self addSubview:line8];
    
    // 后三
    UILabel *last_numLabel = [[UILabel alloc] init];
    last_numLabel.frame    = CGRectMake(CGRectGetMaxX(line8.frame), 0, Width, Adaptive(60));
    last_numLabel.text     = @"后三";
    last_numLabel.textAlignment = 1;
    last_numLabel.textColor = [UIColor blackColor];
    last_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_numLabel];
    
    UILabel *line9 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(last_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               60)];
    line9.backgroundColor = [UIColor blackColor];
    [self addSubview:line9];
    
    // 后三胆码中否
    _last_resultY = [[UILabel alloc] init];
    _last_resultY.frame    = CGRectMake(CGRectGetMaxX(line9.frame), Adaptive(0.5),Width, Adaptive(29));
    _last_resultY.textAlignment = 1;
    _last_resultY.backgroundColor = BaseGreenColor;
    _last_resultY.textColor = [UIColor blackColor];
    _last_resultY.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_last_resultY];
    
    UILabel *lastLine = [[UILabel alloc] init];
    lastLine.frame    = CGRectMake(CGRectGetMaxX(line9.frame),
                                   CGRectGetMaxY(_last_resultY.frame),
                                   Width,
                                   Adaptive(.5));
    lastLine.backgroundColor = [UIColor blackColor];
    [self addSubview:lastLine];
    
    
    _last_resultN = [[UILabel alloc] init];
    _last_resultN.frame    = CGRectMake(CGRectGetMaxX(line9.frame),
                                        CGRectGetMaxY(lastLine.frame),
                                        Width,
                                        Adaptive(29));
    _last_resultN.textAlignment = 1;
    _last_resultN.textColor = [UIColor blackColor];
    _last_resultN.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:_last_resultN];
    
}

@end
