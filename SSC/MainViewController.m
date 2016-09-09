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
#import "MJRefresh.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MainViewController
{
    NSMutableArray *allDataArray;
    BOOL success;
    int successNumber;
    NSString *allDataUrl;
    
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
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:217/255.0 green:223/255.0 blue:231/255.0 alpha:1];
    
    [self.view addSubview:_tableView];
    
    
    
    
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
    
    
    //  [self startRequestAllData];
    // 2.集成刷新控件
    [self setupRefresh];
    
}
/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(startRequestAllData) dateKey:@"table"];
    
    [_tableView headerBeginRefreshing];
    
}

#pragma mark 开始进入刷新状态

- (void)startRequestAllData{
    
    /*
     获取今天的日期转换成时间戳 请求到数组
     获取昨天的日期转换成时间戳 请求到数组
     数组按时间先后排序组合
     刷新表
     
     */
    successNumber = 0;
    CSVModel *csvModel = [CSVModel sharedModelManager];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    allDataArray = [[NSMutableArray alloc] initWithCapacity:240];
    // 获取当前时间
    NSString *nowDateString = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    NSString *nowUrl        = [NSString stringWithFormat:@"%@%@",allDataUrl,nowDateString];
    
    [HttpTool postWithUrl:nowUrl params:nil body:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        NSArray *nowArray = [responseObject objectForKey:@"itemArray"];
        
        for (NSArray *array in nowArray) {
            MainModel *mainModel = [[MainModel alloc] initWithArray:array];
            
            if ([csvModel.fiveStarArray containsObject:mainModel.publishString]) {
                
                successNumber ++;
            }
            
            [allDataArray addObject:mainModel];
        }
        [_tableView reloadData];
        
        // 获取昨天时间
        
        NSString *yesterdayDateString = [NSString stringWithFormat:@"%ld",(long)[[NSDate dateWithTimeIntervalSinceNow:-60*60*24] timeIntervalSince1970]];
        NSString *yesterdayUrl        = [NSString stringWithFormat:@"%@%@",allDataUrl,yesterdayDateString];
        
        [HttpTool postWithUrl:yesterdayUrl params:nil body:nil progress:^(NSProgress *progress) {
            
        } success:^(id responseObject) {
            
            NSArray *yesterdayArray = [responseObject objectForKey:@"itemArray"];
            for (NSArray *array in yesterdayArray) {
                MainModel *mainModel = [[MainModel alloc] initWithArray:array];
                if ([csvModel.fiveStarArray containsObject:mainModel.publishString]) {
                    successNumber ++;
                }
                [allDataArray addObject:mainModel];
            }
            
            [_tableView reloadData];
            
            
            // 获取前天时间
            NSString *beforeyesterdayString = [NSString stringWithFormat:@"%ld",(long)[[NSDate dateWithTimeIntervalSinceNow:-60*60*48] timeIntervalSince1970]];
            NSString *beforeyesterdayUrl        = [NSString stringWithFormat:@"%@%@",allDataUrl,beforeyesterdayString];
            
            [HttpTool postWithUrl:beforeyesterdayUrl params:nil body:nil progress:^(NSProgress *progress) {
                
            } success:^(id responseObject) {
                
                NSArray *beforeyesterdayArray = [responseObject objectForKey:@"itemArray"];
                for (NSArray *array in beforeyesterdayArray) {
                    MainModel *mainModel = [[MainModel alloc] initWithArray:array];
                    if ([csvModel.fiveStarArray containsObject:mainModel.publishString]) {
                        
                        successNumber ++;
                    }
                    [allDataArray addObject:mainModel];
                }
                [_tableView reloadData];
                
            }];
            
        }];
        
        // 结束刷新状态
        [_tableView headerEndRefreshing];
    }];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadView *headView     = [[HeadView alloc] init];
    headView.successNumber = successNumber;
    return headView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(60);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger integer;
    if (allDataArray.count < 240) {
        integer = allDataArray.count;
    } else {
        integer = 240;
    }
    
    return integer;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (allDataArray.count > 0) {
        MainModel *mainModel = allDataArray[indexPath.row];
        cell.mainModel = mainModel;
    }
    
    return cell;
}
@end
