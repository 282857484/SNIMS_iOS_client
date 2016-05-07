//
//  JZChangeUserInfo_c.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZChangeUserInfo_c : JZGetValueInDictionary{
@private
    NSString* p ;
    NSString* UserID ;
    NSString* UploadTime ;
    NSString* qphone ;
    NSString* qpassword ;
    NSString* qcardid ;
    NSString* qusername ;
    NSString* qrealname ;
    NSString* qtel ;
    NSString* qemail ;
    NSString* qsex ;
    NSString* qage ;
    NSString* qshouquannum ;
    NSString* qweixin ;
    NSString* qqq;
    NSString* qwangwang ;
    NSString* qtaobao ;
    NSString* qtaobaourl ;
    NSString* qstate ;
    NSString* qlevel ;
    NSString* qvideoaccessllevel ;
    NSString* qhonestlevel ;
    NSString* qreceivemsg ;

}


@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
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
@property(nonatomic, copy) NSString* qwangwang;
@property(nonatomic, copy) NSString* qtaobao;
@property(nonatomic, copy) NSString* qtaobaourl;
@property(nonatomic, copy) NSString* qstate;
@property(nonatomic, copy) NSString* qlevel;
@property(nonatomic, copy) NSString* qvideoaccessllevel;
@property(nonatomic, copy) NSString* qhonestlevel;
@property(nonatomic, copy) NSString* qreceivemsg;
+(JZChangeUserInfo_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
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
          qwangwang:(NSString*)_qwangwang
            qtaobao:(NSString*)_qtaobao
         qtaobaourl:(NSString*)_qtaobaourl
             qstate:(NSString*)_qstate
             qlevel:(NSString*)_qlevel
 qvideoaccessllevel:(NSString*)_qvideoaccessllevel
       qhonestlevel:(NSString*)_qhonestlevel
        qreceivemsg:(NSString*)_qreceivemsg;

















@end
