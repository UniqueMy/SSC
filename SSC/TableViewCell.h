//
//  TableViewCell.h
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainModel;

@interface TableViewCell : UITableViewCell
@property (nonatomic,strong)  UILabel *timesNumberLabel;
@property (nonatomic,strong)  UILabel *publishLabel;
@property (nonatomic,strong)  UILabel *totalLabel;
@property (nonatomic,strong)  UILabel *YNLabel;
@property (nonatomic,strong)  UILabel *oddOrEven;

@property (nonatomic,strong) MainModel *mainModel;

@end
