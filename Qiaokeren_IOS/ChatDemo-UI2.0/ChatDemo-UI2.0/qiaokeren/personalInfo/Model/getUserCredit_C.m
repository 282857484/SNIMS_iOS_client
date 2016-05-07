//
//  getUserCredit_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "getUserCredit_C.h"
#import "JZ_agreement_c.h"

@implementation getUserCredit_C

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize time;


+(getUserCredit_C*)Jz_initialize
{
    getUserCredit_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getUserCredit_C]];
    
}


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               time:(NSString*)_time
{
    NSLog(@"%@",_saysomething);
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setTime:_time];
    
}

@end
