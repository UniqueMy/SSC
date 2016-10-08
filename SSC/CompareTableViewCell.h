//
//  CompareTableViewCell.h
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComparePublicModel;

@interface CompareTableViewCell : UITableViewCell

@property (nonatomic,strong)  UILabel *timesNumberLabel;
@property (nonatomic,strong)  UILabel *publishLabel;
@property (nonatomic,strong)  UILabel *YNLabel;

@property (nonatomic,strong) ComparePublicModel *publicModel;
@end
