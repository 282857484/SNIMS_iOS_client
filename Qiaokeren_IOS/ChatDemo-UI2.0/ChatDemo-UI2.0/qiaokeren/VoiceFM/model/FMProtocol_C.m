//
//  FMProtocol_C.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMProtocol_C.h"

static id FMProtocol = nil;
@implementation FMProtocol_C

@synthesize addLesson_C;
@synthesize changeLesson_C;
@synthesize getLesson_C;

@synthesize addLessonContent_C;
@synthesize getLessonContent_C;


@synthesize addLesson_S;
@synthesize changeLesson_S;
@synthesize getLesson_S;

@synthesize addLessonContent_S;
@synthesize getLessonContent_S;

+(instancetype) initTheProtocol
{
    if (!FMProtocol) {
        FMProtocol = [[FMProtocol_C alloc] init];
        [FMProtocol initValue];
        return FMProtocol;
    }
    return FMProtocol;
}
-(void) initValue
{
    [self setAddLesson_C:@"410"];
    [self setChangeLesson_C:@"411"];
    [self setGetLesson_C:@"412"];
    [self setAddLessonContent_C:@"414"];
    [self setGetLessonContent_C:@"415"];
    
    [self setAddLesson_S:@"910"];
    [self setChangeLesson_S:@"911"];
    [self setGetLesson_S:@"912"];
    [self setAddLessonContent_S:@"914"];
    [self setGetLessonContent_S:@"915"];
}

@end
