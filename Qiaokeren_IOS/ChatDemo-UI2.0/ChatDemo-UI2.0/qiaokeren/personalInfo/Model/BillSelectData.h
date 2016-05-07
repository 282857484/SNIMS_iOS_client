//
//  BillSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface BillSelectData : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* billid;
    NSString* goodsid;
    NSString* userid;
    NSString* upmasteruserid;
    NSString* timestamp;
    NSString* billstatus;
    NSString* goodsperval;
    NSString* goodsnumber;
    NSString* location;
    NSString* sendaddress;
    NSString* receiveaddress;
    NSString* deliverynumber;
    NSString* deliveryway;
    NSString* cutmapres;
    NSString* totalprice;
    NSString* submittime;
    NSString* accepttime;
    NSString* sendmoney;
    NSString* sendgoodstime;
    NSString* receivegoodstime;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* billid;
@property(nonatomic, copy) NSString* goodsid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* upmasteruserid;
@property(nonatomic, copy) NSString* timestamp;
@property(nonatomic, copy) NSString* billstatus;
@property(nonatomic, copy) NSString* goodsperval;
@property(nonatomic, copy) NSString* goodsnumber;
@property(nonatomic, copy) NSString* location;
@property(nonatomic, copy) NSString* sendaddress;
@property(nonatomic, copy) NSString* receiveaddress;
@property(nonatomic, copy) NSString* deliverynumber;
@property(nonatomic, copy) NSString* deliveryway;
@property(nonatomic, copy) NSString* cutmapres;
@property(nonatomic, copy) NSString* totalprice;
@property(nonatomic, copy) NSString* submittime;
@property(nonatomic, copy) NSString* accepttime;
@property(nonatomic, copy) NSString* sendmoney;
@property(nonatomic, copy) NSString* sendgoodstime;
@property(nonatomic, copy) NSString* receivegoodstime;
+(BillSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
        billid:(NSString*)_billid
             goodsid:(NSString*)_goodsid
          userid:(NSString*)_userid
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
    receivegoodstime:(NSString*)_receivegoodstime;

@end
