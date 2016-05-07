//
//  AuthorizeSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "AuthorizeSelectData.h"
#import "JZ_tag.h"
@implementation AuthorizeSelectData

@synthesize  p;
@synthesize  authorizeid;
@synthesize  userid;
@synthesize  authorize;
@synthesize  authorizeinfo;
@synthesize  authorizelevel;
@synthesize  authorizetime;
@synthesize  authorizeres;
+(AuthorizeSelectData*)Jz_initialize{
    AuthorizeSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  AuthorizeSelectData]];
    
}
-(void)initWithInfo:(NSString *)saysomething authorizeid:(NSString *)_authorizeid userid:(NSString *)_userid authorize:(NSString *)_authorize authorizeinfo:(NSString *)_authorizeinfo authorizelevel:(NSString *)_authorizelevel authorizetime:(NSString *)_authorizetime authorizeres:(NSString *)_authorizeres{
    [self setAuthorizeid:_authorizeid];
    [self setUserid:_userid];
    [self setAuthorize:_authorize];
    [self setAuthorizeinfo:_authorizeinfo];
    [self setAuthorizelevel:_authorizelevel];
    [self setAuthorizetime:_authorizetime];
    [self setAuthorizeres:_authorizeres];
}
@end
