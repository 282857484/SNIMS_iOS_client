//
//  JZ_tag.h
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZ_tag :JZGetValueInDictionary{
    
   @private
    NSString* VedioSelectData ;
    NSString* InviteSelectData ;
    NSString* UserSelectData ;
    NSString* LevelRelationSelectData ;
    NSString* AuthorizeSelectData ;
    NSString* GoodsInfoSelectData ;
    NSString* OrgChat ;
    NSString* OneChat ;
    NSString* SChat ;
    NSString* BillSelectData ;
    NSString* NewsSelectData ;
    NSString* HotNews;
    
    NSString* UserCreditData ;
    NSString* CreditGoodData ;
    NSString* CreditBillData;
    NSString* NewGoodinfoData;
}
@property(nonatomic, copy) NSString* VedioSelectData;
@property(nonatomic, copy) NSString* InviteSelectData;
@property(nonatomic, copy) NSString* UserSelectData;
@property(nonatomic, copy) NSString* LevelRelationSelectData;
@property(nonatomic, copy) NSString* AuthorizeSelectData;
@property(nonatomic, copy) NSString* GoodsInfoSelectData;
@property(nonatomic, copy) NSString* OrgChat;
@property(nonatomic, copy) NSString* OneChat;
@property(nonatomic, copy) NSString* SChat;
@property(nonatomic, copy) NSString* BillSelectData;
@property(nonatomic, copy) NSString* NewsSelectData;
@property(nonatomic, copy) NSString* HotNews;

@property(nonatomic, copy) NSString* UserCreditData;
@property(nonatomic, copy) NSString* CreditGoodData;
@property(nonatomic, copy) NSString* CreditBillData;
@property(nonatomic, copy) NSString* NewGoodinfoData;

+(JZ_tag*)Jz_initialize;
-(void)Jz_setValue;

@end
