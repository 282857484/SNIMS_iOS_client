//
//  JZgetVedioList_c.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetVedioList_c.h"
#import "JZ_agreement_c.h"
@implementation JZgetVedioList_c
@synthesize  p;
@synthesize  UserID;
@synthesize  UserLevel;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;



+(JZgetVedioList_c*)Jz_initialize{
    JZgetVedioList_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getVedio]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UserLevel:(NSString *)_UserLevel UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUserLevel:_UserLevel];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];

}
@end
