//
//  HotNews.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-15.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface HotNews : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* hotid;
    NSString* type;
    NSString* imageurl;
    NSString* linkurl;
    NSString* ishot;
    NSString* ismust;
    NSString* publevel;
    NSString* author;
    NSString* uploadtime;
    NSString* time;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* hotid;
@property(nonatomic, copy) NSString* type;
@property(nonatomic, copy) NSString* imageurl;
@property(nonatomic, copy) NSString* linkurl;
@property(nonatomic, copy) NSString* ishot;
@property(nonatomic, copy) NSString* ismust;
@property(nonatomic, copy) NSString* publevel;
@property(nonatomic, copy) NSString* author;
@property(nonatomic, copy) NSString* uploadtime;
@property(nonatomic, copy) NSString* time;
+(HotNews*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             hotid:(NSString*)_hotid
            type:(NSString*)_type
             imageurl:(NSString*)_imageurl
     linkurl:(NSString*)_linkurl
          ishot:(NSString*)_ishot
         ismust:(NSString*)_ismust
        publevel:(NSString*)_publevel
        author:(NSString*)_author
           uploadtime:(NSString*)_uploadtime
        time:(NSString*)_time;

@end
