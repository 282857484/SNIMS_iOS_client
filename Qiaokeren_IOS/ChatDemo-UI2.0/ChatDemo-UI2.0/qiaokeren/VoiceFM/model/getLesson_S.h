//
//  getLesson_S.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface getLesson_S : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * Mark ;
    NSString * PageSize ;
    NSString * PageIndex ;
    NSString * LessonInfoSelectDataList ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * Mark;
@property(nonatomic, copy) NSString * PageSize;
@property(nonatomic, copy) NSString * PageIndex;
@property(nonatomic, copy) NSString * LessonInfoSelectDataList;

+(id)instance2;
-(void)initWithInfo:(NSString*)_saysomething
                  p:(NSString*)_p
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
LessonInfoSelectDataList:(NSString*)_LessonInfoSelectDataList
;

@end