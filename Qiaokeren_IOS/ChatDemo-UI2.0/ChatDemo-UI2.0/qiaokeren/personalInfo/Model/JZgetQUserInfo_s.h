//
//  JZgetQUserInfo_s.h
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetQUserInfo_s : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* PageSize;
    NSString* PageIndex;
    NSString* Mark;
    NSString* Content;
    NSString* UserSelectDataList;
    
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* UserSelectDataList;

+(JZgetQUserInfo_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
 UserSelectDataList:(NSString*)_UserSelectDataList;







@end