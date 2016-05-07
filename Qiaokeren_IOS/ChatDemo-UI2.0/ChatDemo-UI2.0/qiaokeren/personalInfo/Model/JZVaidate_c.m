//
//  JZVaidate_c.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZVaidate_c.h"

@implementation JZVaidate_c

@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  sendId;
@synthesize  sendPhone;
@synthesize  sendCode;
@synthesize  sendMark;



+(JZVaidate_c*)Jz_initialize{
    JZVaidate_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
//    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:@"15"];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime sendId:(NSString *)_sendId sendPhone:(NSString *)_sendPhone sendCode:(NSString *)_sendCode sendMark:(NSString*)_sendMark{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setSendId:_sendId];
    [self setSendPhone:_sendPhone];
    [self setSendCode:_sendCode];
    [self setSendMark:_sendMark];


}
@end
