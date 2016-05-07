//
//  getLesson_S.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "getLesson_S.h"
#import "FMProtocol_C.h"


@implementation getLesson_S
id instance2 = nil;
@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize Mark;
@synthesize PageSize;
@synthesize PageIndex;
@synthesize LessonInfoSelectDataList;
+(id)instance2{
    id instance2 = [[super alloc] init];
    return instance2;
}


-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
LessonInfoSelectDataList:(NSString*)_LessonInfoSelectDataList
{
    NSLog(@"%@",_saysomething);

        [self setP:[[FMProtocol_C initTheProtocol] getLesson_S]];
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setMark:_Mark];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];
        [self setLessonInfoSelectDataList:_LessonInfoSelectDataList];

}

@end