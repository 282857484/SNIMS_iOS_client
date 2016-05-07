//
//  JZCheckVersionAndOtherInfo_s.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZCheckVersionAndOtherInfo_s : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* Version;
    NSString* URL;
    NSString* Text;
    NSString* UpdateTime;

    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Version;
@property(nonatomic, copy) NSString* URL;
@property(nonatomic, copy) NSString* Text;
@property(nonatomic, copy) NSString* UpdateTime;



+(JZCheckVersionAndOtherInfo_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            Version:(NSString*)_Version
                URL:(NSString*)_URL
               Text:(NSString*)_Text
         UpdateTime:(NSString*)_UpdateTime;










@end