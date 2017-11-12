//
//  JJMineVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJMineVC.h"

@interface JJMineVC ()

@end

@implementation JJMineVC

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor magentaColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

@end
