//
//  HotNews.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-15.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "HotNews.h"
#import "JZ_tag.h"
@implementation HotNews
@synthesize p;
@synthesize hotid;
@synthesize type;
@synthesize imageurl;
@synthesize linkurl;
@synthesize ishot;
@synthesize ismust;
@synthesize publevel;
@synthesize author;
@synthesize uploadtime;
@synthesize time;
+(HotNews*)Jz_initialize{
    HotNews* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  HotNews]];
    
}
-(void)initWithInfo:(NSString *)saysomething hotid:(NSString *)_hotid type:(NSString *)_type imageurl:(NSString *)_imageurl linkurl:(NSString *)_linkurl ishot:(NSString *)_ishot ismust:(NSString *)_ismust publevel:(NSString *)_publevel author:(NSString *)_author uploadtime:(NSString *)_uploadtime time:(NSString *)_time
{
    [self setHotid:_hotid];
    [self setType:_type];
    [self setImageurl:_imageurl];
    [self setLinkurl:_linkurl];
    [self setIshot:_ishot];
    [self setIsmust:_ismust];
    [self setPublevel:_publevel];
    [self setAuthor:_author];
    [self setUploadtime:_uploadtime];
    [self setTime:_time];
}

@end
