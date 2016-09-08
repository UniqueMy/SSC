//
//  MainViewController.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//


#import "CSVModel.h"
#import "MainViewController.h"
#import "TableViewCell.h"
#import "TopView.h"
#import "HeadView.h"
#import "MainModel.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MainViewController
{
    NSMutableArray *allDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:217/255.0 green:223/255.0 blue:231/255.0 alpha:1];
    
    TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 64) viewController:self];
    topView.viewName = _viewName;
    [self.view addSubview:topView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                               CGRectGetMaxY(topView.frame) + Adaptive(10),
                                                               viewWidth,
                                                               viewHeight - 64 - 60)
                                              style:UITableViewStylePlain];
    _tableView.delegate        = self;
    _tableView.dataSource      = self;
    _tableView.rowHeight       = Adaptive(30);
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWithRed:217/255.0 green:223/255.0 blue:231/255.0 alpha:1];
    
    [self.view addSubview:_tableView];
    
    
    
    NSString *allDataUrl;
    switch (_buttonTag) {
        case 0:
        {
            // 重庆
            allDataUrl = @"http://m.1396mo.com/api/ssc/history?date=";
        }
            break;
        case 1:
        {
            // 新疆
        }
            break;
        case 2:
        {
            // 天津
        }
            break;
            
        default:
            break;
    }
    
    
    [self startRequestAllDataWithUrl:allDataUrl];
    
}


- (void)startRequestAllDataWithUrl:(NSString *)url {
    
    /*
     获取今天的日期转换成时间戳 请求到数组
     获取昨天的日期转换成时间戳 请求到数组
     数组按时间先后排序组合
     刷新表
     
     */
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    allDataArray = [NSMutableArray array];
    // 获取当前时间
    NSString *nowDateString = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    NSString *nowUrl        = [NSString stringWithFormat:@"%@%@",url,nowDateString];
    
    [HttpTool postWithUrl:nowUrl params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        NSArray *nowArray = [responseObject objectForKey:@"itemArray"];
        
        for (NSArray *array in nowArray) {
            MainModel *mainModel = [[MainModel alloc] initWithArray:array];
            [allDataArray addObject:mainModel];
        }
        
    }];
    
    // 获取昨天时间
    
    NSString *yesterdayDateString = [NSString stringWithFormat:@"%ld",(long)[[NSDate dateWithTimeIntervalSinceNow:-60*60*24] timeIntervalSince1970]];
    NSString *yesterdayUrl        = [NSString stringWithFormat:@"%@%@",url,yesterdayDateString];
    
    [HttpTool postWithUrl:yesterdayUrl params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        NSArray *yesterdayArray = [responseObject objectForKey:@"itemArray"];
        for (NSArray *array in yesterdayArray) {
            MainModel *mainModel = [[MainModel alloc] initWithArray:array];
            [allDataArray addObject:mainModel];
        }
        [_tableView reloadData];
        
    }];
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadView *headView = [[HeadView alloc] init];
    return headView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(30);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    MainModel *mainModel = allDataArray[indexPath.row];
    
    cell.mainModel = mainModel;

  
    
    
    return cell;
}
@end
