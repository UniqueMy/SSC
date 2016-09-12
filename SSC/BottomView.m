//
//  BottomView.m
//  SSC
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _sanjiaoImageView = [[UIImageView alloc] init];
        _sanjiaoImageView.frame = CGRectMake(viewWidth / 4, 0, Adaptive(15), Adaptive(10));
        _sanjiaoImageView.image = [UIImage imageNamed:@"sanjiao"];
        [self addSubview:_sanjiaoImageView];
        
        UIView *buttonView = [[UIView alloc] init];
        buttonView.frame   = CGRectMake(0, Adaptive(10), viewWidth, Adaptive(40));
        buttonView.backgroundColor = [UIColor colorWithRed:94/255.0 green:156/255.0 blue:211/255.0 alpha:1];
        [self addSubview:buttonView];
        
        UILabel *whitelLine = [[UILabel alloc] init];
        whitelLine.frame    = CGRectMake(viewWidth / 2, Adaptive(10), Adaptive(.5), Adaptive(20));
        whitelLine.backgroundColor = [UIColor whiteColor];
        [buttonView addSubview:whitelLine];
        
        _fiveStarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _fiveStarButton.frame     = CGRectMake(0, 0, buttonView.bounds.size.width / 2, buttonView.bounds.size.height);
        [_fiveStarButton setTitle:@"五星" forState:UIControlStateNormal];
        [_fiveStarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttonView addSubview:_fiveStarButton];
        
        _danmaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _danmaButton.frame     = CGRectMake(buttonView.bounds.size.width / 2,
                                           0,
                                           buttonView.bounds.size.width / 2,
                                           buttonView.bounds.size.height);
        [_danmaButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_danmaButton setTitle:@"胆码" forState:UIControlStateNormal];
        [buttonView addSubview:_danmaButton];
        
        
        
    }
    return self;
}

@end
