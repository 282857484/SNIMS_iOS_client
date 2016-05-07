//
//  OneChat.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface OneChat : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* chatid;
    NSString* userid;
    NSString* touserid;
    NSString* chatcontent;
    NSString* timestamp;
    NSString* chattype;
    NSString* resourceindex;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* chatid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* touserid;
@property(nonatomic, copy) NSString* chatcontent;
@property(nonatomic, copy) NSString* timestamp;
@property(nonatomic, copy) NSString* chattype;
@property(nonatomic, copy) NSString* resourceindex;
+(OneChat*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
        chatid:(NSString*)_chatid
             userid:(NSString*)_userid
          touserid:(NSString*)_touserid
      chatcontent:(NSString*)_chatcontent
     timestamp:(NSString*)_timestamp
      chattype:(NSString*)_chattype
       resourceindex:(NSString*)_resourceindex;

@end