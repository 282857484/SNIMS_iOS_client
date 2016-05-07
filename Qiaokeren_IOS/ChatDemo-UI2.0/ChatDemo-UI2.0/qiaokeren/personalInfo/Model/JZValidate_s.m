//
//  JZValidate_s.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZValidate_s.h"

@implementation JZValidate_s
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  sendId;
@synthesize  sendPhone;
@synthesize  sendCode;




+(JZValidate_s*)Jz_initialize{
    JZValidate_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    //    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:@"515"];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime sendId:(NSString *)_sendId sendPhone:(NSString *)_sendPhone sendCode:(NSString *)_sendCode{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setSendId:_sendId];
    [self setSendPhone:_sendPhone];
    [self setSendCode:_sendCode];
    
    
}
@end

