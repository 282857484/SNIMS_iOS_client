//
//  JZsendMoney_S.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZsendMoney_S : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Billid;
    NSString* Userid;
    NSString* UploadTime;
    NSString* Mark;
    NSString* Content;
    NSString* Billstatus;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* Billstatus;
+(JZsendMoney_S*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Billid:(NSString*)_Billid
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
         Billstatus:(NSString*)_Billstatus;

@end