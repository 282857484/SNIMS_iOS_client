//
//  CreditBillData.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "CreditBillData.h"
#import "JZ_tag.h"

@implementation CreditBillData

@synthesize p;
@synthesize billid;
@synthesize goodsid;
@synthesize userid;
@synthesize upmasteruserid;
@synthesize hhtimestamp;
@synthesize billstatus;
@synthesize goodsperval;
@synthesize goodsnumber;
@synthesize hhlocation;
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


+(CreditBillData*)Jz_initialize
{
    CreditBillData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  CreditBillData]];
    
}

-(void)initWithInfo:(NSString*)_saysomething
             billid:(NSString*)_billid
            goodsid:(NSString*)_goodsid
             userid:(NSString*)_userid
     upmasteruserid:(NSString*)_upmasteruserid
          hhtimestamp:(NSString*)_hhtimestamp
         billstatus:(NSString*)_billstatus
        goodsperval:(NSString*)_goodsperval
        goodsnumber:(NSString*)_goodsnumber
           location:(NSString*)_location
        sendaddress:(NSString*)_sendaddress
     receiveaddress:(NSString*)_receiveaddress
     deliverynumber:(NSString*)_deliverynumber
        deliveryway:(NSString*)_deliveryway
          cutmapres:(NSString*)_cutmapres
         totalprice:(NSString*)_totalprice
         submittime:(NSString*)_submittime
         accepttime:(NSString*)_accepttime
          sendmoney:(NSString*)_sendmoney
      sendgoodstime:(NSString*)_sendgoodstime
   receivegoodstime:(NSString*)_receivegoodstime
               mark:(NSString*)_mark
{
    NSLog(@"%@",_saysomething);
        [self setBillid:_billid];
        [self setGoodsid:_goodsid];
        [self setUserid:_userid];
        [self setUpmasteruserid:_upmasteruserid];
        [self setHhtimestamp:_hhtimestamp];
        [self setBillstatus:_billstatus];
        [self setGoodsperval:_goodsperval];
        [self setGoodsnumber:_goodsnumber];
        [self setHhlocation:_location];
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
   
}

@end
