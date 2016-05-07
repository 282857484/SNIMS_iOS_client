//
//  JZsendGoods_S.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZsendGoods_S.h"
#import "JZ_agreement_s.h"
@implementation JZsendGoods_S

@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize  Mark;
@synthesize  Content;
@synthesize  Billstatus;
+(JZsendGoods_S*)Jz_initialize{
    JZsendGoods_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  sendGoods_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime Mark:(NSString *)_Mark Content:(NSString *)_Content Billstatus:(NSString *)_Billstatus{
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setBillid:_Billid];
}

@end