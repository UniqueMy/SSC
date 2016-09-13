//
//  DanMaViewController.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "DanMaViewController.h"
#import "DMHeadView.h"
#import "DMTableViewCell.h"
#import "DanmaModel.h"
#import "DanmaPublicModel.h"
@interface DanMaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation DanMaViewController
{
    NSString       *city;
    DMHeadView     *headView;
    NSMutableArray *allDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               viewWidth,
                                                               viewHeight - NavigationBar_Height - Adaptive(60))
                                              style:UITableViewStylePlain];
    _tableView.delegate        = self;
    _tableView.dataSource      = self;
    _tableView.rowHeight       = Adaptive(60);
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
    
    NSLog(@"_button.tag %ld",(long)_buttonTag);
    
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
    DanmaModel *danmaModel = [[DanmaModel alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"http://www.antson.cn:8080/stars/?city=%@&type=danma",city];
    
    [danmaModel setBlockWithReturnBlock:^(id returnValue) {
        
        allDataArray  = (NSMutableArray *)returnValue;
        [_tableView reloadData];
        // 结束刷新状态
        [_tableView headerEndRefreshing];
        
    } Dict:^(NSDictionary *dict) {
        headView.pre_resultY.text  = [dict objectForKey:@"pre_yes"];
        headView.pre_resultN.text  = [dict objectForKey:@"pre_no"];
        headView.mid_resultY.text  = [dict objectForKey:@"mid_yes"];
        headView.mid_resultN.text  = [dict objectForKey:@"mid_no"];
        headView.last_resultY.text = [dict objectForKey:@"last_yes"];
        headView.last_resultN.text = [dict objectForKey:@"last_no"];
    }];
    
    [danmaModel startRequestDataWithDanMaWithUrl:url];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (!headView) {
        headView     = [[DMHeadView alloc] init];
    }
    return headView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return Adaptive(60);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"数组长度 %lu",(unsigned long)allDataArray.count);
    
    return allDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    DMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DMTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (allDataArray.count > 0) {
       DanmaPublicModel  *danmaModel = allDataArray[indexPath.row];
        cell.danmaModel = danmaModel;
    }
    
    return cell;
}
@end