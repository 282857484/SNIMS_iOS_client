//
//  addLessonContent_C.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "addLessonContent_C.h"
#import "FMProtocol_C.h"


@implementation addLessonContent_C
//id instance2 = nil;
@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize classid;
@synthesize userid;
@synthesize timestamp;
@synthesize username;
@synthesize place;
@synthesize contentclass;
@synthesize content;
@synthesize url;
@synthesize tip;
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
              place:(NSString*)_place
       contentclass:(NSString*)_contentclass
            content:(NSString*)_content
                url:(NSString*)_url
                tip:(NSString*)_tip
{
    NSLog(@"%@",_saysomething);

        [self setP:[[FMProtocol_C initTheProtocol] addLessonContent_C]];
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setClassid:_classid];
        [self setUserid:_userid];
        [self setTimestamp:_timestamp];
        [self setUsername:_username];
        [self setPlace:_place];
        [self setContentclass:_contentclass];
        [self setContent:_content];
        [self setUrl:_url];
        [self setTip:_tip];
 
}

@end
