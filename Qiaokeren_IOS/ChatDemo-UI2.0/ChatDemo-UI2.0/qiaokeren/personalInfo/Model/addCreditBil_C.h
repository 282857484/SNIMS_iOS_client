//
//  addCreditBil_C.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JZGetValueInDictionary.h"

@interface addCreditBil_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * goodsid ;
    NSString * upmasteruserid ;
    NSString * timestamp ;
    NSString * billstatus ;
    NSString * goodsperval ;
    NSString * goodsnumber ;
    NSString * location ;
    NSString * sendaddress ;
    NSString * receiveaddress ;
    NSString * deliverynumber ;
    NSString * deliveryway ;
    NSString * cutmapres ;
    NSString * totalprice ;
    NSString * submittime ;
    NSString * accepttime ;
    NSString * sendmoney ;
    NSString * sendgoodstime ;
    NSString * receivegoodstime ;
    NSString * mark ;
    NSString * time ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * goodsid;
@property(nonatomic, copy) NSString * upmasteruserid;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * billstatus;
@property(nonatomic, copy) NSString * goodsperval;
@property(nonatomic, copy) NSString * goodsnumber;
@property(nonatomic, copy) NSString * location;
@property(nonatomic, copy) NSString * sendaddress;
@property(nonatomic, copy) NSString * receiveaddress;
@property(nonatomic, copy) NSString * deliverynumber;
@property(nonatomic, copy) NSString * deliveryway;
@property(nonatomic, copy) NSString * cutmapres;
@property(nonatomic, copy) NSString * totalprice;
@property(nonatomic, copy) NSString * submittime;
@property(nonatomic, copy) NSString * accepttime;
@property(nonatomic, copy) NSString * sendmoney;
@property(nonatomic, copy) NSString * sendgoodstime;
@property(nonatomic, copy) NSString * receivegoodstime;
@property(nonatomic, copy) NSString * mark;
@property(nonatomic, copy) NSString * time;

+(addCreditBil_C*)Jz_initialize;
-(void)Jz_setValue;

-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            goodsid:(NSString*)_goodsid
     upmasteruserid:(NSString*)_upmasteruserid
          timestamp:(NSString*)_timestamp
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
               time:(NSString*)_time ;

@end