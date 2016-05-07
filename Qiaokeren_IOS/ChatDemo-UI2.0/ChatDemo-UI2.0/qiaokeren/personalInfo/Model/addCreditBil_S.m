//
//  addCreditBil_S.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "addCreditBil_S.h"
#import "JZ_agreement_s.h"


@implementation addCreditBil_S

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize Mark;
@synthesize Content;
@synthesize billid;



+(addCreditBil_S*)Jz_initialize
{
    addCreditBil_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  addCreditBil_S]];
    
}




-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
             billid:(NSString*)_billid
{
    NSLog(@"%@",_saysomething);
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setMark:_Mark];
        [self setContent:_Content];
        [self setBillid:_billid];
    
}

@end