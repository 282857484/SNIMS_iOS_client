//
//  AuthorizeSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface AuthorizeSelectData : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* authorizeid;
    NSString* userid;
    NSString* authorize;
    NSString* authorizeinfo;
    NSString* authorizelevel;
    NSString* authorizetime;
    NSString* authorizeres;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* authorizeid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* authorize;
@property(nonatomic, copy) NSString* authorizeinfo;
@property(nonatomic, copy) NSString* authorizelevel;
@property(nonatomic, copy) NSString* authorizetime;
@property(nonatomic, copy) NSString* authorizeres;
+(AuthorizeSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
        authorizeid:(NSString*)_authorizeid
             userid:(NSString*)_userid
             authorize:(NSString*)_authorize
             authorizeinfo:(NSString*)_authorizeinfo
             authorizelevel:(NSString*)_authorizelevel
             authorizetime:(NSString*)_authorizetime
       authorizeres:(NSString*)_authorizeres;

@end
