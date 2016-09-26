//
//  ThreeTableViewCell.m
//  SSC
//
//  Created by mac on 16/9/26.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "ThreeTableViewCell.h"
#import "ThreePublicModel.h"

@implementation ThreeTableViewCell
{
    UILabel *pre_result;
    UILabel *mid_result;
    UILabel *last_result;
    UILabel *pre_numLabel;
    UILabel *mid_numLabel;
    UILabel *last_numLabel;
    
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
    
    CGFloat Width = viewWidth / 6;
    
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
    
    // 前三胆码中否
    pre_result = [[UILabel alloc] init];
    pre_result.frame    = CGRectMake(CGRectGetMaxX(line3.frame), Adaptive(0.5),Width, Adaptive(29));
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
    
    
    // 中三胆码中否
    mid_result = [[UILabel alloc] init];
    mid_result.frame    = CGRectMake(CGRectGetMaxX(line6.frame), Adaptive(0.5), Width, Adaptive(29));
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
    
    // 后三胆码中否
    last_result = [[UILabel alloc] init];
    last_result.frame    = CGRectMake(CGRectGetMaxX(line9.frame), Adaptive(0.5),Width, Adaptive(29));
    last_result.text     = @"Y";
    last_result.textAlignment = 1;
    last_result.backgroundColor = BaseGreenColor;
    last_result.textColor = [UIColor blackColor];
    last_result.font      = [UIFont systemFontOfSize:Adaptive(13)];
    [self addSubview:last_result];
    
}

- (void)setThreePublic:(ThreePublicModel *)threePublic {
    
    pre_numLabel.text     = threePublic.pre_num;
    
    if ([threePublic.pre_result isEqualToString:@"1"]) {
        pre_result.text = @"Y";
        pre_result.backgroundColor = BaseGreenColor;
    } else {
        pre_result.text = @"N";
        pre_result.backgroundColor = BaseGryColor;
    }

    
    mid_numLabel.text     = threePublic.mid_num;
    
    if ([threePublic.mid_result isEqualToString:@"1"]) {
        mid_result.text = @"Y";
        mid_result.backgroundColor = BaseGreenColor;
    }  else {
        mid_result.text = @"N";
        mid_result.backgroundColor = BaseGryColor;
    }
    
    last_numLabel.text    = threePublic.last_num;
    
    
    if ([threePublic.last_result isEqualToString:@"1"]) {
        last_result.text = @"Y";
        last_result.backgroundColor = BaseGreenColor;
    } else {
        last_result.text = @"N";
        last_result.backgroundColor = BaseGryColor;
    }
    
}
@end
