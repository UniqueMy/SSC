//
//  TopView.h
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView

@property (nonatomic,strong) NSString *viewName;
- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)controller;

@end
