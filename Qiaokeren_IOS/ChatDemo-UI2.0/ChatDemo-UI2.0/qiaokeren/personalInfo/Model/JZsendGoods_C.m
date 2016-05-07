//
//  JZsendGoods_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZsendGoods_C.h"
#import "JZ_agreement_c.h"
@implementation JZsendGoods_C

@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize  SendAddress;
@synthesize  DeliveryNumber;
@synthesize  DeliveryWay;
+(JZsendGoods_C*)Jz_initialize{
    JZsendGoods_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  sendGoods_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime SendAddress:(NSString *)_SendAddress DeliveryNumber:(NSString *)_DeliveryNumber DeliveryWay:(NSString *)_DeliveryWay{
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setSendAddress:_SendAddress];
    [self setDeliveryNumber:_DeliveryNumber];
    [self setDeliveryWay:_DeliveryWay];
}

@end