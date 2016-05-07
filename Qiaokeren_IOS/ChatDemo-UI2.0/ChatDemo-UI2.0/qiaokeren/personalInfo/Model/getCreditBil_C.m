//
//  getCreditBil_C.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "getCreditBil_C.h"
#import "JZ_agreement_c.h"

@implementation getCreditBil_C

@synthesize p;
@synthesize UserID;
@synthesize UploadTime;
@synthesize supOrsub;
@synthesize PageSize;
@synthesize PageIndex;

+(getCreditBil_C*)Jz_initialize
{
    getCreditBil_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getCreditBil_C]];
    
}


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           supOrsub:(NSString*)_supOrsub
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
{
    NSLog(@"%@",_saysomething);
   
        [self setUserID:_UserID];
        [self setUploadTime:_UploadTime];
        [self setSupOrsub:_supOrsub];
        [self setPageSize:_PageSize];
        [self setPageIndex:_PageIndex];
   }

@end
