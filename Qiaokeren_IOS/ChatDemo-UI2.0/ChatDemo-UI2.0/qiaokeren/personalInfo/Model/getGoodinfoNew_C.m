//
//  getGoodinfoNew_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "getGoodinfoNew_C.h"
#import "JZ_agreement_c.h"


@implementation getGoodinfoNew_C

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize goodsid;
@synthesize PageSize;
@synthesize PageIndex;

+(getGoodinfoNew_C*)Jz_initialize
{
    getGoodinfoNew_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getGoodinfoNew_C]];
    
}






-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            goodsid:(NSString*)_goodsid
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
{
    NSLog(@"%@",_saysomething);
    
       
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setGoodsid:_goodsid];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];
    
}

@end