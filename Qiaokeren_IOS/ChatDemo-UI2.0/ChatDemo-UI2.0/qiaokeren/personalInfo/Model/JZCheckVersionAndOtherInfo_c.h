//
//  JZCheckVersionAndOtherInfo_c.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZCheckVersionAndOtherInfo_c : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* Version;
    NSString* MacAddress;
    NSString* UUID;
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Version;
@property(nonatomic, copy) NSString* MacAddress;
@property(nonatomic, copy) NSString* UUID;


+(JZCheckVersionAndOtherInfo_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            Version:(NSString*)_Version
         MacAddress:(NSString*)_MacAddress
               UUID:(NSString*)_UUID;









@end