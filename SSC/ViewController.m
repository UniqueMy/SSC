//
//  ViewController.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//


#import "CSVModel.h"
#import "ViewController.h"
#import "MoveViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray        *nameArray;
//    NSMutableArray *CQmodelArray;
//    NSString       *CQtrueNumber;
//    NSString       *CQfalseNumber;
//    NSMutableArray *TJmodelArray;
//    NSString       *TJtrueNumber;
//    NSString       *TJfalseNumber;
//    NSMutableArray *XJmodelArray;
//    NSString       *XJtrueNumber;
//    NSString       *XJfalseNumber;
    
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
    
    [self startData];
    
}


- (void)startData {

    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async1, ^{
        
        CSVModel *csv = [CSVModel sharedModelManager];
        csv.fiveStarArray = [HttpTool readCSVDataWithNSString:@"五星数据"];
        [csv.fiveStarArray removeLastObject];
       
       
    });
    
    dispatch_queue_t async2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async2, ^{
        
        CSVModel *csv = [CSVModel sharedModelManager];
        csv.threeStarArray = [HttpTool readCSVDataWithNSString:@"三星"];
        [csv.threeStarArray removeLastObject];
       
    });
    
    dispatch_queue_t async3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async3, ^{
        
        CSVModel *csv = [CSVModel sharedModelManager];
        csv.groupThreeArray = [HttpTool readCSVDataWithNSString:@"组三"];
        [csv.groupThreeArray removeLastObject];
        
    });
    
}

- (void)buttonClick:(UIButton *)button {
    
    MoveViewController *mainVC = [[MoveViewController alloc] init];
    mainVC.viewName            = nameArray[button.tag - 1];
    mainVC.buttonTag           = button.tag - 1;
    
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame       = button.frame;
        frame.origin.x    -= 5;
        frame.origin.y    -= 5;
        frame.size.width  += 10;
        frame.size.height += 10;
        button.frame       = frame;
    } completion:^(BOOL finished) {
        CGRect frame       = button.frame;
        frame.origin.x    += 5;
        frame.origin.y    += 5;
        frame.size.width  -= 10;
        frame.size.height -= 10;
        button.frame       = frame;
        
        [self presentViewController:mainVC animated:YES completion:^{}];
        
    }];
}

@end
