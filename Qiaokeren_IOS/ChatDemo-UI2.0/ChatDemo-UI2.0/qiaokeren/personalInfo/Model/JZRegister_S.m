//
//  JZRegister_S.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZRegister_S.h"
#import "JZ_agreement_s.h"
@implementation JZRegister_S

@synthesize  p;
@synthesize  UserID;
@synthesize  Mark;
@synthesize  Content;
@synthesize  UploadTime;
@synthesize  RandomInvite;
+(JZRegister_S*)Jz_initialize{
    JZRegister_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  jz_register]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID Mark:(NSString *)_Mark Content:(NSString *)_Content UploadTime:(NSString *)_UploadTime RandomInvite:(NSString *)_RandomInvite{
    [self setUserID:_UserID];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setUploadTime:_UploadTime];
    [self setRandomInvite:_RandomInvite];
}
@end