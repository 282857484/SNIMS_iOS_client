//
//  JZgetVedioList_s.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetVedioList_s.h"
#import "JZ_agreement_s.h"
@implementation JZgetVedioList_s
@synthesize  p;
@synthesize  UserID;
@synthesize  UserLevel;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;
@synthesize  VedioList;
@synthesize  Mark;
@synthesize  Content;


+(JZgetVedioList_s*)Jz_initialize{
    JZgetVedioList_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getVedio]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UserLevel:(NSString *)_UserLevel UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex VedioList:(NSString *)_VedioList Mark:(NSString *)_Mark Content:(NSString *)_Content{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUserLevel:_UserLevel];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setVedioList:_VedioList];
    [self setMark:_Mark];
    [self setContent:_Content];




}
@end
