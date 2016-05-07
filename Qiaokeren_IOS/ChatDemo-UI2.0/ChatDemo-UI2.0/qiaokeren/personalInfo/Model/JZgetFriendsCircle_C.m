//
//  JZgetFriendsCircle_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-31.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZgetFriendsCircle_C.h"
#import "JZ_agreement_c.h"
@implementation JZgetFriendsCircle_C

@synthesize p;
@synthesize  UserID;
@synthesize UploadTime;
@synthesize PageSize;
@synthesize PageIndex;

+(JZgetFriendsCircle_C*)Jz_initialize{
    JZgetFriendsCircle_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getFriendsCircle_C]];
}

-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID ];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
    
}
@end
