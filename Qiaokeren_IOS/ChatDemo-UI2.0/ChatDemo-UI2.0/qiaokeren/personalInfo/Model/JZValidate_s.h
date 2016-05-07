//
//  JZValidate_s.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZValidate_s : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* sendId;
    NSString* sendPhone;
    NSString* sendCode;
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* sendId;
@property(nonatomic, copy) NSString* sendPhone;
@property(nonatomic, copy) NSString* sendCode;


+(JZValidate_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
             sendId:(NSString*)_sendId
          sendPhone:(NSString*)_sendPhone
           sendCode:(NSString*)_sendCode;









@end