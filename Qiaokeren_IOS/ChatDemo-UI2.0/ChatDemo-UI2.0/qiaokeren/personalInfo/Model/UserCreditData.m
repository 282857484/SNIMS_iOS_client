//
//  UserCreditData.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "UserCreditData.h"
#import "JZ_tag.h"
@implementation UserCreditData

@synthesize p;
@synthesize creditid;
@synthesize userid;
@synthesize timestamp;
@synthesize userlevel;
@synthesize monthcredit;
@synthesize quartercredit;
@synthesize yearcredit;
@synthesize time;


+(UserCreditData*)Jz_initialize
{
    UserCreditData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue
{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  UserCreditData]];
    
}

-(void)initWithInfo:(NSString*)_saysomething
           creditid:(NSString*)_creditid
             userid:(NSString*)_userid
          timestamp:(NSString*)_timestamp
          userlevel:(NSString*)_userlevel
        monthcredit:(NSString*)_monthcredit
      quartercredit:(NSString*)_quartercredit
         yearcredit:(NSString*)_yearcredit
               time:(NSString*)_time
{
    NSLog(@"%@",_saysomething);
   
        [self setCreditid:_creditid];
        [self setUserid:_userid];
        [self setTimestamp:_timestamp];
        [self setUserlevel:_userlevel];
        [self setMonthcredit:_monthcredit];
        [self setQuartercredit:_quartercredit];
        [self setYearcredit:_yearcredit];
        [self setTime:_time];
    
}

@end
