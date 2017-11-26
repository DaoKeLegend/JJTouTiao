//
//  UIColor+UIColorTool.h
//  JJTouTiao
//
//  Created by lucy on 2017/11/19.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColorTool)

/**
 *  十六进制转颜色
 *
 *  @param hexColor 十六进制
 *
 *  @return 对应颜色
 */
+ (UIColor *)colorForHex:(NSString *)hexColor;

@end
