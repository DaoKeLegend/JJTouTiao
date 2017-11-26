//
//  JJSegementView.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/19.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJSegementView.h"

@interface JJSegementView()

@end

@implementation JJSegementView

#pragma mark - Override Base Function

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

#pragma mark - Object Private Funtion

- (void)initUI
{

}

#pragma mark - Setter && Getter

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    
    [self setTitle:titleStr forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16.0];
}

@end
