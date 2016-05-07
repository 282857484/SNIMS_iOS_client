//
//  JZSubmit_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZSubmit_C.h"
#import "JZ_agreement_c.h"
@implementation JZSubmit_C

@synthesize  p;
@synthesize  Goodsid;
@synthesize  Userid;
@synthesize  UpLevelUserid;
@synthesize  UploadTime;
@synthesize  Billstatus;
@synthesize  Goodsperval;
@synthesize  Goodsnumber;
@synthesize  Location;
@synthesize  ReceiveAddress;
+(JZSubmit_C*)Jz_initialize{
    JZSubmit_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  Submit_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Goodsid:(NSString *)_Goodsid Userid:(NSString *)_Userid UpLevelUserid:(NSString *)_UpLevelUserid UploadTime:(NSString *)_UploadTime Billstatus:(NSString *)_Billstatus Goodsperval:(NSString *)_Goodsperval Goodsnumber:(NSString *)_Goodsnumber Location:(NSString *)_Location ReceiveAddress:(NSString *)_ReceiveAddress{
    [self setGoodsid:_Goodsid];
    [self setUserid:_Userid];
    [self setUpLevelUserid:_UpLevelUserid];
    [self setUploadTime:_UploadTime];
    [self setBillstatus:_Billstatus];
    [self setGoodsperval:_Goodsperval];
    [self setGoodsnumber:_Goodsnumber];
    [self setLocation:_Location];
    [self setReceiveAddress:_ReceiveAddress];
}
@end