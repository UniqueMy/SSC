//
//  MoveViewController.m
//  SSC
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "MoveViewController.h"

#import "DanMaViewController.h"
#import "StarViewController.h"

#import "TopView.h"

@interface MoveViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) StarViewController *starVC;
@property (nonatomic,strong) DanMaViewController *danmaVC;

@property (nonatomic,retain) NSMutableArray *titleArray;

@end

@implementation MoveViewController
{
    UIScrollView *_tableScroll;  // 中间的scroller
    UIScrollView *_scrollView;   // 移动Scroller
    UIImageView  *moveImageView; // 移动三角
}
#pragma mark -- 懒加载
- (UIViewController *)starVC {
    
    if (!_starVC) {
        _starVC            = [[StarViewController alloc] init];
        _starVC.view.frame = CGRectMake(0, 0, viewWidth, _tableScroll.frame.size.height);
        _starVC.buttonTag  = _buttonTag;
        [self addChildViewController:_starVC];
        [_tableScroll addSubview:_starVC.view];
    }
    return _starVC;
    
}

- (UIViewController *)danmaVC {
    
    if (!_danmaVC) {
        _danmaVC            = [[DanMaViewController alloc] init];
        _danmaVC.view.frame = CGRectMake(viewWidth, 0, viewWidth, _tableScroll.frame.size.height);
        _danmaVC.buttonTag  = _buttonTag;
        [self addChildViewController:_danmaVC];
        [_tableScroll addSubview:_danmaVC.view];
    }
    return _danmaVC;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BaseGryColor;
    
    
    TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(0,
                                                                 0,
                                                                 viewWidth,
                                                                 NavigationBar_Height)
                                       viewController:self];
    topView.viewName = _viewName;
    [self.view addSubview:topView];
    
    
    self.titleArray  = [NSMutableArray array];
    [self.titleArray addObject:@"五星"];
    [self.titleArray addObject:@"胆码"];
    
    self.automaticallyAdjustsScrollViewInsets = NO; //必要的一步
    
    //   添加item 标题Scroller
    [self setUpScrollView];
    //  添加内容容器c
    [self addtableScroll];
    //    添加内容
    [self addContentView];
}

// 添加item 标题Scroller
- (void)setUpScrollView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                 viewHeight - Adaptive(60),
                                                                 viewWidth,
                                                                 Adaptive(60))];
    _scrollView.contentSize     = CGSizeMake(viewWidth, Adaptive(60));
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    // 添加点击按钮
    for (int i = 0; i < [_titleArray count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame     = CGRectMake(viewWidth / _titleArray.count * i,
                                      Adaptive(10),
                                      viewWidth/[_titleArray count],
                                      Adaptive(50));
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        button.backgroundColor = BaseBlueColor;
        //设定按钮文字颜色
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:Adaptive(14)];
        // 默认选中第0个
        if (i == 0) [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置点击事件
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i+1;
        
        [_scrollView addSubview:button];
    }
    
    _scrollView.bounces = NO;
    
    //设置提示条目
    moveImageView = [[UIImageView alloc] initWithFrame:CGRectMake(viewWidth / 4 - Adaptive(7.5), 0, Adaptive(15), Adaptive(10))];
    moveImageView.image = [UIImage imageNamed:@"sanjiao"];
    [_scrollView addSubview:moveImageView];
    
    
}

// 添加内容容器
-(void)addtableScroll{
    //添加滑动视图
    _tableScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,
                                                                 NavigationBar_Height,
                                                                 viewWidth,
                                                                 viewHeight - NavigationBar_Height - Adaptive(60))];
    
    _tableScroll.contentSize = CGSizeMake(viewWidth*[_titleArray count], viewHeight - NavigationBar_Height - Adaptive(60));
    
    //设置整页滑动
    _tableScroll.pagingEnabled = YES;
    _tableScroll.delegate      = self;
    _tableScroll.showsVerticalScrollIndicator = NO;
    _tableScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableScroll];
    
}

//添加内容
-(void)addContentView{
    
    [self starVC];
    
}

- (void)titleClick:(UIButton *)button {
    
    UIButton *button1 = (UIButton *)[self.view viewWithTag:1];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:2];
    
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    /**
     *  根据button.tag值添加不同的视图
     */
    [self addchooseViewControllerWithNumber:button.tag];
    
    //设定文字颜色
    [UIView animateWithDuration:.2f animations:^{
        
        // 移动滑块
        NSInteger OriginX   = button.frame.origin.x + button.bounds.size.width / 2 - Adaptive(7.5);
        moveImageView.frame = CGRectMake(OriginX,0,Adaptive(15), Adaptive(10));
        // 移动主视图
        _tableScroll.contentOffset = CGPointMake((button.tag-1) * viewWidth, 0);
        
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint offset = scrollView.contentOffset;
    
    [UIView animateWithDuration:.2f animations:^{
        
        // 移动滑块
        NSInteger OriginX   =  offset.x / 2 + viewWidth / 4 - Adaptive(7.5);
        moveImageView.frame = CGRectMake(OriginX,0,Adaptive(15), Adaptive(10));
        // 移动主视图
        _tableScroll.contentOffset=CGPointMake(offset.x, 0);
        
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint offset    = scrollView.contentOffset;
    UIButton *button  = (UIButton *)[self.view viewWithTag:offset.x / viewWidth + 1];
    
    UIButton *button1 = (UIButton *)[self.view viewWithTag:1];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:2];
    
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    [button  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    /**
     *  根据偏移量添加不同的视图
     */
    [self addchooseViewControllerWithNumber:offset.x / viewWidth + 1];
    
}

// 根据button.tag值添加不同的视图
- (void)addchooseViewControllerWithNumber:(NSInteger )number {
    
    number == 1 ? [self starVC] : [self danmaVC];
    
}

@end