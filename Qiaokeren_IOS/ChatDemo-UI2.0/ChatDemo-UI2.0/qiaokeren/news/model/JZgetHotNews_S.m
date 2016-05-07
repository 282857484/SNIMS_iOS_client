//
//  JZgetHotNews_S.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-15.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZgetHotNews_S.h"
#import "JZ_agreement_s.h"
@implementation JZgetHotNews_S
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;
@synthesize  Mark;
@synthesize  Content;
@synthesize  HotNewsList;


+(JZgetHotNews_S*)Jz_initialize{
    JZgetHotNews_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getHotNews_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex Mark:(NSString *)_Mark Content:(NSString *)_Content HotNewsList:(NSString *)_HotNewsList{
    
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setHotNewsList:_HotNewsList];
    
}
@end
