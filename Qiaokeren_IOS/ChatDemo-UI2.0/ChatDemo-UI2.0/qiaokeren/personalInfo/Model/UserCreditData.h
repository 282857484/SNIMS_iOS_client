//
//  UserCreditData.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface UserCreditData : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * creditid ;
    NSString * userid ;
    NSString * timestamp ;
    NSString * userlevel ;
    NSString * monthcredit ;
    NSString * quartercredit ;
    NSString * yearcredit ;
    NSString * time ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * creditid;
@property(nonatomic, copy) NSString * userid;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * userlevel;
@property(nonatomic, copy) NSString * monthcredit;
@property(nonatomic, copy) NSString * quartercredit;
@property(nonatomic, copy) NSString * yearcredit;
@property(nonatomic, copy) NSString * time;

+(UserCreditData*)Jz_initialize;
-(void)Jz_setValue;

-(void)initWithInfo:(NSString*)_saysomething
           creditid:(NSString*)_creditid
             userid:(NSString*)_userid
          timestamp:(NSString*)_timestamp
          userlevel:(NSString*)_userlevel
        monthcredit:(NSString*)_monthcredit
      quartercredit:(NSString*)_quartercreditsss
         yearcredit:(NSString*)_yearcredit
               time:(NSString*)_time
;

@end
