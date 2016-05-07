//
//  JZSubmit_C.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZSubmit_C : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Goodsid;
    NSString* Userid;
    NSString* UpLevelUserid;
    NSString* UploadTime;
    NSString* Billstatus;
    NSString* Goodsperval;
    NSString* Goodsnumber;
    NSString* Location;
    NSString* ReceiveAddress;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Goodsid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UpLevelUserid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Billstatus;
@property(nonatomic, copy) NSString* Goodsperval;
@property(nonatomic, copy) NSString* Goodsnumber;
@property(nonatomic, copy) NSString* Location;
@property(nonatomic, copy) NSString* ReceiveAddress;
+(JZSubmit_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Goodsid:(NSString*)_Goodsid
             Userid:(NSString*)_Userid
         UpLevelUserid:(NSString*)_UpLevelUserid
         UploadTime:(NSString*)_UploadTime
         Billstatus:(NSString*)_Billstatus
         Goodsperval:(NSString*)_Goodsperval
         Goodsnumber:(NSString*)_Goodsnumber
         Location:(NSString*)_Location
          ReceiveAddress:(NSString*)_ReceiveAddress;

@end