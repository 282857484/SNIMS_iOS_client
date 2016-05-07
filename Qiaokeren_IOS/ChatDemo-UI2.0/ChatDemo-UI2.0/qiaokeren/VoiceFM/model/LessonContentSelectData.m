//
//  LessonContentSelectData.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LessonContentSelectData.h"


@implementation LessonContentSelectData
//id instance2 = nil;
//@synthesize p;
@synthesize classcontentid;
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

-(void)initWithInfo:(NSString *)_saysomething  classcontentid:(NSString *)_classcontentid classid:(NSString *)_classid userid:(NSString *)_userid timestamp:(NSString *)_timestamp username:(NSString *)_username place:(NSString *)_place contentclass:(NSString *)_contentclass content:(NSString *)_content url:(NSString *)_url tip:(NSString *)_tip{
    NSLog(@"%@",_saysomething);

//        [self setP:]
        [self setClasscontentid:_classcontentid];
        [self setClassid:_classid];
        [self setUserid:_userid];
        [self setTimestamp:_timestamp];
        [self setUsername:_username];
        [self setPlace:_place];
        [self setContentclass:_classcontentid];
        [self setContent:_content];
        [self setUrl:_url];
        [self setTip:_tip];

}
-(void)isValid{
    
}
@end
