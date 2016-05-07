//
//  JZCheckVersionAndOtherInfo_c.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZCheckVersionAndOtherInfo_c.h"

@implementation JZCheckVersionAndOtherInfo_c
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  Version;
@synthesize  MacAddress;
@synthesize  UUID;




+(JZCheckVersionAndOtherInfo_c*)Jz_initialize{
    JZCheckVersionAndOtherInfo_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    //    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:@"401"];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime Version:(NSString *)_Version MacAddress:(NSString *)_MacAddress UUID:(NSString *)_UUID{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setVersion:_Version ];
    [self setMacAddress:_MacAddress];
    [self setUUID:_UUID];






}
@end
