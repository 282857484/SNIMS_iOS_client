//
//  JZaccept_s.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZaccept_s.h"
#import "JZ_agreement_s.h"
@implementation JZaccept_s
@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize Mark;
@synthesize  Content;
@synthesize Billstatus;

+(JZaccept_s*)Jz_initialize{
    JZaccept_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  accept_S]];
}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime Mark:(NSString *)_Mark Content:(NSString *)_Content Billstatus:(NSString *)_Billstatus{
    NSLog(@"%@",saysomething);
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setMark:_Mark];
    [self setContent:_Content];
    [self setBillid:_Billstatus];


}

-(NSDictionary*)getValueInDictionary{
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys:p,@"p", nil];
    return dictionary;

}

@end
