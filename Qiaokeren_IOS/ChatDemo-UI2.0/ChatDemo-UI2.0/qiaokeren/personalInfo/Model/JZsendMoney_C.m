//
//  JZsendMoney_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZsendMoney_C.h"
#import "JZ_agreement_c.h"
@implementation JZsendMoney_C

@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize  Money;
@synthesize  CutMapRes;
+(JZsendMoney_C*)Jz_initialize{
    JZsendMoney_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  sendMoney_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime Money:(NSString *)_Money CutMapRes:(NSString *)_CutMapRes {
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setMoney:_Money];
    [self setCutMapRes:_CutMapRes];
}

@end