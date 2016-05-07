//
//  JZgetInviteNum_c.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetInviteNum_c.h"
#import "JZ_agreement_c.h"
@implementation JZgetInviteNum_c
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;
@synthesize  NewMark;


+(JZgetInviteNum_c*)Jz_initialize{
    JZgetInviteNum_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  getInviteNum]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex NewMark:(NSString *)_NewMark{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime ];
    [self setPageSize:_PageSize];
    [self setPageIndex:_PageIndex];
    [self setNewMark:_NewMark];

}
@end
