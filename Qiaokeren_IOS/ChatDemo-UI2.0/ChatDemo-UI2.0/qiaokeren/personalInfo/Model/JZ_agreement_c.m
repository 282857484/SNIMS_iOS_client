//
//  JZ_agreement.m
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import "JZ_agreement_c.h"

@implementation JZ_agreement_c



@synthesize  getVedio;
@synthesize  jz_register;
@synthesize  login;
@synthesize  getInviteNum;
@synthesize Submit_C;
@synthesize accept_C;
@synthesize sendMoney_C;
@synthesize sendGoods_C;
@synthesize receiveGoods_C;
@synthesize login_C;
@synthesize Chat_C;
@synthesize getDownLevel_C;
@synthesize getGoodsInfo_C;
@synthesize getUserInfo_C;
@synthesize getBillInfo_C;
@synthesize getNews_C;
@synthesize ChangeUserInfo_C;
@synthesize getFriendsCircle_C;
@synthesize getNickName_C;
@synthesize getHotNews_C;

@synthesize changeUserCredit_C ;//修改用户积分
@synthesize getUserCredit_C ;//获取用户积分
@synthesize getCreditGood_C ;//获取积分商品
@synthesize addCreditBil_C ;//添加积分账单
@synthesize changeCreditBil_C ;//修改积分积分账单
@synthesize getCreditBil_C ;//获取积分账单
@synthesize getGoodinfoNew_C ;//获取商品对应的名称和积分

+(JZ_agreement_c*)Jz_initialize;{
    JZ_agreement_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;

}
-(void)Jz_setValue{
    [self setGetVedio:@"1001"];
    [self setJz_register:@"1002"];
    [self setLogin:@"1003"];
    [self setGetInviteNum:@"1004"];
    [self setSubmit_C:@"1005"];
    [self setAccept_C:@"1006"];
    [self setSendMoney_C:@"1007"];
    [self setSendGoods_C:@"1008"];
    [self setReceiveGoods_C:@"1009"];
    [self setLogin_C:@"1010"];
    [self setChat_C:@"1011"];
    [self setGetDownLevel_C:@"1012"];
    [self setGetGoodsInfo_C:@"1013"];
    [self setGetUserInfo_C:@"1014"];
    [self setGetBillInfo_C:@"1015"];
    [self setGetNews_C:@"1016"];
    [self setChangeUserInfo_C:@"1017"];
    [self setGetFriendsCircle_C:@"1018"];
    [self setGetNickName_C:@"1019"];
    [self setGetHotNews_C:@"1101"];
    
    [self setChangeUserCredit_C:@"416"];
    [self setGetUserCredit_C:@"417"];
    [self setGetCreditGood_C:@"418"];
    [self setAddCreditBil_C:@"419"];
    [self setChangeCreditBil_C:@"420"];
    [self setGetCreditBil_C:@"421"];
    [self setGetGoodinfoNew_C:@"423"];
}
@end
