//
//  addLessonContent_C.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#import "JZGetValueInDictionary.h"

@interface addLessonContent_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * classid ;
    NSString * userid ;
    NSString * timestamp ;
    NSString * username ;
    NSString * place ;
    NSString * contentclass ;
    NSString * content ;
    NSString * url ;
    NSString * tip ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * classid;
@property(nonatomic, copy) NSString * userid;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * username;
@property(nonatomic, copy) NSString * place;
@property(nonatomic, copy) NSString * contentclass;
@property(nonatomic, copy) NSString * content;
@property(nonatomic, copy) NSString * url;
@property(nonatomic, copy) NSString * tip;

+(id)instance2;
-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            classid:(NSString*)_classid
             userid:(NSString*)_userid
          timestamp:(NSString*)_timestamp
           username:(NSString*)_username
              place:(NSString*)_place
       contentclass:(NSString*)_contentclass
            content:(NSString*)_content
                url:(NSString*)_url
                tip:(NSString*)_tip
;

@end