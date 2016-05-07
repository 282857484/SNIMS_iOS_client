//
//  JZCheckVersionAndOtherInfo_s.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-30.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZCheckVersionAndOtherInfo_s.h"

@implementation JZCheckVersionAndOtherInfo_s
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  Version;
@synthesize  URL;
@synthesize  Text;
@synthesize  UpdateTime;




+(JZCheckVersionAndOtherInfo_s*)Jz_initialize{
    JZCheckVersionAndOtherInfo_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    //    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:@"901"];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime Version:(NSString *)_Version URL:(NSString *)_URL Text:(NSString *)_Text UpdateTime:(NSString *)_UpdateTime{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setVersion:_Version];
    [self setURL:_URL];
    [self setText:_Text];
    [self setUpdateTime:_UpdateTime];


}
@end
