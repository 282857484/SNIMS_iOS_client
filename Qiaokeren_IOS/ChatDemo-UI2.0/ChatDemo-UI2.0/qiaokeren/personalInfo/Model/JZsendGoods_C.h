//
//  JZsendGoods_C.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZsendGoods_C : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Billid;
    NSString* Userid;
    NSString* UploadTime;
    NSString* SendAddress;
    NSString* DeliveryNumber;
    NSString* DeliveryWay;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* SendAddress;
@property(nonatomic, copy) NSString* DeliveryNumber;
@property(nonatomic, copy) NSString* DeliveryWay;
+(JZsendGoods_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
            Billid:(NSString*)_Billid
         Userid:(NSString*)_Userid
             UploadTime:(NSString*)_UploadTime
          SendAddress:(NSString*)_SendAddress
         DeliveryNumber:(NSString*)_DeliveryNumber
      DeliveryWay:(NSString*)_DeliveryWay;

@end