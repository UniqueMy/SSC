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
    self.view.backgroundColor = [UIColor colorWithRed:214/255.0 green:220/255.0 blue:228/255.0 alpha:1];
    
    CGFloat buttonWidth   = Adaptive(150);
    CGFloat buttonOriginY = (viewHeight - buttonWidth*3) / 4;
    nameArray             = @[@"重庆",@"天津",@"新疆"];
    for (int a = 0;a < 3; a++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame     = CGRectMake((viewWidth - buttonWidth) / 2, buttonOriginY + (buttonOriginY + buttonWidth) * a, buttonWidth,buttonWidth);
        button.layer.cornerRadius  = button.bounds.size.width / 2;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth   = 0.5;
        button.layer.borderColor   = [UIColor blackColor].CGColor;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:nameArray[a] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:Adaptive(18)];
        button.backgroundColor = [UIColor colorWithRed:111/255.0 green:173/255.0 blue:219/255.0 alpha:1];
        button.tag = a + 1;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    // 获取当前时间
    nowDateString         = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    
    // 获取昨天时间
    NSDate *yesterDayDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*24];
    yesterdayDateString   = [NSString stringWithFormat:@"%ld",(long)[yesterDayDate timeIntervalSince1970]];
    
    [self saveCSVData];
    
}

- (void)saveCSVData {
    
    NSArray * persons = [[GKDatabaseManager sharedManager] selecteDataWithClass:[CSVModel class]];
    NSLog(@"person.count %lu",(unsigned long)persons.count);
    if (persons.count == 0) {
        NSLog(@"3333333");
        CSVModel *csv     = [[CSVModel alloc] init];
        csv.fiveStarArray = [HttpTool readCSVData];
        
        [[GKDatabaseManager sharedManager] openDatabase];
        [[GKDatabaseManager sharedManager] creatTableWithClassName:[CSVModel class]];
        [[GKDatabaseManager sharedManager] insertDataFromObject:csv];
    }
    
    
    
    
    
    
    
    
    
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
