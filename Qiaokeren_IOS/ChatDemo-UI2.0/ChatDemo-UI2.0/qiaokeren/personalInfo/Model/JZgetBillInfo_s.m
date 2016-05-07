//
//  JZgetBillInfo_s.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetBillInfo_s.h"
#import "JZ_agreement_s.h"
@implementation JZgetBillInfo_s

@synthesize p;
@synthesize  UserID;
@synthesize UploadTime;
@synthesize  PageSize;
@synthesize PageIndex;
@synthesize Mark;
@synthesize Content;

+(JZgetBillInfo_s*)Jz_initialize{
    JZgetBillInfo_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getBillInfo_S]];
}

-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex Mark:(NSString *)_Mark Content:(NSString *)_Content{
      NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPageIndex:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setMark:_Mark];
    [self setContent:_Content];
    

}
@end
