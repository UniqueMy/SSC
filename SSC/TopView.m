//
//  TopView.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "TopView.h"
#import "ViewController.h"
#import "CSVModel.h"
@implementation TopView
{
    UILabel          *topLabel;
    UIViewController *viewController;
    NSString         *fiveCopyString;
    NSString         *threeCopyString;
    
}
- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)controller
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:94/255.0 green:156/255.0 blue:211/255.0 alpha:1];
        viewController = controller;
        [self createMainView];
    }
    return self;
}

- (void)createMainView {
    topLabel           = [[UILabel alloc] init];
    topLabel.frame     = CGRectMake(Adaptive(13), 20 + (44 - Adaptive(15)) / 2, viewWidth / 2, Adaptive(15));
    
    topLabel.textColor = [UIColor whiteColor];
    topLabel.font      = [UIFont systemFontOfSize:Adaptive(15)];
    [self addSubview:topLabel];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame     = CGRectMake(viewWidth - Adaptive(63), 20 + (44 - Adaptive(15)) / 2, Adaptive(50), Adaptive(15));
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    
    UIButton *copyThreeStar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyThreeStar.frame     = CGRectMake(viewWidth - Adaptive(123), 20 + (44 - Adaptive(20)) / 2, Adaptive(40), Adaptive(20));
    copyThreeStar.layer.cornerRadius  = 3;
    copyThreeStar.layer.masksToBounds = YES;
    copyThreeStar.layer.borderWidth   = 1;
    copyThreeStar.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyThreeStar setTitle:@"三星" forState:UIControlStateNormal];
    copyThreeStar.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyThreeStar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyThreeStar addTarget:self action:@selector(copyThreeStarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyThreeStar];
    
    
    UIButton *copyFiveStar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyFiveStar.frame     = CGRectMake(viewWidth - Adaptive(183), 20 + (44 - Adaptive(20)) / 2, Adaptive(40), Adaptive(20));
    copyFiveStar.layer.cornerRadius  = 3;
    copyFiveStar.layer.masksToBounds = YES;
    copyFiveStar.layer.borderWidth   = 1;
    copyFiveStar.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyFiveStar setTitle:@"五星" forState:UIControlStateNormal];
    copyFiveStar.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyFiveStar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyFiveStar addTarget:self action:@selector(copyFiveStarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyFiveStar];
    
    
    
    [self copyThreeStarData];
    [self copyFiveStarData];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    topLabel.text    = [NSString stringWithFormat:@"%@时时彩数据统计",_viewName];
}

- (void)copyFiveStarData {
    
    CSVModel *csv           = [CSVModel sharedModelManager];
    dispatch_queue_t async2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async2, ^{
        
        fiveCopyString = [csv.fiveStarArray componentsJoinedByString:@","];
    });
}
- (void)copyThreeStarData {
    
    CSVModel *csv           = [CSVModel sharedModelManager];
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async1, ^{
        
        threeCopyString = [csv.threeStarArray componentsJoinedByString:@","];
    });
}


- (void)copyFiveStarClick:(UIButton *)button {
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = fiveCopyString;
        NSLog(@"五星 %@",pasteboard.string);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制五星成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:^{
            [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(creatAlert:) userInfo:alertController repeats:NO];
            
            
        }];
    });
}

- (void)copyThreeStarClick:(UIButton *)button {
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = threeCopyString;
         NSLog(@"三星 %@",pasteboard.string);
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制三星成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:^{
            [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(creatAlert:) userInfo:alertController repeats:NO];
            
            
        }];
    });
}


- (void)creatAlert:(NSTimer *)timer{
    
    UIAlertController *alert = [timer userInfo];
    
    [alert dismissViewControllerAnimated:YES completion:nil];
    
    alert = nil;
    
}

- (void)backClick:(UIButton *)button {
    
    [viewController dismissViewControllerAnimated:YES completion:nil];
    
}
@end
