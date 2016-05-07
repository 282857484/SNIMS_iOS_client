//
//  JZChangeUserInfo_c.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZChangeUserInfo_c.h"
#import "JZ_agreement_c.h"
@implementation JZChangeUserInfo_c
@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  qphone;
@synthesize qpassword;
@synthesize  qcardid;
@synthesize qusername;
@synthesize  qrealname;
@synthesize  qtel;
@synthesize  qemail;
@synthesize  qsex;
@synthesize qage;
@synthesize  qshouquannum;
@synthesize qweixin;
@synthesize  qqq;
@synthesize  qwangwang;
@synthesize  qtaobao;
@synthesize  qtaobaourl;
@synthesize qstate;
@synthesize  qlevel;
@synthesize qvideoaccessllevel;
@synthesize  qhonestlevel;
@synthesize qreceivemsg;
+(JZChangeUserInfo_c*)Jz_initialize{
    JZChangeUserInfo_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  ChangeUserInfo_C]];
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime qphone:(NSString *)_qphone qpassword:(NSString *)_qpassword qcardid:(NSString *)_qcardid qusername:(NSString *)_qusername qrealname:(NSString *)_qrealname qtel:(NSString *)_qtel qemail:(NSString *)_qemail qsex:(NSString *)_qsex qage:(NSString *)_qage qshouquannum:(NSString *)_qshouquannum qweixin:(NSString *)_qweixin qqq:(NSString *)_qqq qwangwang:(NSString *)_qwangwang qtaobao:(NSString *)_qtaobao qtaobaourl:(NSString *)_qtaobaourl qstate:(NSString *)_qstate qlevel:(NSString *)_qlevel qvideoaccessllevel:(NSString *)_qvideoaccessllevel qhonestlevel:(NSString *)_qhonestlevel qreceivemsg:(NSString *)_qreceivemsg{
    
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setQphone:_qphone];
    [self setQpassword:_qpassword];
    [self setQcardid:_qcardid];
    [self setQusername:_qusername];
    [self setQrealname:_qrealname];
    [self setQtel:_qtel];
    [self setQemail:_qemail];
    [self setQsex:_qsex];
    [self setQage:_qage];
    [self setQshouquannum:_qshouquannum];
    [self setQweixin:_qweixin];
    [self setQqq:_qqq];
    [self setQwangwang:_qwangwang];
    [self setQtaobao:_qtaobao];
    [self setQtaobaourl:_qtaobaourl];
    [self setQstate:_qstate];
    [self setQlevel:_qlevel];
    [self setQvideoaccessllevel:_qvideoaccessllevel];
    [self setQhonestlevel:_qhonestlevel];
    [self setQreceivemsg:_qreceivemsg];



}
@end
