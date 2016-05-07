//
//  getLesson_C.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "getLesson_C.h"
#import "FMProtocol_C.h"

@implementation getLesson_C
//id instance2 = nil;
@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize classid;
@synthesize userid;
@synthesize timestamp;
@synthesize username;
@synthesize userlevel;
@synthesize classlevel;
@synthesize place;
@synthesize introduce;
@synthesize topic;
@synthesize type;
@synthesize suit;
@synthesize PageSize;
@synthesize PageIndex;
+(id)instance2{
    id instance2 = [[super alloc] init];
    return instance2;
}


-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            classid:(NSString*)_classid
             userid:(NSString*)_userid
          timestamp:(NSString*)_timestamp
           username:(NSString*)_username
          userlevel:(NSString*)_userlevel
         classlevel:(NSString*)_classlevel
              place:(NSString*)_place
          introduce:(NSString*)_introduce
              topic:(NSString*)_topic
               type:(NSString*)_type
               suit:(NSString*)_suit
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
{
    NSLog(@"%@",_saysomething);

        [self setP:[[FMProtocol_C initTheProtocol] getLesson_C]];
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setClassid:_classid];
        [self setUserid:_userid];
        [self setTimestamp:_timestamp];
        [self setUsername:_username];
        [self setUserlevel:_userlevel];
        [self setClasslevel:_classlevel];
        [self setPlace:_place];
        [self setIntroduce:_introduce];
        [self setTopic:_topic];
        [self setType:_type];
        [self setSuit:_suit];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];

}

@end
