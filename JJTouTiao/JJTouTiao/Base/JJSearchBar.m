//
//  JJSearchBar.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/12.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJSearchBar.h"

@implementation JJSearchBar

#pragma mark - Override Base Function

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.barTintColor = [UIColor whiteColor];
    UITextField *searchTextField = [[[self.subviews firstObject] subviews] lastObject];
    searchTextField.frame = self.bounds;
}

@end
