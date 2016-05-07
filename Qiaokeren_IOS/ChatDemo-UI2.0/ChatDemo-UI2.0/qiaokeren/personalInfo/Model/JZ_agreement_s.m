//
//  JZ_agreement_s.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZ_agreement_s.h"

@implementation JZ_agreement_s

@synthesize  getVedio;
@synthesize  jz_register;
@synthesize  login;
@synthesize  getInviteNum;
@synthesize Submit_S;
@synthesize accept_S;
@synthesize sendMoney_S;
@synthesize sendGoods_S;
@synthesize receiveGoods_S;
@synthesize login_S;
@synthesize Chat_S;
@synthesize getDownLevel_S;
@synthesize getGoodsInfo_S;
@synthesize getUserInfo_S;
@synthesize getBillInfo_S;
@synthesize getNews_S;
@synthesize ChangeUserInfo_S;
@synthesize getFriendsCircle_S;
@synthesize getNickName_S;
@synthesize getHotNews_S;

@synthesize changeUserCredit_S;
@synthesize getUserCredit_S;
@synthesize getCreditGood_S;
@synthesize addCreditBil_S;
@synthesize changeCreditBil_S;
@synthesize getCreditBil_S;
@synthesize getGoodinfoNew_S;

+(JZ_agreement_s*)Jz_initialize;{
    JZ_agreement_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
    
}
-(void)Jz_setValue{
    [self setGetVedio:@"5001"];
    [self setJz_register:@"5002"];
    [self setLogin:@"5003"];
    [self setGetInviteNum:@"5004"];
    [self setSubmit_S:@"5005"];
    [self setAccept_S:@"5006"];
    [self setSendMoney_S:@"5007"];
    [self setSendGoods_S:@"5008"];
    [self setReceiveGoods_S:@"5009"];
    [self setLogin_S:@"5010"];
    [self setChat_S:@"5011"];
    [self setGetDownLevel_S:@"5012"];
    [self setGetGoodsInfo_S:@"5013"];
    [self setGetUserInfo_S:@"5014"];
    [self setGetBillInfo_S:@"5015"];
    [self setGetNews_S:@"5016"];
    [self setChangeUserInfo_S:@"5017"];
    [self setGetFriendsCircle_S:@"5018"];
    [self setGetNickName_S:@"5019"];
    [self setGetHotNews_S:@"5101"];
    
    [self setChangeUserCredit_S:@"916"];
    [self setGetUserCredit_S:@"917"];
    [self setGetCreditGood_S:@"918"];
    [self setAddCreditBil_S:@"919"];
    [self setChangeCreditBil_S:@"920"];
    [self setGetCreditBil_S:@"921"];
    [self setGetGoodinfoNew_S:@"923"];
}

@end
