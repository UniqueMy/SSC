//
//  ViewController.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//


#import "CSVModel.h"
#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *nameArray;
    NSArray *nowArray;
    NSArray *yesterdayArray;
    NSString *nowDateString;
    NSString *yesterdayDateString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BaseGryColor;
    
    CGFloat buttonWidth   = Adaptive(150);
    CGFloat buttonOriginY = (viewHeight - buttonWidth * 3) / 4;
    nameArray             = @[@"重庆",@"天津",@"新疆"];
    for (int a = 0;a < 3; a++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame     = CGRectMake((viewWidth - buttonWidth) / 2,
                                      buttonOriginY + (buttonOriginY + buttonWidth) * a,
                                      buttonWidth,
                                      buttonWidth);
        button.layer.cornerRadius  = button.bounds.size.width / 2;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth   = 0.5;
        button.layer.borderColor   = [UIColor blackColor].CGColor;
        button.titleLabel.font     = [UIFont systemFontOfSize:Adaptive(18)];
        button.backgroundColor     = [UIColor colorWithRed:111/255.0 green:173/255.0 blue:219/255.0 alpha:1];
        button.tag                 = a + 1;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:nameArray[a] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

#pragma mark -- 分线程请求三个数据
- (void)startRequestData {
    
    // 重庆
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async1, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
    
    // 天津
    dispatch_queue_t async2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async2, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
    
    // 新疆
    dispatch_queue_t async3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async3, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
    
    
}


- (void)buttonClick:(UIButton *)button {
    
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.viewName            = nameArray[button.tag - 1];
    mainVC.buttonTag           = button.tag - 1;
    mainVC.nowString           = nowDateString;
    mainVC.yesterdayString     = yesterdayDateString;
    [self presentViewController:mainVC animated:YES completion:^{}];
}

@end
