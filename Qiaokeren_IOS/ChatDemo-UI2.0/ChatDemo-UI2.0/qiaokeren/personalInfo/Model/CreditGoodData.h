//
//  CreditGoodData.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface CreditGoodData : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * goodsid ;
    NSString * goodsname ;
    NSString * goodsdiscribe ;
    NSString * goodslogo ;
    NSString * goodssrc ;
    NSString * goodsfacval ;
    NSString * goodstval ;
    NSString * goodsoneval ;
    NSString * goodstwoval ;
    NSString * goodstheval ;
    NSString * time ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * goodsid;
@property(nonatomic, copy) NSString * goodsname;
@property(nonatomic, copy) NSString * goodsdiscribe;
@property(nonatomic, copy) NSString * goodslogo;
@property(nonatomic, copy) NSString * goodssrc;
@property(nonatomic, copy) NSString * goodsfacval;
@property(nonatomic, copy) NSString * goodstval;
@property(nonatomic, copy) NSString * goodsoneval;
@property(nonatomic, copy) NSString * goodstwoval;
@property(nonatomic, copy) NSString * goodstheval;
@property(nonatomic, copy) NSString * time;

+(CreditGoodData*)Jz_initialize;
-(void)Jz_setValue;

-(void)initWithInfo:(NSString*)_saysomething
            goodsid:(NSString*)_goodsid
          goodsname:(NSString*)_goodsname
      goodsdiscribe:(NSString*)_goodsdiscribe
          goodslogo:(NSString*)_goodslogo
           goodssrc:(NSString*)_goodssrc
        goodsfacval:(NSString*)_goodsfacval
          goodstval:(NSString*)_goodstval
        goodsoneval:(NSString*)_goodsoneval
        goodstwoval:(NSString*)_goodstwoval
        goodstheval:(NSString*)_goodstheval
               time:(NSString*)_time
;

@end
