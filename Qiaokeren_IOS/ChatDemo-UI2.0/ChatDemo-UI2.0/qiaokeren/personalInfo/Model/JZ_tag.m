//
//  JZ_tag.m
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import "JZ_tag.h"

@implementation JZ_tag


@synthesize  VedioSelectData;
@synthesize  InviteSelectData;
@synthesize  UserSelectData;
@synthesize  LevelRelationSelectData;
@synthesize AuthorizeSelectData;
@synthesize GoodsInfoSelectData;
@synthesize OrgChat;
@synthesize OneChat;
@synthesize SChat;
@synthesize BillSelectData;
@synthesize NewsSelectData;
@synthesize HotNews;

@synthesize UserCreditData;
@synthesize CreditGoodData;
@synthesize CreditBillData;
@synthesize NewGoodinfoData;

+(JZ_tag*)Jz_initialize{
    JZ_tag* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    [self setVedioSelectData:@"1"];
    [self setInviteSelectData:@"2"];
    [self setUserSelectData:@"3"];
    [self setLevelRelationSelectData:@"4"];
    [self setAuthorizeSelectData:@"5"];
    [self setGoodsInfoSelectData:@"6"];
    [self setOrgChat:@"7"];
    [self setOneChat:@"8"];
    [self setSChat:@"9"];
    [self setBillSelectData:@"10"];
    [self setNewsSelectData:@"11"];
    [self setHotNews:@"12"];
    
    [self setUserCreditData:@"14"];
    [self setCreditGoodData:@"15"];
    [self setCreditBillData:@"16"];
    [self setNewGoodinfoData:@"17"];
}
@end
