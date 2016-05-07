//
//  JZgetHotNews_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-15.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZgetHotNews_C.h"
#import "JZ_agreement_c.h"
@implementation JZgetHotNews_C
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  PubLevel;
@synthesize  PageSize;
@synthesize  PageIndex;

+(JZgetHotNews_C*)Jz_initialize{
    JZgetHotNews_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getHotNews_C]];
    
}


-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PubLevel:(NSString *)_PubLevel PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex{
    //    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPubLevel:_PubLevel];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
}


@end
