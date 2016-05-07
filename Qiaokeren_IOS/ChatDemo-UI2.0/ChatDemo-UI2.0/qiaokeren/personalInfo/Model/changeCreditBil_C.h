//
//  changeCreditBil_C.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface changeCreditBil_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * billid ;
    NSString * UploadTime ;
    NSString * billstatus ;
    NSString * supOrsub ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * billid;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * billstatus;
@property(nonatomic, copy) NSString * supOrsub;


+(changeCreditBil_C*)Jz_initialize;
-(void)Jz_setValue;


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
             billid:(NSString*)_billid
         UploadTime:(NSString*)_UploadTime
         billstatus:(NSString*)_billstatus
           supOrsub:(NSString*)_supOrsub
;

@end
