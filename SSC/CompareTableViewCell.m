//
//  CompareTableViewCell.m
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CompareTableViewCell.h"
#import "ComparePublicModel.h"
@implementation CompareTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 把自定义的控件 变成了单元格的属性
        
        // 把自定义的控件 变成了单元格的属性
        self.backgroundColor = BaseGryColor;
        
        UILabel *bottomLine = [[UILabel alloc] init];
        bottomLine.frame    = CGRectMake(0, Adaptive(29), viewWidth, Adaptive(1));
        bottomLine.backgroundColor = [UIColor grayColor];
        [self addSubview:bottomLine];
        
        CGFloat labelWidth = viewWidth  / 3;
        
        _timesNumberLabel = [[UILabel alloc] init];
        _timesNumberLabel.frame    = CGRectMake(0, 0, labelWidth, Adaptive(30));
        // _timesNumberLabel.text     = @"20160808087";
        _timesNumberLabel.textAlignment = 1;
        _timesNumberLabel.textColor = [UIColor blackColor];
        _timesNumberLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_timesNumberLabel];
        
        
        for (int a = 0; a < 3; a++) {
            UILabel *line = [[UILabel alloc] init];
            line.frame    = CGRectMake(labelWidth *(a + 1), 0, Adaptive(1), Adaptive(30));
            line.backgroundColor = [UIColor grayColor];
            [self addSubview:line];
            
        }
        
        _publishLabel = [[UILabel alloc] init];
        _publishLabel.frame    = CGRectMake(CGRectGetMaxX(_timesNumberLabel.frame), 0, labelWidth, Adaptive(30));
        _publishLabel.text     = @"75722";
        _publishLabel.textAlignment = 1;
        _publishLabel.textColor = [UIColor blackColor];
        _publishLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_publishLabel];
        
        
        _YNLabel = [[UILabel alloc] init];
        _YNLabel.frame    = CGRectMake(CGRectGetMaxX(_publishLabel.frame) +Adaptive(1) ,0, labelWidth - 1, Adaptive(29));
        _YNLabel.textAlignment = 1;
        _YNLabel.text     = @"Y";
        _YNLabel.backgroundColor = BaseGreenColor;
        _YNLabel.textColor = [UIColor blackColor];
        _YNLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_YNLabel];
    }
    return self;
}

- (void)setPublicModel:(ComparePublicModel *)publicModel {
    _timesNumberLabel.text  = publicModel.timesNumberString;
    _publishLabel.text      = publicModel.publishString;
   

}

@end
