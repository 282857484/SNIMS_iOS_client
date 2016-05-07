//
//  UtilsAll.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-25.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilsAll : NSObject
+ (NSString*)getFormatTime;
+ (NSString*)getFormatTime111;
+ (NSString*)getFormatTime222;
+ (NSString*)getFormatTime333;
+ (NSString*)getFormatTime444;
+ (NSString*)getFormatTime555;
+ (NSString*)getFormatTime666;
+ (int)checkNetworkState;
+ (void)setLocation:(NSString *)str;
+ (NSString*)getLocation;
//+ (NSString *)md5:(NSString *)str;
+ (NSString*)TOString:(NSObject*)value;
+ (NSString*)getNoYearChineseTime:(NSString *)str;

@end
