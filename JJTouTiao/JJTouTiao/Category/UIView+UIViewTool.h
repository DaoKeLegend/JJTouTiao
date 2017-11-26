//
//  UIView+UIViewTool.h
//  JJTouTiao
//
//  Created by lucy on 2017/11/19.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewTool)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;

// 移除所有子视图

- (void)removeAllSubviews;

@end
