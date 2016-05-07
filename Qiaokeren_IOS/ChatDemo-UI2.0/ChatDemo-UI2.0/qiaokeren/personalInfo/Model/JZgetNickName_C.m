//
//  JZgetNickName_C.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/3/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZgetNickName_C.h"
#import "JZ_agreement_c.h"
@implementation JZgetNickName_C
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  NickNumber;
@synthesize  NickList;


+(JZgetNickName_C*)Jz_initialize{
    JZgetNickName_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getNickName_C]];
    
}


-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
         NickNumber:(NSString*)_NickNumber
           NickList:(NSString*)_NickList{
//    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setNickNumber:_NickNumber];
    [self setNickNumber:_NickNumber];
    [self setNickList:_NickList];
}


@end
