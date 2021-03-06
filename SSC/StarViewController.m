//
//  StarViewController.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "StarViewController.h"

#import "MJRefresh.h"

#import "RequestModel.h"
#import "HeadView.h"
#import "TableViewCell.h"
@interface StarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation StarViewController
{
    NSString       *city;
    NSMutableArray *allDataArray;
    HeadView       *headView;
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
    
  //  NSLog(@"_button.tag %ld",(long)_buttonTag);
    
    RequestModel *request = [[RequestModel alloc] init];
    
    
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
    
    NSString *url = [NSString stringWithFormat:@"http://www.antson.cn:8080/stars/?city=%@&type=star",city];
    
    
    [request setBlockWithReturnBlock:^(id returnValue) {
        
        allDataArray  = (NSMutableArray *)returnValue;
        [_tableView reloadData];
        // 结束刷新状态
        [_tableView headerEndRefreshing];
        
    } Dict:^(NSDictionary *dict) {
        
        headView.YLabel.text    = [NSString stringWithFormat:@"Y:%@",[dict objectForKey:@"yes"]];
        headView.NLabel.text    = [NSString stringWithFormat:@"N:%@",[dict objectForKey:@"no"]];
        headView.oddLabel.text  = [dict objectForKey:@"odd"];
        headView.evenLabel.text = [dict objectForKey:@"even"];
        
    }];
    
    [request startRequestDataWithCQSSCWithUrl:url];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (!headView) {
        headView     = [[HeadView alloc] init];
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
