//
//  addCreditBil_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "addCreditBil_C.h"
#import "JZ_agreement_c.h"

@implementation addCreditBil_C

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize goodsid;
@synthesize upmasteruserid;
@synthesize timestamp;
@synthesize billstatus;
@synthesize goodsperval;
@synthesize goodsnumber;
@synthesize location;
@synthesize sendaddress;
@synthesize receiveaddress;
@synthesize deliverynumber;
@synthesize deliveryway;
@synthesize cutmapres;
@synthesize totalprice;
@synthesize submittime;
@synthesize accepttime;
@synthesize sendmoney;
@synthesize sendgoodstime;
@synthesize receivegoodstime;
@synthesize mark;
@synthesize time;

+(addCreditBil_C*)Jz_initialize
{
    addCreditBil_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;

}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  addCreditBil_C]];

}


-(void)initWithInfo:(NSString *)_saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime goodsid:(NSString *)_goodsid upmasteruserid:(NSString *)_upmasteruserid timestamp:(NSString *)_timestamp billstatus:(NSString *)_billstatus goodsperval:(NSString *)_goodsperval goodsnumber:(NSString *)_goodsnumber location:(NSString *)_location sendaddress:(NSString *)_sendaddress receiveaddress:(NSString *)_receiveaddress deliverynumber:(NSString *)_deliverynumber deliveryway:(NSString *)_deliveryway cutmapres:(NSString *)_cutmapres totalprice:(NSString *)_totalprice submittime:(NSString *)_submittime accepttime:(NSString *)_accepttime sendmoney:(NSString *)_sendmoney sendgoodstime:(NSString *)_sendgoodstime receivegoodstime:(NSString *)_receivegoodstime mark:(NSString *)_mark time:(NSString *)_time
{
    NSLog(@"%@",_saysomething);

        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setGoodsid:_goodsid];
        [self setUpmasteruserid:_upmasteruserid];
        [self setTimestamp:_timestamp];
        [self setBillstatus:_billstatus];
        [self setGoodsperval:_goodsperval];
        [self setGoodsnumber:_goodsnumber];
        [self setLocation:_location];
        [self setSendaddress:_sendaddress];
        [self setReceiveaddress:_receiveaddress];
        [self setDeliverynumber:_deliverynumber];
        [self setDeliveryway:_deliveryway];
        [self setCutmapres:_cutmapres];
        [self setTotalprice:_totalprice];
        [self setSubmittime:_submittime];
        [self setAccepttime:_accepttime];
        [self setSendmoney:_sendmoney];
        [self setSendgoodstime:_sendgoodstime];
        [self setReceivegoodstime:_receivegoodstime];
        [self setMark:_mark];
        [self setTime:_time];
 



}

@end