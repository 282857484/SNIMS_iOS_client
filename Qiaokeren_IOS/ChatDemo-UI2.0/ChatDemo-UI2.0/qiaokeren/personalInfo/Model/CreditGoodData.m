//
//  CreditGoodData.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "CreditGoodData.h"
#import "JZ_tag.h"
@implementation CreditGoodData

@synthesize p;
@synthesize goodsid;
@synthesize goodsname;
@synthesize goodsdiscribe;
@synthesize goodslogo;
@synthesize goodssrc;
@synthesize goodsfacval;
@synthesize goodstval;
@synthesize goodsoneval;
@synthesize goodstwoval;
@synthesize goodstheval;
@synthesize time;

+(CreditGoodData*)Jz_initialize
{
    CreditGoodData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  CreditGoodData]];
    
}

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
{
    NSLog(@"%@",_saysomething);
    
        [self setGoodsid:_goodsid];
        [self setGoodsname:_goodsname];
        [self setGoodsdiscribe:_goodsdiscribe];
        [self setGoodslogo:_goodslogo];
        [self setGoodssrc:_goodssrc];
        [self setGoodsfacval:_goodsfacval];
        [self setGoodstval:_goodstval];
        [self setGoodsoneval:_goodsoneval];
        [self setGoodstwoval:_goodstwoval];
        [self setGoodstheval:_goodstheval];
        [self setTime:_time];
    
}

@end
