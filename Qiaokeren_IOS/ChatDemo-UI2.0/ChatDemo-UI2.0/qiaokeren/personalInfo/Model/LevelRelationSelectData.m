//
//  LevelRelationSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LevelRelationSelectData.h"
#import "JZ_tag.h"
@implementation LevelRelationSelectData

@synthesize  p;
@synthesize  relateid;
@synthesize  userid;
@synthesize  neuserid;
@synthesize  timestamp;
@synthesize  status;
+(LevelRelationSelectData*)Jz_initialize{
    LevelRelationSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  LevelRelationSelectData]];
    
}
-(void)initWithInfo:(NSString *)saysomething relateid:(NSString *)_relateid userid:(NSString *)_userid neuserid:(NSString *)_neuserid timestamp:(NSString *)_timestamp status:(NSString *)_status{
    [self setRelateid:_relateid];
    [self setUserid:_userid];
    [self setNeuserid:_neuserid];
    [self setTimestamp:_timestamp];
    [self setStatus:_status];
}

@end
