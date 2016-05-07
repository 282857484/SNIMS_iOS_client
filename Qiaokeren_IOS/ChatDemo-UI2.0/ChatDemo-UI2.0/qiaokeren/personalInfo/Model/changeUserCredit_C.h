//
//  changeUserCredit_C.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface changeUserCredit_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * incOrrecflog ;
    NSString * changeCredit ;
    NSString * Credittype;
    NSString * time ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * incOrrecflog;
@property(nonatomic, copy) NSString * changeCredit;
@property(nonatomic, copy) NSString * Credittype;
@property(nonatomic, copy) NSString * time;

+(changeUserCredit_C*)Jz_initialize;
-(void)Jz_setValue;


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
       incOrrecflog:(NSString*)_incOrrecflog
       changeCredit:(NSString*)_changeCredit
         Credittype:(NSString*)_Credittype
               time:(NSString*)_time
;

@end
