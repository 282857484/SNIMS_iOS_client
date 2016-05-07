//
//  JZChangeUserInfo_s.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZChangeUserInfo_s.h"
#import "JZ_agreement_s.h"
@implementation JZChangeUserInfo_s

@synthesize p;
@synthesize  UserID;
@synthesize UploadTime;
@synthesize  Mark;
@synthesize Content;


+(JZChangeUserInfo_s*)Jz_initialize{
    JZChangeUserInfo_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  ChangeUserInfo_S]];
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime Mark:(NSString *)_Mark Content:(NSString *)_Content{
           NSLog(@"%@",saysomething);
    [self setUserID:saysomething];
    [self setUploadTime:_UploadTime];
    [self setUserID:_UserID];
    [self setMark:_Mark];
    [self setContent:_Content];
    

}
@end
