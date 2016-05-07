//
//  JZChat_c.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-23.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZChat_c.h"
#import "JZ_agreement_c.h"
@implementation JZChat_c

@synthesize p;
@synthesize Chatid;
@synthesize Userid;
@synthesize Toid;
@synthesize Chatcontent;
@synthesize UploadTime;
@synthesize Chattype;
@synthesize Resourceindex;
@synthesize ChatMark;
+(JZChat_c*)Jz_initialize{
    JZChat_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  Chat_C]];
}
-(void)initWithInfo:(NSString *)saysomething Chatid:(NSString *)_Chatid Userid:(NSString *)_Userid Toid:(NSString *)_Toid Chatcontent:(NSString *)_Chatcontent UploadTime:(NSString *)_UploadTime Chattype:(NSString *)_Chattype Resourceindex:(NSString *)_Resourceindex ChatMark:(NSString*)_ChatMark{
//        NSLog(@"%@",saysomething);
    [self setChatid:_Chatid];
    [self setUserid:_Userid];
    [self setToid:_Toid];
    [self setChatcontent:_Chatcontent];
    [self setUploadTime:_UploadTime];
    [self setChattype:_Chattype];
    [self setResourceindex:_Resourceindex];
    [self setChatMark:_ChatMark];
    


}
@end
