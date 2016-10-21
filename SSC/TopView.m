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
#import "AppDelegate.h"
@implementation TopView
{
    UILabel          *topLabel;
    UIViewController *viewController;
    NSString         *fiveCopyString;
    NSString         *threeCopyString;
    NSString         *groupThreeString;
    NSString         *fiveStarOddString;
    NSString         *fiveStarEvenString;
    
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
    topLabel.frame     = CGRectMake(Adaptive(13), 20 + (44 - Adaptive(15)) / 2,Adaptive(100), Adaptive(15));
    
    topLabel.textColor = [UIColor whiteColor];
    topLabel.font      = [UIFont systemFontOfSize:Adaptive(15)];
    [self addSubview:topLabel];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame     = CGRectMake(viewWidth - Adaptive(53), 20 + (44 - Adaptive(15)) / 2, Adaptive(40), Adaptive(15));
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    
    UIButton *copyThreeStar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyThreeStar.frame     = CGRectMake(viewWidth - Adaptive(103), 20 + (44 - Adaptive(20)) / 2, Adaptive(40), Adaptive(20));
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
    copyFiveStar.frame     = CGRectMake(viewWidth - Adaptive(153), 20 + (44 - Adaptive(20)) / 2, Adaptive(40), Adaptive(20));
    copyFiveStar.layer.cornerRadius  = 3;
    copyFiveStar.layer.masksToBounds = YES;
    copyFiveStar.layer.borderWidth   = 1;
    copyFiveStar.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyFiveStar setTitle:@"五星" forState:UIControlStateNormal];
    copyFiveStar.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyFiveStar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyFiveStar addTarget:self action:@selector(copyFiveStarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyFiveStar];
    
    UIButton *copyGroupThree = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyGroupThree.frame     = CGRectMake(viewWidth - Adaptive(203), 20 + (44 - Adaptive(20)) / 2, Adaptive(40), Adaptive(20));
    copyGroupThree.layer.cornerRadius  = 3;
    copyGroupThree.layer.masksToBounds = YES;
    copyGroupThree.layer.borderWidth   = 1;
    copyGroupThree.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyGroupThree setTitle:@"组三" forState:UIControlStateNormal];
    copyGroupThree.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyGroupThree setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyGroupThree addTarget:self action:@selector(copyGroupThree:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyGroupThree];
    
    
    UIButton *copyFiveStarOdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyFiveStarOdd.frame     = CGRectMake(viewWidth - Adaptive(263), 20 + (44 - Adaptive(20)) / 2, Adaptive(50), Adaptive(20));
    copyFiveStarOdd.layer.cornerRadius  = 3;
    copyFiveStarOdd.layer.masksToBounds = YES;
    copyFiveStarOdd.layer.borderWidth   = 1;
    copyFiveStarOdd.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyFiveStarOdd setTitle:@"五星奇" forState:UIControlStateNormal];
    copyFiveStarOdd.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyFiveStarOdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyFiveStarOdd addTarget:self action:@selector(copyFiveStarOdd:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyFiveStarOdd];
    
    
    UIButton *copyFiveStarEven = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyFiveStarEven.frame     = CGRectMake(viewWidth - Adaptive(313),
                                            20 + (44 - Adaptive(20)) / 2,
                                            Adaptive(50),
                                            Adaptive(20));
    copyFiveStarEven.layer.cornerRadius  = 3;
    copyFiveStarEven.layer.masksToBounds = YES;
    copyFiveStarEven.layer.borderWidth   = 1;
    copyFiveStarEven.layer.borderColor   = [UIColor whiteColor].CGColor;
    [copyFiveStarEven setTitle:@"五星偶" forState:UIControlStateNormal];
    copyFiveStarEven.titleLabel.font = [UIFont systemFontOfSize:Adaptive(13)];
    [copyFiveStarEven setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyFiveStarEven addTarget:self action:@selector(copyFiveStarEven:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:copyFiveStarEven];
    
    
    [self copyData];
    
    
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    topLabel.text    = [NSString stringWithFormat:@"%@",_viewName];
}




- (void)copyData {
    
    CSVModel *csv           = [CSVModel sharedModelManager];
    
    dispatch_queue_t async2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async2, ^{
        
        fiveCopyString = [csv.fiveStarArray componentsJoinedByString:@","];
    });
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async1, ^{
        
        threeCopyString = [csv.threeStarArray componentsJoinedByString:@","];
    });
    
    dispatch_queue_t async3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async3, ^{
        
        groupThreeString = [csv.groupThreeArray componentsJoinedByString:@","];
    });
    
    dispatch_queue_t async4 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async4, ^{
        // 奇
        fiveStarOddString = [csv.fiveStarOddArray componentsJoinedByString:@","];
    });
    
    dispatch_queue_t async5 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(async5, ^{
        // 偶
        fiveStarEvenString = [csv.fiveStarEvenArray componentsJoinedByString:@","];
    });
    
}

- (void)copyGroupThree:(UIButton *)button {
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = groupThreeString;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制组三成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:^{
            [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(creatAlert:) userInfo:alertController repeats:NO];
            
            
        }];
    });
}

- (void)copyFiveStarClick:(UIButton *)button {
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = fiveCopyString;
        
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
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制三星成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:^{
            [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(creatAlert:) userInfo:alertController repeats:NO];
            
            
        }];
    });
}
- (void)copyFiveStarEven:(UIButton *)button {
    
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = fiveStarEvenString;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制五星偶和成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [viewController presentViewController:alertController animated:YES completion:^{
            [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(creatAlert:) userInfo:alertController repeats:NO];
            
            
        }];
    });
    
}

- (void)copyFiveStarOdd:(UIButton *)button {
    dispatch_queue_t async1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(async1, ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = fiveStarOddString;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"复制五星奇和成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
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
