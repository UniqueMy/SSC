//
//  MainViewController.m
//  SSC
//
//  Created by 盛浩 on 16/9/7.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//
#import "MainViewController.h"
#import "TableViewCell.h"
#import "TopView.h"
#import "HeadView.h"
#import "MainModel.h"
#import "MJRefresh.h"
#import "BottomView.h"
#import "CSVModel.h"
#import "RequestModel.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MainViewController
{
    NSMutableArray *allDataArray;
    BOOL success;
    int successNumber;
    int falseNumber;
    NSString *allDataUrl;
    BottomView *bottomView;
    NSString *city;
    NSString *types;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    types                     = @"star";
    self.view.backgroundColor = BaseGryColor;
    
    TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 viewWidth,
                                                                 NavigationBar_Height)
                                       viewController:self];
    topView.viewName = _viewName;
    [self.view addSubview:topView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                               CGRectGetMaxY(topView.frame) + Adaptive(10),
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
    
    
    bottomView        = [[BottomView alloc] init];
    bottomView.frame  = CGRectMake(0,
                                   CGRectGetMaxY(_tableView.frame),
                                   viewWidth,
                                   viewHeight - CGRectGetMaxY(_tableView.frame));
    [bottomView.fiveStarButton addTarget:self action:@selector(fiveStarClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.danmaButton addTarget:self action:@selector(danmaClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomView];
    
    
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

#pragma mark -- 五星 、胆码切换
- (void)fiveStarClick:(UIButton *)button {
    
    [UIView animateWithDuration:.2 animations:^{
        CGRect sanjiaoFrame   = bottomView.sanjiaoImageView.frame;
        sanjiaoFrame.origin.x = button.bounds.size.width / 2;
        bottomView.sanjiaoImageView.frame = sanjiaoFrame;
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bottomView.danmaButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }];
}

- (void)danmaClick:(UIButton *)button {
    [UIView animateWithDuration:.2 animations:^{
        CGRect sanjiaoFrame   = bottomView.sanjiaoImageView.frame;
        sanjiaoFrame.origin.x = viewWidth / 2 + button.bounds.size.width / 2;
        bottomView.sanjiaoImageView.frame = sanjiaoFrame;
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bottomView.fiveStarButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
    }];
}

#pragma mark 开始进入刷新状态
- (void)startRequestAllData {
    
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
    
    NSString *url = [NSString stringWithFormat:@"http://www.antson.cn:8080/stars/?city=%@&type=%@",city,types];
    NSLog(@"url %@",url);
    
    
    [request setReturnBlock:^(id returnValue,NSDictionary *dict) {
        
        allDataArray  = (NSMutableArray *)returnValue;
        successNumber = [[dict objectForKey:@"yes"] intValue];
        falseNumber   = [[dict objectForKey:@"no"] intValue];
        [_tableView reloadData];
        // 结束刷新状态
        [_tableView headerEndRefreshing];
    }];
    
    
    [request startRequestDataWithCQSSCWithUrl:url];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadView *headView     = [[HeadView alloc] init];
    headView.successNumber = successNumber;
    headView.falseNumber   = falseNumber;
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
