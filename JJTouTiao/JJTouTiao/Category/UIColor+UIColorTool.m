//
//  UIColor+UIColorTool.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/19.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "UIColor+UIColorTool.h"

@implementation UIColor (UIColorTool)

+ (UIColor *)colorForHex:(NSString *)hexColor
{
    return [UIColor colorForHex:hexColor forAlpha:1.0f];
}

+ (UIColor *)colorForHex:(NSString *)hexColor forAlpha:(CGFloat)alpha
{
    // String should be 6 or 7 characters if it includes '#'
    if ([hexColor length]  < 6)
        return nil;
    
    // strip # if it appears
    if ([hexColor hasPrefix:@"#"])
        hexColor = [hexColor substringFromIndex:1];
    
    // if the value isn't 6 characters at this point return
    // the color black
    if ([hexColor length] != 6)
        return nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [hexColor substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [hexColor substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [hexColor substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

@end
