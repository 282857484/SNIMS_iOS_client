//
//  JZgetFriendsCircle_S.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-31.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZgetFriendsCircle_S.h"
#import "JZ_agreement_s.h"
@implementation JZgetFriendsCircle_S

@synthesize p;
@synthesize  UserID;
@synthesize UploadTime;
@synthesize  PageSize;
@synthesize PageIndex;
@synthesize Mark;
@synthesize Content;
@synthesize FriendsCircleList;

+(JZgetFriendsCircle_S*)Jz_initialize{
    JZgetFriendsCircle_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getFriendsCircle_S]];
}

-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex Mark:(NSString *)_Mark Content:(NSString *)_Content FriendsCircleList:(NSString*)_FriendsCircleList{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPageIndex:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setFriendsCircleList:_FriendsCircleList];
    
}
@end

