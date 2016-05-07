//
//  UserSeletData.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-20.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface UserSeletData : JZGetValueInDictionary{
    @private
    NSString* quserid;//翘课人id
    NSString* qhigherid;//上级id
    NSString* qphone;//手机号码
    NSString* qpassword;//密码
    NSString* qcardid;//身份证号
    NSString* qusername;//用户名
    NSString* qrealname;//真实姓名
    NSString* qtel;//联系电话
    NSString* qemail;//邮箱
    NSString* qsex;
    NSString* qage;//12//
    NSString* qshouquannum;//6//  //授权号
    NSString* qweixin ;//7//
    NSString* qqq ;//8//
    NSString* qinvitenum ;//
    NSString* qwangwang ;//9//
    NSString* qtaobao ;//
    NSString* qtaobaourl ;//
    NSString* qstate ;// //状态
    NSString* qformattime ;// 注册时间
    NSString* qlevel ;//  自己的级别
    NSString* qvideoaccessllevel ;// 对应电影级别
    NSString* qhonestlevel ;// 上级级别
    NSString* qreceivemsg ;//
    NSString* q_group_direct_id ;//
    NSString* q_group_higher_id ;//
    NSString* q_group_public_id ;//
    NSString* q_group_same_id ;//
    NSString* qgoodsnum ;//
    NSString* blackloggoods ;//
    NSString* deliverygoods ;//
    
    //临时调用
    NSString *plistPath;

    

}
@property(nonatomic, copy) NSString* quserid;
@property(nonatomic, copy) NSString* qhigherid;
@property(nonatomic, copy) NSString* qphone;
@property(nonatomic, copy) NSString* qpassword;
@property(nonatomic, copy) NSString* qcardid;
@property(nonatomic, copy) NSString* qusername;
@property(nonatomic, copy) NSString* qrealname;
@property(nonatomic, copy) NSString* qtel;
@property(nonatomic, copy) NSString* qemail;
@property(nonatomic, copy) NSString* qsex;
@property(nonatomic, copy) NSString* qage;//12//
@property(nonatomic, copy) NSString* qshouquannum;//6//
@property(nonatomic, copy) NSString* qweixin ;//7//
@property(nonatomic, copy) NSString* qqq ;//8//
@property(nonatomic, copy) NSString* qinvitenum ;//
@property(nonatomic, copy) NSString* qwangwang ;//9//
@property(nonatomic, copy) NSString* qtaobao ;//
@property(nonatomic, copy) NSString* qtaobaourl ;//
@property(nonatomic, copy) NSString* qstate ;//
@property(nonatomic, copy) NSString* qformattime ;//
@property(nonatomic, copy) NSString* qlevel ;//
@property(nonatomic, copy) NSString* qvideoaccessllevel ;//
@property(nonatomic, copy) NSString* qhonestlevel ;//
@property(nonatomic, copy) NSString* qreceivemsg ;//
@property(nonatomic, copy) NSString* q_group_direct_id ;//
@property(nonatomic, copy) NSString* q_group_higher_id ;//
@property(nonatomic, copy) NSString* q_group_public_id ;//
@property(nonatomic, copy) NSString* q_group_same_id ;//
@property(nonatomic, copy) NSString* qgoodsnum ;//
@property(nonatomic, copy) NSString* blackloggoods ;//
@property(nonatomic, copy) NSString* deliverygoods ;//
-(void)isValid;
+(id) instance2;
-(void)initWithInfo:(NSString*)saysomething
                      quserid:(NSString*)_quserid
                    qhigherid:(NSString*)_qhigherid
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






//-(UserSeletData*)init
@end
