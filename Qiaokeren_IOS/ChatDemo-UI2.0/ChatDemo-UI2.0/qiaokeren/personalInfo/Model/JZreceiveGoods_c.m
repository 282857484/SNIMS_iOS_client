//
//  JZreceiveGoods_c.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZreceiveGoods_c.h"
#import "JZ_agreement_c.h"
@implementation JZreceiveGoods_c
@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;



+(JZreceiveGoods_c*)Jz_initialize{
    JZreceiveGoods_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  receiveGoods_C]];
    
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime{
    NSLog(@"%@",saysomething);
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];


}
@end
