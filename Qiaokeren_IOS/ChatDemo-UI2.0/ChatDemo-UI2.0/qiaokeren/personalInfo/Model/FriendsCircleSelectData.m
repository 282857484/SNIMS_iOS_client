//
//  FriendsCircleSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-31.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "FriendsCircleSelectData.h"
#import "JZ_tag.h"
@implementation FriendsCircleSelectData

@synthesize  fcid;
@synthesize  userid;
@synthesize  timestamp;
@synthesize  level;
@synthesize  fccontent;
@synthesize  photo;
@synthesize  time;
+(FriendsCircleSelectData*)Jz_initialize{
    FriendsCircleSelectData* a = [[super alloc]init];
    return a;
}

-(void)initWithInfo:(NSString *)saysomething fcid:(NSString *)_fcid userid:(NSString *)_userid timestamp:(NSString *)_timestamp level:(NSString *)_level fccontent:(NSString *)_fccontent photo:(NSString *)_photo time:(NSString *)_time{
    [self setFccontent:_fcid];
    [self setUserid:_userid];
    [self setTimestamp:_timestamp];
    [self setLevel:_level];
    [self setFccontent:_fccontent];
    [self setPhoto:_photo];
    [self setTime:_time];
}

@end