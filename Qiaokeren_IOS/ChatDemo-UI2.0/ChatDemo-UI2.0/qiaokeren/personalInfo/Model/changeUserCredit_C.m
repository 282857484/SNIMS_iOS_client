//
//  changeUserCredit_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "changeUserCredit_C.h"
#import "JZ_agreement_c.h"

@implementation changeUserCredit_C

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize incOrrecflog;
@synthesize changeCredit;
@synthesize Credittype;
@synthesize time;

+(changeUserCredit_C*)Jz_initialize
{
    changeUserCredit_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  changeUserCredit_C]];
    
}

-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
       incOrrecflog:(NSString*)_incOrrecflog
       changeCredit:(NSString*)_changeCredit
         Credittype:(NSString *)_Credittype
               time:(NSString *)_time

{
    NSLog(@"%@",_saysomething);
    
    
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setIncOrrecflog:_incOrrecflog];
        [self setChangeCredit:_changeCredit];
        [self setCredittype:_Credittype];
        [self setTime:_time];
    
}

@end
