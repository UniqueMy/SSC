//
//  DMTableViewCell.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DMTableViewCell.h"
#import "DanmaPublicModel.h"
@implementation DMTableViewCell
{
    UILabel *pre_result;
    UILabel *mid_result;
    UILabel *last_result;
    UILabel *timesNumberLabel;
    UILabel *publishLabel;
    UILabel *pre_numLabel;
    UILabel *pre_damaLabel;
    UILabel *mid_numLabel;
    UILabel *mid_damaLabel;
    UILabel *last_numLabel;
    UILabel *last_damaLabel;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 把自定义的控件 变成了单元格的属性
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
    bottomLine.frame    = CGRectMake(0, Adaptive(29.5), viewWidth, Adaptive(.5));
    bottomLine.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomLine];
    
    CGFloat Width = viewWidth / 9;
    
    // 前三
    pre_numLabel = [[UILabel alloc] init];
    pre_numLabel.frame    = CGRectMake(0, 0, Width, Adaptive(30));
    pre_numLabel.text     = @"800";
    pre_numLabel.textAlignment = 1;
    pre_numLabel.textColor = [UIColor blackColor];
    pre_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_numLabel];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(30))];
    line3.backgroundColor = [UIColor grayColor];
    [self addSubview:line3];
    
    // 前三胆码
    pre_damaLabel = [[UILabel alloc] init];
    pre_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line3.frame), 0,Width, Adaptive(30));
    pre_damaLabel.text     = @"56";
    pre_damaLabel.textAlignment = 1;
    pre_damaLabel.textColor = [UIColor blackColor];
    pre_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_damaLabel];
    
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_damaLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(30))];
    line4.backgroundColor = [UIColor grayColor];
    [self addSubview:line4];
    
    // 前三胆码中否
    pre_result = [[UILabel alloc] init];
    pre_result.frame    = CGRectMake(CGRectGetMaxX(line4.frame), Adaptive(0.5),Width, Adaptive(29));
    pre_result.textAlignment = 1;
    pre_result.textColor = [UIColor blackColor];
    pre_result.backgroundColor = BaseGreenColor;
    pre_result.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:pre_result];
    
    
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pre_result.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(30))];
    line5.backgroundColor = [UIColor grayColor];
    [self addSubview:line5];
    
    // 中三
    mid_numLabel = [[UILabel alloc] init];
    mid_numLabel.frame    = CGRectMake(CGRectGetMaxX(line5.frame), 0,Width, Adaptive(30));
    mid_numLabel.text     = @"006";
    mid_numLabel.textAlignment = 1;
    mid_numLabel.textColor = [UIColor blackColor];
    mid_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_numLabel];
    
    UILabel *line6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(30))];
    line6.backgroundColor = [UIColor grayColor];
    [self addSubview:line6];
    
    // 中三胆码
    mid_damaLabel = [[UILabel alloc] init];
    mid_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line6.frame), 0, Width, Adaptive(30));
    mid_damaLabel.text     = @"21";
    mid_damaLabel.textAlignment = 1;
    mid_damaLabel.textColor = [UIColor blackColor];
    mid_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_damaLabel];
    
    UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_damaLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               Adaptive(30))];
    line7.backgroundColor = [UIColor grayColor];
    [self addSubview:line7];
    
    // 中三胆码中否
    mid_result = [[UILabel alloc] init];
    mid_result.frame    = CGRectMake(CGRectGetMaxX(line7.frame), Adaptive(0.5), Width, Adaptive(29));
    mid_result.textAlignment = 1;
    mid_result.textColor = [UIColor blackColor];
    mid_result.backgroundColor = BaseGreenColor;
    mid_result.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:mid_result];
    
    
    
    UILabel *line8 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(mid_result.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               30)];
    line8.backgroundColor = [UIColor grayColor];
    [self addSubview:line8];
    
    // 后三
    last_numLabel = [[UILabel alloc] init];
    last_numLabel.frame    = CGRectMake(CGRectGetMaxX(line8.frame), 0,Width, Adaptive(30));
    last_numLabel.text     = @"069";
    last_numLabel.textAlignment = 1;
    last_numLabel.textColor = [UIColor blackColor];
    last_numLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_numLabel];
    
    UILabel *line9 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(last_numLabel.frame) - Adaptive(0.5),
                                                               0,
                                                               Adaptive(.5),
                                                               30)];
    line9.backgroundColor = [UIColor grayColor];
    [self addSubview:line9];
    
    // 后三胆码
    last_damaLabel = [[UILabel alloc] init];
    last_damaLabel.frame    = CGRectMake(CGRectGetMaxX(line9.frame), 0,Width, Adaptive(30));
    last_damaLabel.text     = @"46";
    last_damaLabel.textAlignment = 1;
    last_damaLabel.textColor = [UIColor blackColor];
    last_damaLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_damaLabel];
    
    UILabel *line10 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(last_damaLabel.frame) - Adaptive(0.5),
                                                                0,
                                                                Adaptive(.5),
                                                                30)];
    line10.backgroundColor = [UIColor grayColor];
    [self addSubview:line10];
    
    // 后三胆码中否
    last_result = [[UILabel alloc] init];
    last_result.frame    = CGRectMake(CGRectGetMaxX(line10.frame), Adaptive(0.5),Width, Adaptive(29));
    last_result.text     = @"Y";
    last_result.textAlignment = 1;
    last_result.backgroundColor = BaseGreenColor;
    last_result.textColor = [UIColor blackColor];
    last_result.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_result];
    
  
}

- (void)setDanmaModel:(DanmaPublicModel *)danmaModel {
    timesNumberLabel.text = danmaModel.timesNumberString;
    publishLabel.text     = danmaModel.publishString;
    
    pre_numLabel.text     = danmaModel.pre_num;
    pre_damaLabel.text    = danmaModel.pre_danma;
    
  //  NSLog(@"danmaModel.pre_result %@",danmaModel.pre_result);
    
    if ([danmaModel.pre_result isEqualToString:@"Y"]) {
        pre_result.text = @"Y";
        pre_result.backgroundColor = BaseGreenColor;
    } else if ([danmaModel.pre_result isEqualToString:@"N"]){
        pre_result.text = @"N";
        pre_result.backgroundColor = BaseGryColor;
    } else {
        pre_result.text = @"";
        pre_result.backgroundColor = BaseGryColor;
    }
    
    mid_numLabel.text     = danmaModel.mid_num;
    mid_damaLabel.text    = danmaModel.mid_danma;
    
    if ([danmaModel.mid_result isEqualToString:@"Y"]) {
        mid_result.text = @"Y";
        mid_result.backgroundColor = BaseGreenColor;
    } else if ([danmaModel.mid_result isEqualToString:@"N"]){
        mid_result.text = @"N";
        mid_result.backgroundColor = BaseGryColor;
    } else {
        mid_result.text = @"";
        mid_result.backgroundColor = BaseGryColor;
    }
    
    
    last_numLabel.text     = danmaModel.last_num;
    last_damaLabel.text    = danmaModel.last_danma;
    
    if ([danmaModel.last_result isEqualToString:@"Y"]) {
        last_result.text = @"Y";
        last_result.backgroundColor = BaseGreenColor;
    } else if ([danmaModel.last_result isEqualToString:@"N"]){
        last_result.text = @"N";
        last_result.backgroundColor = BaseGryColor;
    } else {
        last_result.text = @"";
        last_result.backgroundColor = BaseGryColor;
    }

    
}
@end
