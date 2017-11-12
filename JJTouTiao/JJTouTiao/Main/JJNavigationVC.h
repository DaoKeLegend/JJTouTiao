//
//  JJNavigationVC.h
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JJNavigationVCBarStyle) {
    JJNavigationVCBarStyleHome,
    JJNavigationVCBarStyleVideo,
    JJNavigationVCBarStyleMicro,
    JJNavigationVCBarStyleMine
};

@interface JJNavigationVC : UINavigationController

@property (nonatomic, assign) JJNavigationVCBarStyle style;

@end

