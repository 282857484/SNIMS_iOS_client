//
//  getCreditBil_S.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "getCreditBil_S.h"
#import "JZ_agreement_s.h"
@implementation getCreditBil_S

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize PageSize;
@synthesize PageIndex;
@synthesize Mark;
@synthesize Content;
@synthesize BillSelectDataList;

+(getCreditBil_S*)Jz_initialize
{
    getCreditBil_S* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getCreditBil_S]];
    
}




-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
	BillSelectDataList:(NSString*)_BillSelectDataList
{
    NSLog(@"%@",_saysomething);
    
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];
        [self setMark:_Mark];
        [self setContent:_Content];
        [self setBillSelectDataList:_BillSelectDataList];
    
}

@end
