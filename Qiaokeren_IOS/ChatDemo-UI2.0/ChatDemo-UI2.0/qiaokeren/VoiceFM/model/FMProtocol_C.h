//
//  FMProtocol_C.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface FMProtocol_C : JZGetValueInDictionary
{
    @private
    NSString * addLesson_C;
    NSString * changeLesson_C;
    NSString * getLesson_C;
    
    NSString * addLessonContent_C;
    NSString * getLessonContent_C;
    
    
    NSString * addLesson_S;
    NSString * changeLesson_S;
    NSString * getLesson_S;
    
    NSString * addLessonContent_S;
    NSString * getLessonContent_S;
    
}
@property(nonatomic,copy)NSString * addLesson_C;
@property(nonatomic,copy)NSString * changeLesson_C;
@property(nonatomic,copy)NSString * getLesson_C;
@property(nonatomic,copy)NSString * addLessonContent_C;
@property(nonatomic,copy)NSString * getLessonContent_C;


@property(nonatomic,copy)NSString * addLesson_S;
@property(nonatomic,copy)NSString * changeLesson_S;
@property(nonatomic,copy)NSString * getLesson_S;
@property(nonatomic,copy)NSString * addLessonContent_S;
@property(nonatomic,copy)NSString * getLessonContent_S;
+(instancetype) initTheProtocol;
//@property(nonatomic,copy)
//NSString * addLesson_C = 410;
//NSString * changeLesson_C = 411;
//NSString * getLesson_C = 412;
//
//NSString * addLessonContent_C = 414;
//NSString * getLessonContent_C = 415;
//
//
//NSString * addLesson_S = 910;
//NSString * changeLesson_S = 911;
//NSString * getLesson_S = 912;
//
//NSString * addLessonContent_S= 914;
//NSString * getLessonContent_S=915;

@end
