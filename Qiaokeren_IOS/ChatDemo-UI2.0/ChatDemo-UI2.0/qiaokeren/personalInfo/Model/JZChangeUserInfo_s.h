//
//  JZChangeUserInfo_s.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZChangeUserInfo_s : JZGetValueInDictionary{
 @private
    NSString* p ;
    NSString* UserID ;
    NSString* UploadTime ;
    NSString* Mark ;
    NSString* Content ;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
+(JZChangeUserInfo_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content;



@end
