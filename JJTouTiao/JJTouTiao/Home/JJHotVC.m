//
//  JJHotVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/23.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJHotVC.h"

@interface JJHotVC ()

@end

@implementation JJHotVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
}

#pragma mark - Object Public Function

- (instancetype)initWithDiscovery:(BOOL)isNew
                              tag:(BOOL)isTag
                       withBanner:(BOOL)isBanner
                          withKey:(NSString *)key
                     withPosition:(NSInteger)position
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - JJLiveBaseProtocol

- (void)loadDataWithSuperVC:(UIViewController *)controller view:(UIView *)view withIndex:(NSInteger)index
{
    if (controller != nil) {
        [controller addChildViewController:self];
    }
    
    if (view != nil) {
        [view addSubview:self.view];
        self.view.frame = view.bounds;
    }
}

- (void)selectViewController
{
    NSLog(@"JJHotVC - 被选中了");
    
    //接下来可以请求数据了
}

@end
