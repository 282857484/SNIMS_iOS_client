//
//  JZgetDownLevel_s.m
//  Text01
//
//  Created by apple on 15-1-27.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetDownLevel_s.h"
#import "JZ_agreement_s.h"
@implementation JZgetDownLevel_s

@synthesize  p;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize  RealLevelDeep;
@synthesize  UserNum;
@synthesize  UseridList;
@synthesize  Mark;
@synthesize  Content;
+(JZgetDownLevel_s*)Jz_initialize{
    JZgetDownLevel_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getDownLevel_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime RealLevelDeep:(NSString *)_RealLevelDeep UserNum:(NSString *)_UserNum UseridList:(NSString *)_UseridList Mark:(NSString *)_Mark Content:(NSString *)_Content{

    NSLog(@"%@",saysomething);
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setRealLevelDeep:_RealLevelDeep];
    [self setUserNum:_UserNum];
    [self setUseridList:_UseridList];
    [self setMark:_Mark];
    [self setContent:_Content];


}
@end
