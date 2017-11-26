//
//  JJOtherVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/23.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJOtherVC.h"

@interface JJOtherVC ()

@end

@implementation JJOtherVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat red = arc4random_uniform(255)/255.0;
    CGFloat green = arc4random_uniform(255)/255.0;
    CGFloat blue = arc4random_uniform(255)/255.0;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
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
    NSLog(@"JJOtherVC - 被选中了");
    
    //接下来可以请求数据了
}

@end
