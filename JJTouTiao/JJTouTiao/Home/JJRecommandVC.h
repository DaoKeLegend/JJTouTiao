//
//  JJRecommandVC.h
//  JJTouTiao
//
//  Created by lucy on 2017/11/23.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJLIveBaseVC.h"

@interface JJRecommandVC : JJLIveBaseVC

- (instancetype)initWithDiscovery:(BOOL)isNew
                              tag:(BOOL)isTag
                       withBanner:(BOOL)isBanner
                          withKey:(NSString *)key
                     withPosition:(NSInteger )position;

@end
