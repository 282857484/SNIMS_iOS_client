//
//  NewGoodinfoData.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface NewGoodinfoData : JZGetValueInDictionary
{
@private
    NSString * goodsid;
    NSString * goodsname ;
    NSString * QCredit ;
}
@property(nonatomic, copy) NSString * goodsid;
@property(nonatomic, copy) NSString * goodsname;
@property(nonatomic, copy) NSString * QCredit;

+(NewGoodinfoData*)Jz_initialize;
-(void)Jz_setValue;


-(void)initWithInfo:(NSString*)_saysomething
            goodsid:(NSString*)_goodsid
          goodsname:(NSString*)_goodsname
            QCredit:(NSString*)_QCredit
;

@end