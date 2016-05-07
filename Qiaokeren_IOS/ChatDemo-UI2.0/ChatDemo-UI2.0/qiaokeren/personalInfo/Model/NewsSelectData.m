//
//  NewsSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "NewsSelectData.h"
#import "JZ_tag.h"
@implementation NewsSelectData

@synthesize  p;
@synthesize  newsid;
@synthesize  userid;
@synthesize  pubnickname;
@synthesize  publevel;
@synthesize  pubnewsname;
@synthesize  publogores;
@synthesize  pubcontentsummary;
@synthesize  publinkres;
@synthesize  uploadtime;
+(NewsSelectData*)Jz_initialize{
    NewsSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  NewsSelectData]];
    
}
-(void)initWithInfo:(NSString *)saysomething newsid:(NSString *)_newsid userid:(NSString *)_userid pubnickname:(NSString *)_pubnickname publevel:(NSString *)_publevel pubnewsname:(NSString *)_pubnewsname publogores:(NSString *)_publogores pubcontentsummary:(NSString *)_pubcontentsummary publinkres:(NSString *)_publinkres uploadtime:(NSString *)_uploadtime{
    [self setNewsid:_newsid];
    [self setUserid:_userid];
    [self setPubnickname:_pubnickname];
    [self setPublevel:_publevel];
    [self setPubnewsname:_pubnewsname];
    [self setPublogores:_publogores];
    [self setPubcontentsummary:_pubcontentsummary];
    [self setPublinkres:_publinkres];
    [self setUploadtime:_uploadtime];
}

@end
