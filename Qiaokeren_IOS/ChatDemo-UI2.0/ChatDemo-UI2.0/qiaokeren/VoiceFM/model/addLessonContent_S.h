//
//  addLessonContent_S.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface addLessonContent_S : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * Mark ;
    NSString * Content ;
    NSString * classcontentid ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * Mark;
@property(nonatomic, copy) NSString * Content;
@property(nonatomic, copy) NSString * classcontentid;

+(id)instance2;
-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
     classcontentid:(NSString*)_classcontentid
;

@end
