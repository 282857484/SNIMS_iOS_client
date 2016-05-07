//
//  getLessonContent_S.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "getLessonContent_S.h"
#import "FMProtocol_C.h"


@implementation getLessonContent_S
//id instance2 = nil;
@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize Mark;
@synthesize Content;
@synthesize PageSize;
@synthesize PageIndex;
@synthesize LessonContentSelectDataList;
+(id)instance2{
    id instance2 = [[super alloc] init];
    return instance2;
}


-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
LessonContentSelectDataList:(NSString*)_LessonContentSelectDataList
{
    NSLog(@"%@",_saysomething);

        [self setP:[[FMProtocol_C initTheProtocol] getLessonContent_S]];
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setMark:_Mark];
        [self setContent:_Content];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];
        [self setLessonContentSelectDataList:_LessonContentSelectDataList];

}

@end
