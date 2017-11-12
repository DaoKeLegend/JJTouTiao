//
//  JJTabBarVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/10/31.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJTabBarVC.h"
#import "JJTabBar.h"
#import "JJNavigationVC.h"
#import "JJMineVC.h"
#import "JJMicroTouTiaoVC.h"
#import "JJVideoVC.h"
#import "JJHomeVC.h"

@interface JJTabBarVC ()

@property (nonatomic, strong) JJTabBar *customTabbar;

@end

@implementation JJTabBarVC

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self initUI];
}

#pragma mark - Object Private Function

- (void)initUI
{
    self.customTabbar = [[JJTabBar alloc] init];
    [self setValue:self.customTabbar forKey:@"tabBar"];
    
    [self addChildVCWithController:@"JJHomeVC" title:@"首页" imageName:@"home_tabbar_unselected" selectedImageName:@"home_tabbar_selected" navigationBarStyle:JJNavigationVCBarStyleHome];
    [self addChildVCWithController:@"JJVideoVC" title:@"西瓜视频" imageName:@"shortvideo_tabbar_unselected" selectedImageName:@"shortvideo_tabbar_selected" navigationBarStyle:JJNavigationVCBarStyleVideo];
    [self addChildVCWithController:@"JJMicroTouTiaoVC" title:@"微头条" imageName:@"micro_tabbar_unselected" selectedImageName:@"micro_tabbar_selected" navigationBarStyle:JJNavigationVCBarStyleMicro];
    [self addChildVCWithController:@"JJMineVC" title:@"我的" imageName:@"mine_tabbar_unselected" selectedImageName:@"mine_tabbar_selected" navigationBarStyle:JJNavigationVCBarStyleMine];
}

- (void)addChildVCWithController: (NSString *)vcName title: (NSString *)title imageName: (NSString *)imageName selectedImageName:(NSString *)selectImageName navigationBarStyle:(JJNavigationVCBarStyle)style
{
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    JJNavigationVC *nav = [[JJNavigationVC alloc] initWithRootViewController:vc];
    
    //导航栏的样式
    switch (style) {
        case JJNavigationVCBarStyleHome:
            nav.style = JJNavigationVCBarStyleHome;
            break;
        default:
            break;
    }
    
    if ([vc isKindOfClass:[UIViewController class]]) {
        vc.title = title;
        vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    }
    [self addChildViewController:nav];
}

@end









