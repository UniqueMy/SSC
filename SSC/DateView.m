//
//  DateView.m
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DateView.h"

@implementation DateView

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton                 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _sureButton.frame           = CGRectMake(0, 0, viewWidth, Adaptive(40));
        _sureButton.backgroundColor = BaseBlueColor;
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:_sureButton];
    }
    return _sureButton;
}
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker       = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0,
                                       CGRectGetMaxY(self.sureButton.frame),
                                       viewWidth,
                                       216);
        [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_datePicker];
    }
    return _datePicker;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor orangeColor];
       // [self sureButton];
      //  [self datePicker];
        
    }
    return self;
}

- (void)dateChanged:(UIDatePicker *)picker {
    NSDate *date = picker.date;
    NSLog(@"date %@",date);
}

@end
