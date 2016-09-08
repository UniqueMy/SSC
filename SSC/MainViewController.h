//
//  MainViewController.h
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic,strong) NSString *viewName;
@property (nonatomic)        NSInteger buttonTag;

@property (nonatomic,strong) NSString *nowString;
@property (nonatomic,strong) NSString *yesterdayString;
@end
