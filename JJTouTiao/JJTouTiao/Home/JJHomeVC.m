//
//  JJHomeVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJHomeVC.h"
#import "JJSegementView.h"
#import "JJOtherVC.h"
#import "JJHotVC.h"
#import "JJRecommandVC.h"
#import "JJLIveBaseVC.h"

#define SEGMENT_HEIGHT          (40.0)

@interface JJHomeVC () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *channelScrollView;
@property (nonatomic, strong) UIScrollView *backScrollView;
@property (nonatomic, strong) NSMutableArray <UIView *> *views;
@property (nonatomic, strong) NSMutableArray <UIViewController *> *vcs;
@property (nonatomic, strong) NSArray <NSString *> *titleStrArr;
@property (nonatomic, strong) JJSegementView *segmentView;
@property (nonatomic, strong) NSMutableArray<JJSegementView *> *segmentViewsArrM;

@end

@implementation JJHomeVC

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.segmentViewsArrM = [NSMutableArray array];
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark - Object Private Function

- (void)initUI
{
    //初始化相关数据
    self.titleStrArr = @[@"推荐", @"热点", @"视频", @"北京", @"社会", @"头条号", @"问答", @"娱乐", @"图片", @"科技", @"汽车", @"体育", @"财经", @"军事", @"国际", @"段子"];
    
    self.views = [NSMutableArray arrayWithCapacity:16];
    self.vcs = [NSMutableArray arrayWithCapacity:4];
    
    //加载背后的滚动视图
    [self loadBackScrollView];
    
    //加载子视图
    [self loadSubviews];
    
    //加载顶部滚动视图
    [self loadTitleView];
    
    //加载子控制器内容
    [self loadContents];
}

- (void)loadTitleView
{
    self.channelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 64.0, self.view.width - 50.0, SEGMENT_HEIGHT)];
    self.channelScrollView.contentSize = CGSizeMake(self.titleStrArr.count * 50.0, SEGMENT_HEIGHT);
    [self.channelScrollView addSubview:self.segmentView];
    self.channelScrollView.bounces = NO;
    self.channelScrollView.backgroundColor = [UIColor whiteColor];
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.channelScrollView];
    
    for (NSInteger i = 0; i < self.titleStrArr.count; i ++) {
        JJSegementView *segmentView = [[JJSegementView alloc] initWithFrame:CGRectMake(50 * i, 0.0, 50.0, SEGMENT_HEIGHT)];
        segmentView.titleStr = self.titleStrArr[i];
        segmentView.tag = 1000 + i;
        [self.segmentViewsArrM addObject:segmentView];
        [segmentView addTarget:self action:@selector(segmentViewValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self.channelScrollView addSubview:segmentView];
    }
    self.segmentViewsArrM[0].selected = YES;
    
    //加号按钮
    [self loadPlusButton];
}

//加号按钮

- (void)loadPlusButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"plus_button"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(plusButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(kScreenWidth - 35.0, 5.0, 30.0, 30.0);
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@20.0);
        make.left.equalTo(self.channelScrollView.mas_right).offset(15.0);
        make.centerY.equalTo(self.channelScrollView);
    }];
}

//加载子控制器内容

- (void)loadContents
{
    [self.vcs removeAllObjects];
    
    for (NSInteger i = 0; i < self.titleStrArr.count; i ++) {
        [self.views[i] removeAllSubviews];
        JJLIveBaseVC *liveVC;
        if ([self.titleStrArr[i] isEqualToString:@"推荐"]) {
            liveVC = [[JJRecommandVC alloc] initWithDiscovery:YES tag:YES withBanner:NO withKey:@"推荐" withPosition:i];
        }
        
        else if([self.titleStrArr[i] isEqualToString:@"热点"]){
            liveVC = [[JJHotVC alloc] initWithDiscovery:NO tag:YES withBanner:NO withKey:@"热点" withPosition:i];
        }
        else {
            liveVC = [[JJOtherVC alloc] initWithDiscovery:NO tag:YES withBanner:NO withKey:@"其他" withPosition:i];
        }
        
        [liveVC loadDataWithSuperVC:self view:self.views[i] withIndex:i];
        [self.vcs addObject:liveVC];
    }
}

//加载后面的滚动视图

- (void)loadBackScrollView
{
    self.backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 64.0 + SEGMENT_HEIGHT, kScreenWidth, CGRectGetHeight(self.view.bounds) - SEGMENT_HEIGHT - 64.0 - 49.0)];
    self.backScrollView.scrollsToTop = NO;
    self.backScrollView.backgroundColor = [UIColor colorForHex:@"ededed"];
    self.backScrollView.showsHorizontalScrollIndicator = NO;
    self.backScrollView.showsVerticalScrollIndicator = NO;
    self.backScrollView.delegate = self;
    self.backScrollView.pagingEnabled = YES;
    self.backScrollView.bounces = NO;
    self.backScrollView.delaysContentTouches = YES;
    self.backScrollView.canCancelContentTouches = NO;
    [self.view addSubview:self.backScrollView];
}

//加载子视图数组

- (void)loadSubviews
{
    for (NSInteger i = 0; i < self.titleStrArr.count; i++) {
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
        contentView.frame = CGRectMake(i * self.backScrollView.bounds.size.width, 0.0, self.backScrollView.bounds.size.width, self.backScrollView.bounds.size.height);
        [self.backScrollView addSubview:contentView];
        CGSize contentSize = self.backScrollView.contentSize;
        contentSize.height = self.backScrollView.frame.size.height;
        contentSize.width = (i + 1) * self.backScrollView.bounds.size.width;
        self.backScrollView.contentSize = contentSize;
        [self.views addObject:contentView];
    }
}

- (JJLIveBaseVC *)selectViewController:(NSInteger)i
{
    if(self.vcs && self.vcs.count > i){
        JJLIveBaseVC *liveCurrentV = (JJLIveBaseVC *)[self.vcs objectAtIndex:i];
        [liveCurrentV selectViewController];
        return liveCurrentV;
    }
    return nil;
}

#pragma mark - Action && Notification

- (void)segmentViewValueChanged:(JJSegementView *)sender
{
    NSLog(@"替换标签了--%ld", sender.tag);
    
    [self.segmentViewsArrM enumerateObjectsUsingBlock:^(JJSegementView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
    }];
    self.segmentViewsArrM[sender.tag - 1000].selected = YES;
    
    UIView *hiddenView = [self.views objectAtIndex:sender.tag - 1000];
    [self.backScrollView scrollRectToVisible:hiddenView.frame animated:NO];
    
    [self selectViewController:sender.tag - 1000];
}

- (void)plusButtonDidClick:(UIButton *)button
{
    NSLog(@"加号按钮");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.channelScrollView) {
        return;
    }
   
    NSInteger tag = self.backScrollView.contentOffset.x / kScreenWidth;
    [self.segmentViewsArrM enumerateObjectsUsingBlock:^(JJSegementView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
    }];
    self.segmentViewsArrM[tag].selected = YES;
    JJSegementView *hiddenView = [self.segmentViewsArrM objectAtIndex:tag];
    [self.channelScrollView scrollRectToVisible:hiddenView.frame animated:NO];
    
    [self selectViewController:tag];
}

@end


















