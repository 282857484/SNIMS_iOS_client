//
//  SChat.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "SChat.h"
#import "JZ_tag.h"
@implementation SChat

@synthesize  p;
@synthesize  chatid;
@synthesize  userid;
@synthesize  tosorgid;
@synthesize  chatcontent;
@synthesize  timestamp;
@synthesize  chattype;
@synthesize  resourceindex;
+(SChat*)Jz_initialize{
    SChat* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  SChat]];
    
}
-(void)initWithInfo:(NSString *)saysomething chatid:(NSString *)_chatid userid:(NSString *)_userid tosorgid:(NSString *)_tosorgid chatcontent:(NSString *)_chatcontent timestamp:(NSString *)_timestamp chattype:(NSString *)_chattype resourceindex:(NSString *)_resourceindex{
    [self setChatid:_chatid];
    [self setUserid:_userid];
    [self setTosorgid:_tosorgid];
    [self setChatcontent:_chatcontent];
    [self setTimestamp:_timestamp];
    [self setChattype:_chattype];
    [self setResourceindex:_resourceindex];
}
@end