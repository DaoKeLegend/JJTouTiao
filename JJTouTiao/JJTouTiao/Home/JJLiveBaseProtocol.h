//
//  JJLiveBaseProtocol.h
//  JJTouTiao
//
//  Created by lucy on 2017/11/23.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JJLiveBaseProtocol <NSObject>

@optional

- (void)loadDataWithSuperVC:(UIViewController *)controller
                       view:(UIView *)view
                  withIndex:(NSInteger)index;

- (void)selectViewController;

@end





