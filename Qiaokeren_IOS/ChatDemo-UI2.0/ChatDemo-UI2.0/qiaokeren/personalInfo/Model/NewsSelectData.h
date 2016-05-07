//
//  NewsSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface NewsSelectData : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* newsid;
    NSString* userid;
    NSString* pubnickname;
    NSString* publevel;
    NSString* pubnewsname;
    NSString* publogores;
    NSString* pubcontentsummary;
    NSString* publinkres;
    NSString* uploadtime;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* newsid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* pubnickname;
@property(nonatomic, copy) NSString* publevel;
@property(nonatomic, copy) NSString* pubnewsname;
@property(nonatomic, copy) NSString* publogores;
@property(nonatomic, copy) NSString* pubcontentsummary;
@property(nonatomic, copy) NSString* publinkres;
@property(nonatomic, copy) NSString* uploadtime;
+(NewsSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
        newsid:(NSString*)_newsid
             userid:(NSString*)_userid
          pubnickname:(NSString*)_pubnickname
      publevel:(NSString*)_publevel
     pubnewsname:(NSString*)_pubnewsname
      publogores:(NSString*)_publogores
      pubcontentsummary:(NSString*)_pubcontentsummary
      publinkres:(NSString*)_publinkres
       uploadtime:(NSString*)_uploadtime;

@end
