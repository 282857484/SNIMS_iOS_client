//
//  JZSubmit_S.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"
@interface JZSubmit_S : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Billid;
    NSString* Userid;
    NSString* UpLevelUserid;
    NSString* UploadTime;
    NSString* Billstatus;
    NSString* Mark;
    NSString* Content;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UpLevelUserid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Billstatus;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
+(JZSubmit_S*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Billid:(NSString*)_Billid
             Userid:(NSString*)_Userid
         UpLevelUserid:(NSString*)_UpLevelUserid
         UploadTime:(NSString*)_UploadTime
         Billstatus:(NSString*)_Billstatus
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content;

@end