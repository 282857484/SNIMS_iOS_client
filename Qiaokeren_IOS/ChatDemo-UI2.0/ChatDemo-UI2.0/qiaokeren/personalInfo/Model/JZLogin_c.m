//
//  JZLogin_c.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZLogin_c.h"
#import "JZ_agreement_c.h"
@implementation JZLogin_c
@synthesize  p;
@synthesize  Userid;
@synthesize  Phone;
@synthesize  Email;
@synthesize  Code;
@synthesize  UploadTime;



+(JZLogin_c*)Jz_initialize{
    JZLogin_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  login_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Userid:(NSString *)_Userid Phone:(NSString *)_Phone Email:(NSString *)_Email Code:(NSString *)_Code UploadTime:(NSString *)_UploadTime{
    NSLog(@"%@",saysomething);
    [self setUserid:_Userid];
    [self setPhone:_Phone];
    [self setEmail:_Email];
    [self setCode:_Code];
    [self setUploadTime:_UploadTime];
    
    



}
@end
