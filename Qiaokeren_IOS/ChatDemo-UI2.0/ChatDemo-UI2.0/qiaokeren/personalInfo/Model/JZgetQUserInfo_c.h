//
//  JZgetQUserInfo_c.h
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetQUserInfo_c : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* ThisUserID;
    NSString* UpUserID;
    NSString* Phone;
    NSString* WeChatID;
    NSString* Level;
    NSString* UploadTime;
    NSString* PageSize;
    NSString* PageIndex;
    

    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* ThisUserID;
@property(nonatomic, copy) NSString* UpUserID;
@property(nonatomic, copy) NSString* Phone;
@property(nonatomic, copy) NSString* WeChatID;
@property(nonatomic, copy) NSString* Level;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;


+(JZgetQUserInfo_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         ThisUserID:(NSString*)_ThisUserID
           UpUserID:(NSString*)_UpUserID
              Phone:(NSString*)_Phone
           WeChatID:(NSString*)_WeChatID
              Level:(NSString*)_Level
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex;







@end
