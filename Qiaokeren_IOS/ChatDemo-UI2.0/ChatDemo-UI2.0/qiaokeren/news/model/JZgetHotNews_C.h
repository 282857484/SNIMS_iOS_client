//
//  JZgetHotNews_C.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-15.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetHotNews_C : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* PubLevel;
    NSString* PageSize;
    NSString* PageIndex;
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* PubLevel;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;
+(JZgetHotNews_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PubLevel:(NSString*)_PubLevel
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex;
@end
