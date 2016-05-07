//
//  JZRegister_C.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZRegister_C : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* UploadTime;
    NSString* qphone;
    NSString* qpassword;
    NSString* qcardid;
    NSString* qusername;
    NSString* qrealname;
    NSString* qtel;
    NSString* qemail;
    NSString* qsex;
    NSString* qage;
    NSString* qshouquannum;
    NSString* qweixin;
    NSString* qqq;
    NSString* qinvitenum;
    NSString* qwangwang;
    NSString* qtaobao;
    NSString* qtaobaourl;
    NSString* qstate;
    NSString* qformattime;
    NSString* qlevel;
    NSString* qvideoaccessllevel;
    NSString* qhonestlevel;
    NSString* qreceivemsg;
    NSString* q_group_direct_id;
    NSString* q_group_higher_id;
    NSString* q_group_public_id;
    NSString* q_group_same_id;
    NSString* qgoodsnum;
    NSString* blackloggoods;
    NSString* deliverygoods;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* qphone;
@property(nonatomic, copy) NSString* qpassword;
@property(nonatomic, copy) NSString* qcardid;
@property(nonatomic, copy) NSString* qusername;
@property(nonatomic, copy) NSString* qrealname;
@property(nonatomic, copy) NSString* qtel;
@property(nonatomic, copy) NSString* qemail;
@property(nonatomic, copy) NSString* qsex;
@property(nonatomic, copy) NSString* qage;
@property(nonatomic, copy) NSString* qshouquannum;
@property(nonatomic, copy) NSString* qweixin;
@property(nonatomic, copy) NSString* qqq;
@property(nonatomic, copy) NSString* qinvitenum;
@property(nonatomic, copy) NSString* qwangwang;
@property(nonatomic, copy) NSString* qtaobao;
@property(nonatomic, copy) NSString* qtaobaourl;
@property(nonatomic, copy) NSString* qstate;
@property(nonatomic, copy) NSString* qformattime;
@property(nonatomic, copy) NSString* qlevel;
@property(nonatomic, copy) NSString* qvideoaccessllevel;
@property(nonatomic, copy) NSString* qhonestlevel;
@property(nonatomic, copy) NSString* qreceivemsg;
@property(nonatomic, copy) NSString* q_group_direct_id;
@property(nonatomic, copy) NSString* q_group_higher_id;
@property(nonatomic, copy) NSString* q_group_public_id;
@property(nonatomic, copy) NSString* q_group_same_id;
@property(nonatomic, copy) NSString* qgoodsnum;
@property(nonatomic, copy) NSString* blackloggoods;
@property(nonatomic, copy) NSString* deliverygoods;
+(JZRegister_C*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
            UploadTime:(NSString*)_UploadTime
             qphone:(NSString*)_qphone
      qpassword:(NSString*)_qpassword
         qcardid:(NSString*)_qcardid
         qusername:(NSString*)_qusername
        qrealname:(NSString*)_qrealname
        qtel:(NSString*)_qtel
             qemail:(NSString*)_qemail
             qsex:(NSString*)_qsex
             qage:(NSString*)_qage
             qshouquannum:(NSString*)_qshouquannum
             qweixin:(NSString*)_qweixin
             qqq:(NSString*)_qqq
             qinvitenum:(NSString*)_qinvitenum
             qwangwang:(NSString*)_qwangwang
             qtaobao:(NSString*)_qtaobao
             qtaobaourl:(NSString*)_qtaobaourl
             qstate:(NSString*)_qstate
             qformattime:(NSString*)_qformattime
                qlevel:(NSString*)_qlevel
             qvideoaccessllevel:(NSString*)_qvideoaccessllevel
             qhonestlevel:(NSString*)_qhonestlevel
             qreceivemsg:(NSString*)_qreceivemsg
             q_group_direct_id:(NSString*)_q_group_direct_id
             q_group_higher_id:(NSString*)_q_group_higher_id
             q_group_public_id:(NSString*)_q_group_public_id
             q_group_same_id:(NSString*)_q_group_same_id
             qgoodsnum:(NSString*)_qgoodsnum
             blackloggoods:(NSString*)_blackloggoods
     deliverygoods:(NSString*)_deliverygoods;

@end