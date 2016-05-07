//
//  NewGoodinfoData.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "NewGoodinfoData.h"
#import "JZ_tag.h"

@implementation NewGoodinfoData

@synthesize goodsname;
@synthesize QCredit;
@synthesize goodsid;


+(NewGoodinfoData*)Jz_initialize
{
    NewGoodinfoData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
//    JZ_tag* a=[JZ_tag Jz_initialize];
//    [self setP:[a  NewGoodinfoData]];
    
}



-(void)initWithInfo:(NSString*)_saysomething
            goodsid:(NSString*)_goodsid
          goodsname:(NSString*)_goodsname
            QCredit:(NSString*)_QCredit
{
    NSLog(@"%@",_saysomething);
        [self setGoodsid:_goodsid];
        [self setGoodsname:_goodsname];
        [self setQCredit:_QCredit];

}

@end