//
//  TableViewCell.m
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//
#import "MainModel.h"
#import "TableViewCell.h"


@implementation TableViewCell
{
    BOOL      success;
   
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        // 把自定义的控件 变成了单元格的属性
        self.backgroundColor = [UIColor colorWithRed:217/255.0 green:223/255.0 blue:231/255.0 alpha:1];
        
        UILabel *bottomLine = [[UILabel alloc] init];
        bottomLine.frame    = CGRectMake(0, Adaptive(29), viewWidth, Adaptive(1));
        bottomLine.backgroundColor = [UIColor grayColor];
        [self addSubview:bottomLine];
        
        CGFloat labelWidth = viewWidth  / 4;
        
        _timesNumberLabel = [[UILabel alloc] init];
        _timesNumberLabel.frame    = CGRectMake(0, 0, labelWidth, Adaptive(30));
        // _timesNumberLabel.text     = @"20160808087";
        _timesNumberLabel.textAlignment = 1;
        _timesNumberLabel.textColor = [UIColor blackColor];
        _timesNumberLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_timesNumberLabel];
        
        
        for (int a = 0; a < 4; a++) {
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
        
        _totalLabel = [[UILabel alloc] init];
        _totalLabel.frame    = CGRectMake(CGRectGetMaxX(_publishLabel.frame), 0, labelWidth, Adaptive(30));
        _totalLabel.text     = @"23";
        _totalLabel.textAlignment = 1;
        _totalLabel.textColor = [UIColor blackColor];
        _totalLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_totalLabel];
        
        _YNLabel = [[UILabel alloc] init];
        _YNLabel.frame    = CGRectMake(CGRectGetMaxX(_totalLabel.frame) +Adaptive(1) ,0, labelWidth - 1, Adaptive(29));
        _YNLabel.text     = @"Y";
        _YNLabel.textAlignment = 1;
        _YNLabel.textColor = [UIColor blackColor];
        _YNLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_YNLabel];
        
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.frame    = CGRectMake(CGRectGetMaxX(_YNLabel.frame), 0, labelWidth, Adaptive(30));
        _numberLabel.text     = @"240";
        _numberLabel.textAlignment = 1;
        _numberLabel.textColor = [UIColor blackColor];
        _numberLabel.font      = [UIFont systemFontOfSize:Adaptive(13)];
        [self addSubview:_numberLabel];
        
    }
    return self;
}


- (void)setMainModel:(MainModel *)mainModel {
    
    _timesNumberLabel.text  = mainModel.timesNumberString;
    _publishLabel.text      = mainModel.publishString;
    _totalLabel.text        = mainModel.totalString;
    
    }

@end
