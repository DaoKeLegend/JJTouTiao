//
//  JJRecommandVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/23.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJRecommandVC.h"

@interface JJRecommandVC ()

@end

@implementation JJRecommandVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
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
    NSLog(@"JJRecommandVC - 被选中了");
    
    //接下来可以请求数据了
}

@end
