//
//  JZRegister_C.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZRegister_C.h"
#import "JZ_agreement_c.h"
@implementation JZRegister_C

@synthesize p;
@synthesize UploadTime;
@synthesize qphone;
@synthesize qpassword;
@synthesize qcardid;
@synthesize qusername;
@synthesize qrealname;
@synthesize qtel;
@synthesize qemail;
@synthesize qsex;
@synthesize qage;
@synthesize qshouquannum;
@synthesize qweixin;
@synthesize qqq;
@synthesize qinvitenum;
@synthesize qwangwang;
@synthesize qtaobao;
@synthesize qtaobaourl;
@synthesize qstate;
@synthesize qformattime;
@synthesize qlevel;
@synthesize qvideoaccessllevel;
@synthesize qhonestlevel;
@synthesize qreceivemsg;
@synthesize q_group_direct_id;
@synthesize q_group_higher_id;
@synthesize q_group_public_id;
@synthesize q_group_same_id;
@synthesize qgoodsnum;
@synthesize blackloggoods;
@synthesize deliverygoods;
+(JZRegister_C*)Jz_initialize{
    JZRegister_C* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  jz_register]];
    
}
-(void)initWithInfo:(NSString *)saysomething UploadTime:(NSString *)_UploadTime qphone:(NSString *)_qphone qpassword:(NSString *)_qpassword qcardid:(NSString *)_qcardid qusername:(NSString *)_qusername qrealname:(NSString *)_qrealname qtel:(NSString *)_qtel qemail:(NSString *)_qemail qsex:(NSString *)_qsex qage:(NSString *)_qage qshouquannum:(NSString *)_qshouquannum qweixin:(NSString *)_qweixin qqq:(NSString *)_qqq qinvitenum:(NSString *)_qinvitenum qwangwang:(NSString *)_qwangwang qtaobao:(NSString *)_qtaobao qtaobaourl:(NSString *)_qtaobaourl qstate:(NSString *)_qstate qformattime:(NSString *)_qformattime qlevel:(NSString *)_qlevel qvideoaccessllevel:(NSString *)_qvideoaccessllevel qhonestlevel:(NSString *)_qhonestlevel qreceivemsg:(NSString *)_qreceivemsg q_group_direct_id:(NSString *)_q_group_direct_id q_group_higher_id:(NSString *)_q_group_higher_id q_group_public_id:(NSString *)_q_group_public_id q_group_same_id:(NSString *)_q_group_same_id qgoodsnum:(NSString *)_qgoodsnum blackloggoods:(NSString *)_blackloggoods deliverygoods:(NSString *)_deliverygoods{
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
    [self setQinvitenum:_qinvitenum];
    [self setQwangwang:_qwangwang];
    [self setQtaobao:_qtaobao];
    [self setQtaobaourl:_qtaobaourl];
    [self setQstate:_qstate];
    [self setQformattime:_qformattime];
    [self setQlevel:_qlevel];
    [self setQvideoaccessllevel:_qvideoaccessllevel];
    [self setQhonestlevel:_qhonestlevel];
    [self setQreceivemsg:_qreceivemsg];
    [self setQ_group_direct_id:_q_group_direct_id];
    [self setQ_group_higher_id:_q_group_higher_id];
    [self setQ_group_public_id:_q_group_public_id];
    [self setQ_group_same_id:_q_group_same_id];
    [self setQgoodsnum:_qgoodsnum];
    [self setBlackloggoods:_blackloggoods];
    [self setDeliverygoods:_deliverygoods];
}
@end