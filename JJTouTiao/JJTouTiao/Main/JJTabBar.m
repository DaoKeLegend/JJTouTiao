//
//  JJTabBar.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJTabBar.h"

@interface JJTabBar()

@property (nonatomic, strong) UIButton *composedButton;

@end

@implementation JJTabBar

#pragma mark - Override Base Function

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(self.composedButton.frame, point)) {
        return self.composedButton;
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger tabBarButtonWidth = [UIScreen mainScreen].bounds.size.width * 0.2;
    NSInteger index = 0;
    
    for (UIView *value in self.subviews) {
        if ([value isKindOfClass:[NSClassFromString(@"UITabBarButton") class]]) {
            
            CGRect tabBarButtonFrame = value.frame;
            
            tabBarButtonFrame.origin.x = tabBarButtonWidth * index;
            tabBarButtonFrame.size.width = tabBarButtonWidth;
            value.frame = tabBarButtonFrame;
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
    
    CGPoint composeButtonCenter = self.composedButton.center;
    composeButtonCenter.x = [UIScreen mainScreen].bounds.size.width * 0.5;
    composeButtonCenter.y = self.bounds.size.height * 0.3;
    
    self.composedButton.center = composeButtonCenter;
}

#pragma mark - Object Private Function

- (void)initUI
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"publish_tabbar"] forState:UIControlStateNormal];
    [button addTarget:self action: @selector(composeButtonDidCompose) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    self.composedButton = button;
    [self addSubview:self.composedButton];
}
                        
#pragma mark - Action && Notification
                        
- (void)composeButtonDidCompose
{
    NSLog(@"中间按钮被点击了");
}

@end












