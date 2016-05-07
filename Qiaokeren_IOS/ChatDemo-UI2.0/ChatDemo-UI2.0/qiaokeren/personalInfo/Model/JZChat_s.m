//
//  JZChat_s.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZChat_s.h"
#import "JZ_agreement_s.h"
@implementation JZChat_s
@synthesize p;
@synthesize  Chatid;
@synthesize Userid;
@synthesize  UploadTime;
@synthesize Mark;
@synthesize Content;
+(JZChat_s*)Jz_initialize{
    JZChat_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  Chat_S]];
}

-(void)initWithInfo:(NSString *)saysomething Chatid:(NSString *)_Chatid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime Mark:(NSString *)_Mark Content:(NSString *)_Content{
    NSLog(@"%@",saysomething);
    [self setChatid:_Chatid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setMark:_Mark];
    [self setContent:_Content];


}

@end
