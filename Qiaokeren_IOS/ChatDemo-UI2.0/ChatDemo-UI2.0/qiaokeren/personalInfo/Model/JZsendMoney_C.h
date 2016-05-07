//
//  JZsendMoney_C.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZsendMoney_C : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Billid;
    NSString* Userid;
    NSString* UploadTime;
    NSString* Money;
    NSString* CutMapRes;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Money;
@property(nonatomic, copy) NSString* CutMapRes;
+(JZsendMoney_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Billid:(NSString*)_Billid
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
        Money:(NSString*)_Money
     CutMapRes:(NSString*)_CutMapRes;

@end