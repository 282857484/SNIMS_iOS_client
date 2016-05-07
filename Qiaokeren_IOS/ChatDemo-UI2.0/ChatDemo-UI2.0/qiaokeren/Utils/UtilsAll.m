//
//  UtilsAll.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-25.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "UtilsAll.h"
#import "Reachability.h"
#import <CoreLocation/CoreLocation.h>
#import <CommonCrypto/CommonDigest.h>

@implementation UtilsAll
//获取当前时间戳
+ (NSString*)getFormatTime{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];

    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
    long sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = [[NSString alloc] initWithFormat:@"%ld",sec];
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
    if(sec < 10){
        secStr = [@"00" stringByAppendingString:secStr];
    }else if(sec < 100){
        secStr = [@"0" stringByAppendingString:secStr];
    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
//    NSLog([[NSString alloc] initWithFormat:@"year--%@",yearStr]);
//    NSLog([[NSString alloc] initWithFormat:@"month--%@",monthStr]);
//    NSLog([[NSString alloc] initWithFormat:@"day--%@",dayStr]);
//    NSLog([[NSString alloc] initWithFormat:@"hour--%@",hourStr]);
//    NSLog([[NSString alloc] initWithFormat:@"min--%@",minStr]);
//    NSLog([[NSString alloc] initWithFormat:@"sec--%@",secStr]);
    
    //    int week = [comps weekday];
    //Week:
//    1 －－星期天
//    2－－星期一
//    3－－星期二
//    4－－星期三
//    5－－星期四
//    6－－星期五
//    7－－星期六


    
    return time;
}

+ (NSString*)getFormatTime111{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
//    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"111";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
//    if(sec < 10){
//        secStr = [@"00" stringByAppendingString:secStr];
//    }else if(sec < 100){
//        secStr = [@"0" stringByAppendingString:secStr];
//    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}

+ (NSString*)getFormatTime222{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
//    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"222";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
//    if(sec < 10){
//        secStr = [@"00" stringByAppendingString:secStr];
//    }else if(sec < 100){
//        secStr = [@"0" stringByAppendingString:secStr];
//    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}

+ (NSString*)getFormatTime333{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
//    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"333";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
//    if(sec < 10){
//        secStr = [@"00" stringByAppendingString:secStr];
//    }else if(sec < 100){
//        secStr = [@"0" stringByAppendingString:secStr];
//    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}


+ (NSString*)getFormatTime444{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
    //    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"444";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
    //    if(sec < 10){
    //        secStr = [@"00" stringByAppendingString:secStr];
    //    }else if(sec < 100){
    //        secStr = [@"0" stringByAppendingString:secStr];
    //    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}


+ (NSString*)getFormatTime555{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
    //    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"555";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
    //    if(sec < 10){
    //        secStr = [@"00" stringByAppendingString:secStr];
    //    }else if(sec < 100){
    //        secStr = [@"0" stringByAppendingString:secStr];
    //    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}


+ (NSString*)getFormatTime666{
    NSString *time = @"";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    long year = [comps year];
    long month = [comps month];
    long day = [comps day];
    long hour = [comps hour];
    long min = [comps minute];
    //    int sec = [comps second];
    NSString *yearStr = [[NSString alloc] initWithFormat:@"%ld",year];
    NSString *monthStr = [[NSString alloc] initWithFormat:@"%ld",month];
    NSString *dayStr = [[NSString alloc] initWithFormat:@"%ld",day];
    NSString *hourStr = [[NSString alloc] initWithFormat:@"%ld",hour];
    NSString *minStr = [[NSString alloc] initWithFormat:@"%ld",min];
    NSString *secStr = @"666";
    
    if(month < 10){
        monthStr = [@"0" stringByAppendingString:monthStr];
    }
    if (day < 10) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    if(hour < 10){
        hourStr = [@"0" stringByAppendingString:hourStr];
    }
    if(min < 10){
        minStr = [@"0" stringByAppendingString:minStr];
    }
    //    if(sec < 10){
    //        secStr = [@"00" stringByAppendingString:secStr];
    //    }else if(sec < 100){
    //        secStr = [@"0" stringByAppendingString:secStr];
    //    }
    time = [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@",yearStr,monthStr,dayStr,hourStr,minStr,secStr];
    
    
    return time;
}

//检测网络连接状态
+ (int)checkNetworkState{
    int status=0;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            NSLog(@"没有网络连接");
            status = 0;
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            NSLog(@"使用3G网络");
            status = 1;
            break;
        case ReachableViaWiFi:
            NSLog(@"使用WiFi网络");
            status = 2;
            // 使用WiFi网络
            break;
    }
    return status;
}


NSString *location = @"112.98,28.145";
+ (void)setLocation:(NSString *)str{
    location = str;
}

//获取当前手机位置
+(NSString*)getLocation{
   return location;
}


//md5加密生成32位数据
//+ (NSString *)md5:(NSString *)str
//{
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
//    return [NSString stringWithFormat:
//            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ]; 
//}

+ (NSString*)TOString:(NSObject*)value{
    return [[NSString alloc] initWithFormat:@"%@",value];
}

+ (NSString*)getNoYearChineseTime:(NSString *)str{
    NSString* month = [str substringWithRange:NSMakeRange(4,2)];
    NSString* day = [str substringWithRange:NSMakeRange(6,2)];
    NSString* min = [str substringWithRange:NSMakeRange(8,2)];
    NSString* sec = [str substringWithRange:NSMakeRange(10,2)];
    return [[NSString alloc] initWithFormat:@"%@月%@日 %@：%@",month,day,min,sec];
}

@end
