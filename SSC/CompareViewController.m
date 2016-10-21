//
//  CompareViewController.m
//  SSC
//
//  Created by mac on 16/9/27.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "CompareViewController.h"
#import "CompareHeadView.h"
#import "CompareTableViewCell.h"
#import "CompareModel.h"
#import "ComparePublicModel.h"
@interface CompareViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CompareViewController
{
    NSString        *city;
    NSMutableArray  *allDataArray;
    CompareHeadView *headView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BaseGryColor;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               viewWidth,
                                                               viewHeight - NavigationBar_Height - Adaptive(60))
                                              style:UITableViewStylePlain];
    _tableView.delegate        = self;
    _tableView.dataSource      = self;
    _tableView.rowHeight       = Adaptive(30);
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = BaseGryColor;
    
    [self.view addSubview:_tableView];
    
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
- (void)startRequestAllData {
    
    switch (_buttonTag) {
        case 0:
        {
            // 重庆
            city = @"chongqing";
            
        }
            break;
        case 1:
        {
            // 天津
            city = @"tianjin";
        }
            break;
        case 2:
        {
            // 新疆
            city = @"xinjiang";
        }
            break;
            
        default:
            break;
    }
    NSString *url = [NSString stringWithFormat:@"http://www.antson.cn:8080/stars/?city=%@&type=compare",city];
    
    CompareModel *compareModel = [[CompareModel alloc] init];
    [compareModel setBlockWithReturnBlock:^(id returnValue) {
        
        allDataArray  = (NSMutableArray *)returnValue;
        [_tableView reloadData];
        // 结束刷新状态
        [_tableView headerEndRefreshing];
        
    }];
    [compareModel startRequestDataWithCQSSCWithUrl:url];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (!headView) {
        headView     = [[CompareHeadView alloc] init];
    }
    return headView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(60);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
         return allDataArray.count;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    CompareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CompareTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
        if (allDataArray.count > 0) {
            ComparePublicModel *mainModel = allDataArray[indexPath.row];
            cell.publicModel = mainModel;
        }
    
    return cell;
}


@end
