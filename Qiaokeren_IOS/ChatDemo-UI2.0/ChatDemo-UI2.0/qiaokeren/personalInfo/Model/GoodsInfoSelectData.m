//
//  GoodsInfoSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "GoodsInfoSelectData.h"
#import "JZ_tag.h"
@implementation GoodsInfoSelectData

@synthesize  p;
@synthesize  goodsid;
@synthesize  goodsname;
@synthesize  goodsdiscribe;
@synthesize  goodslogo;
@synthesize  goodssrc;
@synthesize  goodsfacval;
@synthesize  goodstval;
@synthesize  goodsoneval;
@synthesize  goodstwoval;
@synthesize  goodstheval;
+(GoodsInfoSelectData*)Jz_initialize{
    GoodsInfoSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  GoodsInfoSelectData]];
    
}
-(void)initWithInfo:(NSString *)saysomething goodsid:(NSString *)_goodsid goodsname:(NSString *)_goodsname goodsdiscribe:(NSString *)_goodsdiscribe goodslogo:(NSString *)_goodslogo goodssrc:(NSString *)_goodssrc goodsfacval:(NSString *)_goodsfacval goodstval:(NSString *)_goodstval goodsoneval:(NSString *)_goodsoneval goodstwoval:(NSString *)_goodstwoval goodstheval:(NSString *)_goodstheval{
    [self setGoodsid:_goodsid];
    [self setGoodsname:_goodsname];
    [self setGoodsdiscribe:_goodsdiscribe];
    [self setGoodslogo:_goodslogo];
    [self setGoodssrc:_goodssrc];
    [self setGoodsfacval:_goodsfacval];
    [self setGoodstval:_goodstval];
    [self setGoodstheval:_goodstheval];
    [self setGoodsoneval:_goodsoneval];
    [self setGoodstwoval:_goodstwoval];
    [self setGoodstheval:_goodstheval];
}

@end
