//
//  JZRegister_S.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZRegister_S : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* UserID;
    NSString* Mark;
    NSString* Content;
    NSString* UploadTime;
    NSString* RandomInvite;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* RandomInvite;
+(JZRegister_S*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
             Mark:(NSString*)_Mark
      Content:(NSString*)_Content
         UploadTime:(NSString*)_UploadTime
         RandomInvite:(NSString*)_RandomInvite;

@end