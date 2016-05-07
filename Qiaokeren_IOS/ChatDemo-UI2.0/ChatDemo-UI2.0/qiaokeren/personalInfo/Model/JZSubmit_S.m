//
//  JZSubmit_S.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZSubmit_S.h"
#import "JZ_agreement_s.h"
@implementation JZSubmit_S

@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UpLevelUserid;
@synthesize  UploadTime;
@synthesize  Billstatus;
@synthesize  Mark;
@synthesize  Content;
+(JZSubmit_S*)Jz_initialize{
    JZSubmit_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  Submit_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UpLevelUserid:(NSString *)_UpLevelUserid UploadTime:(NSString *)_UploadTime Billstatus:(NSString *)_Billstatus Mark:(NSString *)_Mark Content:(NSString *)_Content{
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUpLevelUserid:_UpLevelUserid];
    [self setUpLevelUserid:_UploadTime];
    [self setBillstatus:_Billstatus];
    [self setMark:_Mark];
    [self setContent:_Content];
}

@end