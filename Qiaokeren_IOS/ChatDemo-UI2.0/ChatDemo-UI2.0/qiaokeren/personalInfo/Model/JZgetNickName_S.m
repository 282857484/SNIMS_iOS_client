//
//  JZgetNickName_S.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/3/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZgetNickName_S.h"
#import "JZ_agreement_s.h"
@implementation JZgetNickName_S
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  Mark;
@synthesize  Content;
@synthesize  NickNumber;
@synthesize  ANPairList;


+(JZgetNickName_S*)Jz_initialize{
    JZgetNickName_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getNickName_S]];
    
}
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
         NickNumber:(NSString*)_NickNumber
         ANPairList:(NSString*)_ANPairList{
//    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setNickNumber:_NickNumber];
    [self setANPairList:_ANPairList];
    
    
}
@end
