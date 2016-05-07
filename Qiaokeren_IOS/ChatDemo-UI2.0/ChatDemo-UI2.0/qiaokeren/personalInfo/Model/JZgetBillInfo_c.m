//
//  JZgetBillInfo_c.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetBillInfo_c.h"
#import "JZ_agreement_c.h"
@implementation JZgetBillInfo_c

@synthesize p;
@synthesize  UserID;
@synthesize UploadTime;
@synthesize  BillID;
@synthesize SearchUserID;
@synthesize SearchUpUserID;
@synthesize PageSize;
@synthesize PageIndex;

+(JZgetBillInfo_c*)Jz_initialize{
    JZgetBillInfo_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getBillInfo_C]];
}

-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime BillID:(NSString *)_BillID SearchUserID:(NSString *)_SearchUserID SearchUpUserID:(NSString *)_SearchUpUserID PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex{
     NSLog(@"%@",saysomething);
    [self setUserID:_UserID ];
    [self setUploadTime:_UploadTime];
    [self setBillID:_BillID];
    [self setSearchUserID:_SearchUserID];
    [self setSearchUpUserID:_SearchUpUserID];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];

}
@end
