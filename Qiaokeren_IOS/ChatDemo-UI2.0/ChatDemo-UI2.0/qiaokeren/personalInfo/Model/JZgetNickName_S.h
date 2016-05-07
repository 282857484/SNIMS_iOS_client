//
//  JZgetNickName_S.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/3/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetNickName_S : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* Mark;
    NSString* Content;
    NSString* NickNumber;
    NSString* ANPairList;
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* NickNumber;
@property(nonatomic, copy) NSString* ANPairList;

+(JZgetNickName_S*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
           NickNumber:(NSString*)_NickNumber
           ANPairList:(NSString*)_ANPairList;


@end
