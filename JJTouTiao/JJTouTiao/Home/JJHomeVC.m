//
//  JJHomeVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJHomeVC.h"

@interface JJHomeVC ()

@property (nonatomic, strong) UIScrollView *channelScrollView;

@end

@implementation JJHomeVC

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    //顶部滚动频道选择视图
    self.channelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 64.0, kScreenWidth, 30.0)];
    self.channelScrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.channelScrollView];
}

@end
