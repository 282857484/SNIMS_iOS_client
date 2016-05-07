//
//  JZgetQUserInfo_c.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetQUserInfo_c.h"
#import "JZ_agreement_c.h"
@implementation JZgetQUserInfo_c
@synthesize  p;
@synthesize  UserID;
@synthesize  ThisUserID;
@synthesize  UpUserID;
@synthesize  Phone;
@synthesize  WeChatID;
@synthesize  Level;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;



+(JZgetQUserInfo_c*)Jz_initialize{
    JZgetQUserInfo_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getUserInfo_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID ThisUserID:(NSString *)_ThisUserID UpUserID:(NSString *)_UpUserID Phone:(NSString *)_Phone WeChatID:(NSString *)_WeChatID Level:(NSString *)_Level UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setThisUserID:_ThisUserID];
    [self setUpUserID:_UpUserID];
    [self setPhone:_Phone];
    [self setWeChatID:_WeChatID];
    [self setLevel:_Level];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];




}
@end
