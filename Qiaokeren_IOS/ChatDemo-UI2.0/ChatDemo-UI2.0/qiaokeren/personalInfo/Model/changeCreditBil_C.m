//
//  changeCreditBil_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "changeCreditBil_C.h"
#import "JZ_agreement_c.h"
@implementation changeCreditBil_C

@synthesize p;
@synthesize UserID;
@synthesize billid;
@synthesize UploadTime;
@synthesize billstatus;
@synthesize supOrsub;


+(changeCreditBil_C*)Jz_initialize
{
    changeCreditBil_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  changeCreditBil_C]];
    
}

-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
             billid:(NSString*)_billid
         UploadTime:(NSString*)_UploadTime
         billstatus:(NSString*)_billstatus
           supOrsub:(NSString*)_supOrsub
{
    NSLog(@"%@",_saysomething);
  
        [self setUserID:_UserID];
        [self setBillid:_billid];
        [self setUploadTime:_UploadTime];
        [self setBillstatus:_billstatus];
        [self setSupOrsub:_supOrsub];
    
}

@end