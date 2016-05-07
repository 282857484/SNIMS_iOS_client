//
//  JZ_agreement_s.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZ_agreement_s : JZGetValueInDictionary{

@private
    NSString* getVedio ;//获取视屏列表
    NSString* jz_register ;//注册用户
    NSString* login ;//登录用户
    NSString* getInviteNum ;//获取邀请码
    NSString* Submit_S ;//提交订单
    NSString* accept_S ;//接受订单
    NSString* sendMoney_S ;//打款与截图上传
    NSString* sendGoods_S ;//发货
    NSString* receiveGoods_S ;//收获
    NSString* login_S ;
    NSString* Chat_S ;
    NSString* getDownLevel_S ;//获取用户关系
    NSString* getGoodsInfo_S ;//获取货物关系
    NSString* getUserInfo_S ;//获取用户信息
    NSString* getBillInfo_S ;//获取账单信息
    NSString* getNews_S ;//获取新闻列表与链接
    NSString* ChangeUserInfo_S ;//改变用户个人信息
    NSString* getFriendsCircle_S;//获取朋友圈信息
    NSString* getNickName_S;//获取用户昵称
    NSString* getHotNews_S;//获取热门资讯
    
    NSString* changeUserCredit_S ;//获取账单信息
    NSString* getUserCredit_S ;//获取新闻列表与链接
    NSString* getCreditGood_S ;//改变用户个人信息
    NSString* addCreditBil_S;//获取朋友圈信息
    NSString* changeCreditBil_S;//获取用户昵称
    NSString* getCreditBil_S;//获取热门资讯
    NSString* getGoodinfoNew_S;//获取商品对应的名称和积分
}
@property(nonatomic, copy) NSString* getVedio;
@property(nonatomic, copy) NSString* jz_register;
@property(nonatomic, copy) NSString* login;
@property(nonatomic, copy) NSString* getInviteNum;
@property(nonatomic, copy) NSString* Submit_S;
@property(nonatomic, copy) NSString* accept_S;
@property(nonatomic, copy) NSString* sendMoney_S;
@property(nonatomic, copy) NSString* sendGoods_S;
@property(nonatomic, copy) NSString* receiveGoods_S;
@property(nonatomic, copy) NSString* login_S;
@property(nonatomic, copy) NSString* Chat_S;
@property(nonatomic, copy) NSString* getDownLevel_S;
@property(nonatomic, copy) NSString* getGoodsInfo_S;
@property(nonatomic, copy) NSString* getUserInfo_S;
@property(nonatomic, copy) NSString* getBillInfo_S;
@property(nonatomic, copy) NSString* getNews_S;
@property(nonatomic, copy) NSString* ChangeUserInfo_S;
@property(nonatomic, copy) NSString* getFriendsCircle_S;
@property(nonatomic, copy) NSString* getNickName_S;
@property(nonatomic, copy) NSString* getHotNews_S;

@property(nonatomic, copy) NSString* changeUserCredit_S;
@property(nonatomic, copy) NSString* getUserCredit_S;
@property(nonatomic, copy) NSString* getCreditGood_S;
@property(nonatomic, copy) NSString* addCreditBil_S;
@property(nonatomic, copy) NSString* changeCreditBil_S;
@property(nonatomic, copy) NSString* getCreditBil_S;
@property(nonatomic, copy) NSString* getGoodinfoNew_S;

+(JZ_agreement_s*)Jz_initialize;
-(void)Jz_setValue;

@end
