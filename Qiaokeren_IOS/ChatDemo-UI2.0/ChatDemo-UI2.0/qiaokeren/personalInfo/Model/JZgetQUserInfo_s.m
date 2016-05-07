//
//  JZgetQUserInfo_s.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetQUserInfo_s.h"
#import "JZ_agreement_s.h"
@implementation JZgetQUserInfo_s
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;
@synthesize  Mark;
@synthesize  Content;
@synthesize  UserSelectDataList;



+(JZgetQUserInfo_s*)Jz_initialize{
    JZgetQUserInfo_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getUserInfo_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex Mark:(NSString *)_Mark Content:(NSString *)_Content UserSelectDataList:(NSString *)_UserSelectDataList{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setUserSelectDataList:_UserSelectDataList];





}
@end
