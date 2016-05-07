//
//  JZChat_c.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-23.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZChat_c : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Chatid;
    NSString* Userid;
    NSString* Toid;
    NSString* Chatcontent;
    NSString* UploadTime;
    NSString* Chattype;
    NSString* Resourceindex;
    NSString* ChatMark;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Chatid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* Toid;
@property(nonatomic, copy) NSString* Chatcontent;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Chattype;
@property(nonatomic, copy) NSString* Resourceindex;
@property(nonatomic, copy) NSString* ChatMark;
+(JZChat_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Chatid:(NSString*)_Chatid
             Userid:(NSString*)_Userid
               Toid:(NSString*)_Toid
        Chatcontent:(NSString*)_Chatcontent
         UploadTime:(NSString*)_UploadTime
           Chattype:(NSString*)_Chattype
      Resourceindex:(NSString*)_Resourceindex
           ChatMark:(NSString*)_ChatMark;




@end
