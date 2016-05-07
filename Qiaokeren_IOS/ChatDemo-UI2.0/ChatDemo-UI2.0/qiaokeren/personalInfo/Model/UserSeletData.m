//
//  UserSeletData.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-20.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "UserSeletData.h"
#define InformationPlistName @"PersonalInformation"

@implementation UserSeletData
@synthesize  quserid;
@synthesize  qhigherid;
@synthesize  qphone;
@synthesize  qpassword;
@synthesize qcardid;
@synthesize qusername;
@synthesize qrealname;
@synthesize qtel;
@synthesize qemail;
@synthesize qsex;
@synthesize qage;//12//
@synthesize qshouquannum;//6//
@synthesize qweixin ;//7//
@synthesize qqq ;//8//
@synthesize qinvitenum ;//
@synthesize qwangwang ;//9//
@synthesize qtaobao ;//
@synthesize qtaobaourl ;//
@synthesize qstate ;//
@synthesize qformattime ;//
@synthesize qlevel ;//
@synthesize qvideoaccessllevel ;//
@synthesize qhonestlevel ;//
@synthesize qreceivemsg ;//
@synthesize q_group_direct_id ;//
@synthesize q_group_higher_id ;//
@synthesize q_group_public_id ;//
@synthesize q_group_same_id ;//
@synthesize qgoodsnum ;//
@synthesize blackloggoods ;//
@synthesize deliverygoods ;//
-(void)isValid{
    plistPath = [[NSBundle mainBundle] pathForResource:InformationPlistName ofType:@"plist"];
    NSDictionary* dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSDictionary* personInfo = [dictionary objectForKey:@"personal"];
    [self setQuserid:[personInfo objectForKey:@"quserid"]];
    [self setQhigherid:[personInfo objectForKey:@"qhigherid"]];
    [self setQphone:[personInfo objectForKey:@"qphone"]];
    [self setQpassword:[personInfo objectForKey:@"qpassword"]];
    [self setQcardid:[personInfo objectForKey:@"qcardid"]];
    [self setQusername:[personInfo objectForKey:@"qusername"]];
    [self setQrealname:[personInfo objectForKey:@"qrealname"]];
    [self setQtel:[personInfo objectForKey:@"qtel"  ]];
    [self setQemail:[personInfo objectForKey:@"qemail"]];
    [self setQsex:[personInfo objectForKey:@"qsex"]];
    [self setQage:[personInfo objectForKey:@"qage"]];
    [self setQshouquannum:[personInfo objectForKey:@"qshouquannum"]];
    [self setQweixin:[personInfo objectForKey:@"qweixin"]];
    [self setQqq:[personInfo objectForKey:@"qqq"]];
    [self setQinvitenum:[personInfo objectForKey:@"qinvitenum"]];
    [self setQwangwang:[personInfo objectForKey:@"qwangwang"]];
    [self setQtaobao:[personInfo objectForKey:@"qtaobao"]];
    [self setQtaobaourl:[personInfo objectForKey:@"qtaobaourl"]];
    [self setQstate:[personInfo objectForKey:@"qstate "]];
    [self setQformattime:[personInfo objectForKey:@"qformattime"]];
    [self setQlevel:[personInfo objectForKey:@"qlevel"] ];
    [self setQvideoaccessllevel:[personInfo objectForKey:@"qvideoaccessllevel"]];
    [self setQhonestlevel:[personInfo objectForKey:@"qhonestlevel"]];
    [self setQreceivemsg:[personInfo objectForKey:@"qreceivemsg"]];
    [self setQ_group_direct_id:[personInfo objectForKey:@"q_group_direct_id"]];
    [self setQ_group_higher_id:[personInfo objectForKey:@"q_group_higher_id"]];
    [self setQ_group_public_id:[personInfo objectForKey:@"q_group_public_id"]];
    [self setQ_group_same_id:[personInfo objectForKey:@"q_group_same_id"]];
    [self setQgoodsnum:[personInfo objectForKey:@"qgoodsnum"]];
    [self setBlackloggoods:[personInfo objectForKey:@"blacklogoods"]];
    [self setDeliverygoods:[personInfo objectForKey:@"deliverygoods"]];
}

// 会导致数据错误的一种实例方法
//+(id)instance22
//{
//    if (!instance2) {
//        instance2 = [[super alloc]init];
//        return instance2;
//    }
//    return instance2;
//}
+(id)instance2
{
    id instance2 = [[super alloc]init];
    return instance2;
}
-(void)initWithInfo:(NSString *)saysomething quserid:(NSString *)_quserid qhigherid:(NSString *)_qhigherid qphone:(NSString *)_qphone qpassword:(NSString *)_qpassword qcardid:(NSString *)_qcardid qusername:(NSString *)_qusername qrealname:(NSString *)_qrealname qtel:(NSString *)_qtel qemail:(NSString *)_qemail qsex:(NSString *)_qsex qage:(NSString *)_qage qshouquannum:(NSString *)_qshouquannum qweixin:(NSString *)_qweixin qqq:(NSString *)_qqq qinvitenum:(NSString *)_qinvitenum qwangwang:(NSString *)_qwangwang qtaobao:(NSString *)_qtaobao qtaobaourl:(NSString *)_qtaobaourl qstate:(NSString *)_qstate qformattime:(NSString *)_qformattime qlevel:(NSString *)_qlevel qvideoaccessllevel:(NSString *)_qvideoaccessllevel qhonestlevel:(NSString *)_qhonestlevel qreceivemsg:(NSString *)_qreceivemsg q_group_direct_id:(NSString *)_q_group_direct_id q_group_higher_id:(NSString *)_q_group_higher_id q_group_public_id:(NSString *)_q_group_public_id q_group_same_id:(NSString *)_q_group_same_id qgoodsnum:(NSString *)_qgoodsnum blackloggoods:(NSString *)_blackloggoods deliverygoods:(NSString *)_deliverygoods{
    
    NSLog(@"%@",saysomething);

        [self setQuserid:_quserid];
        [self setQhigherid:_qhigherid];
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
        [self setQstate:_qstate ];
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
