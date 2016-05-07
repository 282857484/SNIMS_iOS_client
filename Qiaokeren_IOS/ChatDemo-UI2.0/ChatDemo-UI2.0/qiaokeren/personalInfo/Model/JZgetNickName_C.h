//
//  JZgetNickName_C.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/3/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetNickName_C : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* NickNumber;
    NSString* NickList;
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* NickNumber;
@property(nonatomic, copy) NSString* NickList;

+(JZgetNickName_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           NickNumber:(NSString*)_NickNumber
          NickList:(NSString*)_NickList;
@end
