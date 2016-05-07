//
//  JZChat_s.h
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZChat_s : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Chatid;
    NSString* Userid;
    NSString* UploadTime;
    NSString* Mark;
    NSString* Content;


}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Chatid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;

+(JZChat_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Chatid:(NSString*)_Chatid
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content;


@end
