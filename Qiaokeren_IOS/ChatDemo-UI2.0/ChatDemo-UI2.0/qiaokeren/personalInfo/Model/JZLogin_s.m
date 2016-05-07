//
//  JZLogin_s.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZLogin_s.h"
#import "JZ_agreement_s.h"
@implementation JZLogin_s
@synthesize  p;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize  Mark;
@synthesize  Content;
@synthesize  UserSelectDataToJSON;



+(JZLogin_s*)Jz_initialize{
    JZLogin_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  login_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime Mark:(NSString *)_Mark Content:(NSString *)_Content UserSelectDataToJSON:(NSString *)_UserSelectDataToJSON{
    NSLog(@"%@",saysomething);
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setUserSelectDataToJSON:_UserSelectDataToJSON];





}
@end
