//
//  JZ_agreement.h
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZ_agreement_c : JZGetValueInDictionary{
    
    //这个是
@private
    NSString* getVedio ;//获取视屏列表
    NSString* jz_register ;//注册用户
    NSString* login ;//登录用户
    NSString* getInviteNum ;//获取邀请码
    NSString* Submit_C ;//提交订单
    NSString* accept_C ;//接受订单
    NSString* sendMoney_C ;//打款与截图上传
    NSString* sendGoods_C ;//发货
    NSString* receiveGoods_C ;//收获
    NSString* login_C ;
    NSString* Chat_C ;
    NSString* getDownLevel_C ;//获取用户关系
    NSString* getGoodsInfo_C ;//获取货物关系
    NSString* getUserInfo_C ;//获取用户信息
    NSString* getBillInfo_C ;//获取账单信息
    NSString* getNews_C ;//获取新闻列表与链接
    NSString* ChangeUserInfo_C ;//改变用户个人信息
    NSString* getFriendsCircle_C;//获取要发送朋友圈的信息
    NSString* getNickName_C;//获取用户昵称
    NSString* getHotNews_C;//获取推荐热门资讯
    
    NSString* changeUserCredit_C ;//修改用户积分
    NSString* getUserCredit_C ;//获取用户积分
    NSString* getCreditGood_C ;//获取积分商品
    NSString* addCreditBil_C ;//添加积分账单
    NSString* changeCreditBil_C ;//修改积分积分账单
    NSString* getCreditBil_C ;//获取积分账单
    NSString* getGoodinfoNew_C ;//获取商品对应的名称和积分
}
@property(nonatomic, copy) NSString* getVedio;
@property(nonatomic, copy) NSString* jz_register;
@property(nonatomic, copy) NSString* login;
@property(nonatomic, copy) NSString* getInviteNum;
@property(nonatomic, copy) NSString* Submit_C;
@property(nonatomic, copy) NSString* accept_C;
@property(nonatomic, copy) NSString* sendMoney_C;
@property(nonatomic, copy) NSString* sendGoods_C;
@property(nonatomic, copy) NSString* receiveGoods_C;
@property(nonatomic, copy) NSString* login_C;
@property(nonatomic, copy) NSString* Chat_C;
@property(nonatomic, copy) NSString* getDownLevel_C;
@property(nonatomic, copy) NSString* getGoodsInfo_C;
@property(nonatomic, copy) NSString* getUserInfo_C;
@property(nonatomic, copy) NSString* getBillInfo_C;
@property(nonatomic, copy) NSString* getNews_C;
@property(nonatomic, copy) NSString* ChangeUserInfo_C;
@property(nonatomic, copy) NSString* getFriendsCircle_C;
@property(nonatomic, copy) NSString* getNickName_C;
@property(nonatomic, copy) NSString* getHotNews_C;

@property(nonatomic, copy) NSString* changeUserCredit_C;
@property(nonatomic, copy) NSString* getUserCredit_C;
@property(nonatomic, copy) NSString* getCreditGood_C;
@property(nonatomic, copy) NSString* addCreditBil_C;
@property(nonatomic, copy) NSString* changeCreditBil_C;
@property(nonatomic, copy) NSString* getCreditBil_C;
@property(nonatomic, copy) NSString* getGoodinfoNew_C ;

+(JZ_agreement_c*)Jz_initialize;
-(void)Jz_setValue;
@end
