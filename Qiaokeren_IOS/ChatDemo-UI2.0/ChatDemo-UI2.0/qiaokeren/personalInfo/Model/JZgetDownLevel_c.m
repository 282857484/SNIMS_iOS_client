//
//  JZgetDownLevel_c.m
//  Text01
//
//  Created by apple on 15-1-26.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetDownLevel_c.h"
#import "JZ_agreement_c.h"
@implementation JZgetDownLevel_c

@synthesize  p;
@synthesize  Userid;
@synthesize  LevelDeep;
@synthesize  RecognisizeNum;
@synthesize  UserLevel;
@synthesize  UploadTime;
+(JZgetDownLevel_c*)Jz_initialize{
    JZgetDownLevel_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getDownLevel_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Userid:(NSString *)_Userid LevelDeep:(NSString *)_LevelDeep RecognisizeNum:(NSString *)_RecognisizeNum UserLevel:(NSString *)_UserLevel UploadTime:(NSString *)_UploadTime{
    NSLog(@"%@",saysomething);
    [self setUserid:_Userid];
    [self setLevelDeep:_LevelDeep];
    [self setRecognisizeNum:_RecognisizeNum];
    [self setUserLevel:_UserLevel];
    [self setUploadTime:_UploadTime];

}

@end
